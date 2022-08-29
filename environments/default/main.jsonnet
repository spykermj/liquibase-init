local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';

{
  _config:: {
    hello: {
      port: 5000,
      name: 'hello-flask',
      init: {
        data: {
          'bootstrap-changelog.sql': |||
            --liquibase formatted sql

            -- the bootstrap changelog file is for creating databases and users
            -- this cannot be done in a normal way because the may not already exist
            -- so we have to connect to the postgres database for DB and user creation

            --changeset jeremyspykerman:1 runInTransaction:false
            --comment: create database
            CREATE DATABASE "exampledb";
            --rollback DROP DATABASE "exampledb";
          |||,
          'bootstrap.properties': |||
            url: jdbc:postgresql://192.168.1.101:5432/postgres
            username: postgres
            changeLogFile: bootstrap-changelog.sql
            liquibase.hub.mode=off
          |||,
        },
        workingDir: '/schema',
      },
      command: [
        'liquibase',
        '--defaults-file',
        'bootstrap.properties',
        'update',
        '--password',
        'notasecret',
      ],
    },
  },

  _images:: {
    hello: {
      application: 'jeremyspykerman/hello-flask:0.0.4',
      init: 'liquibase/liquibase:4.15',
    },
  },

  local deployment = k.apps.v1.deployment,
  local container = k.core.v1.container,
  local configMap = k.core.v1.configMap,
  local port = k.core.v1.containerPort,
  local service = k.core.v1.service,
  local namespace = k.core.v1.namespace,
  local withInitContainers = deployment.spec.template.spec.withInitContainers,
  local helloContainer = container.new($._config.hello.name, $._images.hello.application) +
                         container.withPorts([port.new('api', $._config.hello.port)]),
  local init1 = container.new($._config.hello.name + '-init', $._images.hello.init) +
                container.withCommand($._config.hello.command) +
                container.withVolumeMounts([k.core.v1.volumeMount.new('init-config', $._config.hello.init.workingDir, false)]) +
                container.withWorkingDir($._config.hello.init.workingDir),
  local exampleMap = configMap.new('example', $._config.hello.init.data) +
                     configMap.metadata.withNamespace($._config.hello.name),

  hello: {
    configMap: exampleMap,
    namespace: namespace.new($._config.hello.name),
    deployment: deployment.new(
                  name=$._config.hello.name,
                  replicas=1,
                  containers=[
                    helloContainer,
                  ],
                ) + withInitContainers([init1])
                + deployment.metadata.withNamespace($._config.hello.name)
                + deployment.spec.template.spec.withVolumes([k.core.v1.volume.fromConfigMap('init-config', 'example')]),
    service: k.util.serviceFor(self.deployment),
  },
}

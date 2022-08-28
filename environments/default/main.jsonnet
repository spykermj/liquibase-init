local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';

{
  _config:: {
    hello: {
      port: 5000,
      name: 'hello-flask',
    },
  },

  _images:: {
    hello: {
      application: 'jeremyspykerman/hello-flask:0.0.4',
      init: 'jeremyspykerman/liquibase-init:0.0.2',
    },
  },

  local deployment = k.apps.v1.deployment,
  local container = k.core.v1.container,
  local port = k.core.v1.containerPort,
  local service = k.core.v1.service,
  local namespace = k.core.v1.namespace,
  local withInitContainers = deployment.spec.template.spec.withInitContainers,
  local helloContainer = container.new($._config.hello.name, $._images.hello.application) +
                         container.withPorts([port.new('api', $._config.hello.port)]),
  local init1 = container.new($._config.hello.name + '-init', $._images.hello.init) +
                container.withCommand([
                  'liquibase',
                  '--defaults-file',
                  'bootstrap.properties',
                  'update',
                  '--password',
                  'notasecret',
                ]),

  hello: {
    namespace: namespace.new($._config.hello.name),
    deployment: deployment.new(
      name=$._config.hello.name,
      replicas=1,
      containers=[
        helloContainer,
      ],
    ) + withInitContainers([init1]) + deployment.metadata.withNamespace($._config.hello.name),
    service: k.util.serviceFor(self.deployment),
  },
}

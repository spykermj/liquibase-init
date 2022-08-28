{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='networkPolicySpec', url='', help='"NetworkPolicySpec provides the specification of a NetworkPolicy"'),
  '#podSelector':: d.obj(help='"A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects."'),
  podSelector: {
    '#withMatchExpressions':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."', args=[d.arg(name='matchExpressions', type=d.T.array)]),
    withMatchExpressions(matchExpressions): { podSelector+: { matchExpressions: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } },
    '#withMatchExpressionsMixin':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchExpressions', type=d.T.array)]),
    withMatchExpressionsMixin(matchExpressions): { podSelector+: { matchExpressions+: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } },
    '#withMatchLabels':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."', args=[d.arg(name='matchLabels', type=d.T.object)]),
    withMatchLabels(matchLabels): { podSelector+: { matchLabels: matchLabels } },
    '#withMatchLabelsMixin':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchLabels', type=d.T.object)]),
    withMatchLabelsMixin(matchLabels): { podSelector+: { matchLabels+: matchLabels } },
  },
  '#withEgress':: d.fn(help='"List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8"', args=[d.arg(name='egress', type=d.T.array)]),
  withEgress(egress): { egress: if std.isArray(v=egress) then egress else [egress] },
  '#withEgressMixin':: d.fn(help='"List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='egress', type=d.T.array)]),
  withEgressMixin(egress): { egress+: if std.isArray(v=egress) then egress else [egress] },
  '#withIngress':: d.fn(help="\"List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default)\"", args=[d.arg(name='ingress', type=d.T.array)]),
  withIngress(ingress): { ingress: if std.isArray(v=ingress) then ingress else [ingress] },
  '#withIngressMixin':: d.fn(help="\"List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default)\"\n\n**Note:** This function appends passed data to existing values", args=[d.arg(name='ingress', type=d.T.array)]),
  withIngressMixin(ingress): { ingress+: if std.isArray(v=ingress) then ingress else [ingress] },
  '#withPolicyTypes':: d.fn(help='"List of rule types that the NetworkPolicy relates to. Valid options are \\"Ingress\\", \\"Egress\\", or \\"Ingress,Egress\\". If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ \\"Egress\\" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include \\"Egress\\" (since such a policy would not include an Egress section and would otherwise default to just [ \\"Ingress\\" ]). This field is beta-level in 1.8"', args=[d.arg(name='policyTypes', type=d.T.array)]),
  withPolicyTypes(policyTypes): { policyTypes: if std.isArray(v=policyTypes) then policyTypes else [policyTypes] },
  '#withPolicyTypesMixin':: d.fn(help='"List of rule types that the NetworkPolicy relates to. Valid options are \\"Ingress\\", \\"Egress\\", or \\"Ingress,Egress\\". If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ \\"Egress\\" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include \\"Egress\\" (since such a policy would not include an Egress section and would otherwise default to just [ \\"Ingress\\" ]). This field is beta-level in 1.8"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='policyTypes', type=d.T.array)]),
  withPolicyTypesMixin(policyTypes): { policyTypes+: if std.isArray(v=policyTypes) then policyTypes else [policyTypes] },
  '#mixin': 'ignore',
  mixin: self,
}

#https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
resource "helm_release" "sealed_secrets_helm" {
  name       = "sealed-secrets"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets"
  version    = "2.10.0"
  namespace  = "kube-system"

  set {
    name  = "fullnameOverride"
    value = "sealed-secrets-controller"
  }
}
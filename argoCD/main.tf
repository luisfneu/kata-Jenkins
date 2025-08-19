
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}

data "helm_repository" "argo" {
  name = "argo"
  url  = "https://argoproj.github.io/argo-helm"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  repository = data.helm_repository.argo.url
  chart      = "argo-cd"
  version    = var.argocd_version

  skip_crds  = false
  create_namespace = false

  values = [
    file("${path.module}/values-argocd.yaml")
  ]
  timeout = 1200
  wait    = true
  atomic  = true
}

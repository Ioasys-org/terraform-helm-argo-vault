resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "4.9.7"
  values           = [file("${path.module}/argocd-vault-plugin.yaml")]
  timeout          = 800

  set_sensitive {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.admin_password
  }

  set {
    name  = "server.extraArgs"
    value = var.insecure == false ? "" : "{--insecure}"
  }

  set {
    name  = "dex.enabled"
    value = var.enable_dex
  }
}

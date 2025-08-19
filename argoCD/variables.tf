variable "kubeconfig_path" {
  description = "Caminho do kubeconfig"
  type        = string
  default     = "~/.kube/config"
}

variable "namespace" {
  description = "Namespace do Argo CD"
  type        = string
  default     = "argocd"
}

variable "argocd_version" {
  description = "Versão do chart argo-cd (do repositório argo-helm)"
  type        = string
  default     = "6.7.15"
}
variable "admin_password" {
  description = "ArgoCD admin password"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "enable_dex" {
  type        = bool
  description = "Enabled the dex server?"
  default     = true
}

variable "insecure" {
  type        = bool
  description = "Disable TLS on the ArogCD API Server? (adds the --insecure flag to the argocd-server command)"
  default     = false
}


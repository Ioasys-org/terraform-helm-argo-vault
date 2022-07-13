terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
  }

  required_version = ">= 1.2.0"
}


provider "helm" {
  kubernetes {
    config_path            = "~/.kube/config"
    config_context_cluster = "arn:aws:eks:us-west-2:146287491997:cluster/basic"
  }
}

module "argocd" {
  source = "../.."

  insecure   = true
  enable_dex = true
}

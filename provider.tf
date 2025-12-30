terraform {
  required_providers {
    harvester = {
      source = "harvester/harvester"
      version = "1.6.0"  # 使用大於等於 0.6.0 的版本
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}

provider "harvester" {
    kubeconfig = "./kubeconfig.conf"
}

provider "kubernetes" {
  config_path    = "./kubeconfig.conf"
  config_context = "default"
}
terraform {
  required_providers {
    harvester = {
      source = "harvester/harvester"
      version = "x.x.x" /* replace version you'd like to test*/
    }
  }
}

provider "harvester" {
    kubeconfig = "./kubeconfig.conf"
}
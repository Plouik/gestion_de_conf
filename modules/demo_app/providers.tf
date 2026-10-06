terraform {
  required_version = ">= 1.12.6"

  required_providers {
    docker = {
      source  = "registry.opentofu.org/kreuzwerker/docker"
      version = ">= 3.7.0"
    }
  }
}
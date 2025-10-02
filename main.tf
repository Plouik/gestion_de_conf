provider "docker" {}

resource "docker_image" "frontend" {
  name         = "frontend"
  build {
    context = "./frontend"
  }
  keep_locally = false
}

resource "docker_image" "backend" {
  name         = "backend"
  build {
    context = "./backend"
    build_args = {
      ENVIRONMENT = var.ENVIRONMENT
    }
  }
  keep_locally = false
}

resource "docker_container" "frontend" {
  image = docker_image.frontend.image_id
  name  = "frontend"
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_container" "backend" {
  image = docker_image.backend.image_id
  name  = "backend"
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_network" "configuration_network" {
  name = "configuration_network"
}
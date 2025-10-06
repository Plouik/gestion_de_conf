resource "docker_image" "frontend" {
  name         = "frontend-${var.Environment}"
  build {
    context = "./frontend"
  }
  keep_locally = false
}

resource "docker_image" "backend" {
  name         = "backend-${var.Environment}"
  build {
    context = "./backend"
    build_args = {
      ENVIRONMENT = var.Environment
    }
  }
  keep_locally = false
}

resource "docker_container" "frontend" {
  image = docker_image.frontend.image_id
  name  = "frontend-${var.Environment}"
  ports {
    internal = 80
    external = var.port
  }
  env = ["BACKEND_HOST=${docker_container.backend.name}"]
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_container" "backend" {
  image = docker_image.backend.image_id
  name  = "backend-${var.Environment}"
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_network" "configuration_network" {
  name = "configuration_network-${var.Environment}"
}
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    } 
  }
  backend "http" {
  #   address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA"
  #   lock_address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA/lock"
  #   unlock_address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA/lock"
  #   username = "Plouik"  # Replace with your GitLab username
  #   password = ""    # Replace with your GitLab Personal Access Token
  #   lock_method = "POST"
  #   unlock_method = "DELETE"
  #   retry_wait_min = 5
  }
}
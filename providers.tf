terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  backend "http" {
    address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA"
    lock_address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/74522245/terraform/state/INFRA/lock"
    username = "olivier de saint martin"  # Replace with your GitLab username
    password = "glpat-FeQtTLA2uc6NNPahC9J6ym86MQp1OjJzaGJ2Cw.01.1219qzhir"    # Replace with your GitLab Personal Access Token
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min = 5
  }
}
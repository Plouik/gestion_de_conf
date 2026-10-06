terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
    }
  }
}

provider "gitlab" {
}

data "gitlab_project" "target" {
  path_with_namespace = "Plouik/config"
}

resource "gitlab_user_runner" "project" {
  runner_type = "project_type"
  project_id  = data.gitlab_project.target.id

  description = "devcontainer"
  tag_list    = ["devcontainer"]
  untagged    = true
}

output "runner_token" {
  value     = gitlab_user_runner.project.token
  sensitive = true
}

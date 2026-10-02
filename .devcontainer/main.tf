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

  description = "devcontainer-runner"
  tag_list    = ["devcontainer-runner"]
  untagged    = true
}

output "runner_token" {
  value     = gitlab_user_runner.project.token
  sensitive = true
}

TERRAFORM_DIR=".devcontainer"
terraform -chdir="$TERRAFORM_DIR" init
terraform -chdir="$TERRAFORM_DIR" apply -auto-approve

RUNNER_TOKEN="$(terraform -chdir="$TERRAFORM_DIR" output -raw runner_token)"


gitlab-runner uninstall
rm -f /etc/gitlab-runner/config.toml 
gitlab-runner install --user=root --working-directory=/root/gitlab-runner
gitlab-runner register \
    --non-interactive \
    --url https://gitlab.com \
    --executor "shell" \
    --token "$RUNNER_TOKEN" \
    --description "devcontainer-runner" > /dev/null
gitlab-runner run > /dev/null
echo "Done"

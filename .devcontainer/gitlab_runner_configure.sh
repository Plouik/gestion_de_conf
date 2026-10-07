set -eu

TERRAFORM_DIR=".devcontainer"
terraform -chdir="$TERRAFORM_DIR" init
terraform -chdir="$TERRAFORM_DIR" apply -auto-approve

RUNNER_TOKEN="$(terraform -chdir="$TERRAFORM_DIR" output -raw runner_token)"

gilab_binary="/usr/local/bin/gitlab-runner"
if [ -e "$gilab_binary" ]; then
    echo "Gilabt runner already exists"
else
    # Download the binary for your system
    echo "Downloading gitlab-runner"
    curl --fail --location --retry 3 --output "$gilab_binary" https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
    # Give it permission to execute
    chmod +x /usr/local/bin/gitlab-runner
fi

mkdir -p /root/gitlab-runner
gitlab-runner uninstall
rm -f /etc/gitlab-runner/config.toml 
gitlab-runner register \
    --non-interactive \
    --url https://gitlab.com \
    --executor "shell" \
    --token "$RUNNER_TOKEN" \
    --description "devcontainer" 
gitlab-runner run > /dev/null


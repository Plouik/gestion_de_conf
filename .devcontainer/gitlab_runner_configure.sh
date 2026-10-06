set -eu

TERRAFORM_DIR=".devcontainer"
tofu -chdir="$TERRAFORM_DIR" init
tofu -chdir="$TERRAFORM_DIR" apply -auto-approve

RUNNER_TOKEN="$(tofu -chdir="$TERRAFORM_DIR" output -raw runner_token)"
ln -s /usr/bin/tofu /usr/bin/gitlab-tofu 
# Download the binary for your system
echo "Downloading gitlab-runner"
curl --fail --location --retry 3 --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# Give it permission to execute
chmod +x /usr/local/bin/gitlab-runner

mkdir -p /root/gitlab-runner
gitlab-runner install --user=root --working-directory=/root/gitlab-runner
gitlab-runner register \
    --non-interactive \
    --url https://gitlab.com \
    --executor "shell" \
    --token "$RUNNER_TOKEN" \
    --description "devcontainer-runner" 
gitlab-runner run > /dev/null


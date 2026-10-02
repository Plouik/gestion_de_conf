set -eu

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


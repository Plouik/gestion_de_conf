gitlab-runner uninstall
rm -f /etc/gitlab-runner/config.toml 
gitlab-runner install --user=root --working-directory=/root/gitlab-runner
gitlab-runner register \
    --non-interactive \
    --url https://gitlab.com \
    --executor "shell" \
    --token "$RUNNER_TOKEN" \
    --description "devcontainer-runner" > /dev/null
echo "Done"

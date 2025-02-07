if [[ "$(uname)" == "Darwin" ]]; then
	HOSTNAME=$(hostname | sed 's/\.local$//')
else
	HOSTNAME=$(cat /etc/hostname)
fi

CURRENT_GIT_USERNAME=$(git config --global user.name)
if [ "GustavoWidman (${HOSTNAME})" != "$CURRENT_GIT_USERNAME" ]; then
    git config --global user.name "GustavoWidman (${HOSTNAME})"
    echo "Redefined git user.name to: \"GustavoWidman (${HOSTNAME})\""
fi

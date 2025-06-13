#!/bin/sh

OS="$(uname)"

stow -D -t ~ home

if [[ "$OS" == "Darwin" ]]; then
    sudo stow -D -t /var/root root
elif [[ "$OS" == "Linux" ]]; then
    sudo stow -D -t /root root
else
    echo "Unknown operating system: $OS. Could not find proper root dir to detach symlinks from."
    exit 1
fi

echo "Symlinks succesfully deactivated."

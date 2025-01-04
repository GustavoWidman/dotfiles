#!/bin/sh

OS="$(uname)"

stow -t ~ home

if [[ "$OS" == "Darwin" ]]; then
	sudo stow -t /var/root root
elif [[ "$OS" == "Linux" ]]; then
	sudo stow -t /root root
else
    echo "Unknown operating system: $OS. Could not find proper root dir to attach symlinks to."
    exit 1
fi

echo "Symlinks succesfully activated."

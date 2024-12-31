#!/bin/sh

sudo stow -D -t /var/root root
stow -D -t ~ home

echo "Symlinks desativados."

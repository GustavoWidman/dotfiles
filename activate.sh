#!/bin/sh

stow -t ~ home # criar symlinks para os arquivos que ficam no home
sudo stow -t /var/root root # criar symlinks para arquivos que ficam em /root (necessita sudo)

echo "Symlinks ativados."

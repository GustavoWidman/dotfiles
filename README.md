# Dotfiles

This repository houses the configuration files used in my work environment. Currently, I am using [Arch Linux](https://archlinux.org/) paired with [GNOME](https://www.gnome.org/) as the desktop environment. I have also recently bought a [MacBook Pro M3 Max](https://support.apple.com/en-us/117736) to use as my main work computer, so these configs house good compatibility with both platforms.

## Prerequisites

For installing the configuration files, only the following tools are required:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

If you wish to install additional software that I frequently use, please refer to the documentation from your package manager. If, like me, you are an Arch Linux enthusiast, you can install the necessary packages with the following command:

```bash
sudo pacman -S git stow
```

On Mac, you can use [Homebrew](https://brew.sh/) to install the necessary tools:

```bash
brew install git stow
```

You should also install [coreutils](https://formulae.brew.sh/formula/coreutils) to use GNU `ls` and some other GNU goodies like GNU Nano on MacOS.

```bash
brew install coreutils
```

## Installation

To seamlessly integrate these configuration files into your system, first clone the repository and leverage GNU Stow for symbolic link creation. The following set of commands will guide you through the process:

```bash
git clone https://github.com/GustavoWidman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

With the repository at your disposal, GNU Stow can now be utilized to set up symbolic links:

```bash
stow -t ~ home # creates symlinks for files located in the home directory
sudo stow -t /root root # creates symlinks for files meant for the /root directory (requires admin privileges)
```

Do note that on MacOS, the root directory is `/var/root` and not `/root`, so act accordingly or... To further streamline the setup process, activation and deactivation scripts are available, which will take care of the necessary steps for you:

```bash
./activate.sh # establishes symlinks
./deactivate.sh # removes symlinks
```

Because these scripts execute sudo to manage symlinks in /etc, your password will be required when running them.

Congratulations! Your system now reflects my personal configuration setup.

## Updating

To keep the configuration files current, use Git to pull updates seamlessly. Since the symbolic links are directly pointing to the repository contents, any updates will be automatically reflected, although if new files are created, they will not be linked automatically and you will have to reactivate the symlinks by simply running the activation script again, Stow will take care of the rest.

```bash
cd ~/.dotfiles
git pull

./activate.sh # reactivate symlinks, if necessary (do it just for good measure)
```

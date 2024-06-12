# dotfiles

Esse repositório contém os arquivos de configuração que utilizo no meu ambiente de trabalho. Atualmente, estou utilizando o [Arch Linux](https://archlinux.org/) com o [GNOME](https://www.gnome.org/) como ambiente gráfico.

## Requisitos

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

Esses são os únicos requisitos para instalar os arquivos de configuração. Caso você queira instalar os programas que utilizo, consulte a documentação do seu gerenciador de pacotes. Se você é como eu e utiliza Arch Linux (btw), você pode instalar os programas com o seguinte comando:

```bash
sudo pacman -S git stow
```

## Instalação

Para instalar os arquivos de configuração, você pode clonar esse repositório e utilizar o GNU Stow para criar os links simbólicos. Você pode fazer isso com os seguintes comandos:

```bash
git clone https://github.com/GustavoWidman/dotfiles.git ~/.dotfiles

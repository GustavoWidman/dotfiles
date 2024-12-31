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
cd ~/.dotfiles
```

Agora você pode utilizar o GNU Stow para criar os links simbólicos.

```bash
stow -t ~ home # criar symlinks para os arquivos que ficam no home
sudo stow -t /root root # criar symlinks para arquivos que ficam em /root (necessita sudo)
```

Voce tambem pode usar os scripts de ativacao e desativacao para facilitar o seu processo.

```bash
./activate.sh # ativa os symlinks
./deactivate.sh # desativa os symlinks
```

Como eles usam sudo para criar e remover os symlinks de /etc, voce tera que inserir sua senha quando for roda-los.

Pronto! Agora você tem os meus arquivos de configuração instalados no seu sistema.

## Atualização

Para atualizar os arquivos de configuração, você pode utilizar o Git para baixar as atualizações e os arquivos serão atualizados automaticamente, ja que os links simbólicos apontam para o repositório.

```bash
cd ~/.dotfiles
git pull
```

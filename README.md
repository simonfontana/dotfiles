README
======

## Introduction
These are my dotfiles.
Instructions below are mostly for myself, but I've made this project public so that anyone can use it, but do so at your own risk.
Some commands **will** overwrite files in your home directory, proceed with care. I recommend trying it in a VM first.

## Prerequisites

System: Ubuntu 20.04.

## Clone Repo

Install git.

```
sudo apt update && sudo apt install git
```

Download this dotfiles repository into your home folder.
> WARNING: Only do this if you know what you're doing and you're sure this is what you want.
> This instruction is mostly for myself to easily copy-paste the commands.
> Other users may use this repo as a reference.

```
git clone https://github.com/simonfontana/dotfiles.git /tmp/dotfiles  # answer yes if you get a prompt
shopt -s dotglob  # turn on dot files
cp -r /tmp/dotfiles/* ~/
cd ~ && git submodule update --init --recursive
```

## Installation

### Good to Have

Before moving on with the installation of the environment, let's install some great programs, some of which may be useful moving forward.

```
sudo apt install \
  brightnessctl  `# set screen brightness` \
  curl  `# transfer url` \
  docker.io  `# run docker containers` \
  pavucontrol  `# volume control tool` \
  playerctl  `# required for i3-blocks mediaplayer and for mediakeys to work` \
  python3-distutils  `# utility package, required by thefuck` \
  python3-venv  `# virtual environments for python` \
  redshift-gtk  `# adjust color temperature of your screen` \
  thunar  `# file manager` \
  thefuck  `# correct errors in previous command` \
  vim  `# text editor`
```

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  # package manager
```

```
brew install lazygit  # nice git tool
```

```
pip install --user --upgrade cdiff
```

### Zsh

I prefer zsh over bash.

```
sudo apt install \
  autojump  `# faster way to navigate your filesystem` \
  colordiff  `# colorize diff output` \
  fonts-powerline  `# font required by spaceship` \
  zsh  `# Z shell`
```
```
chsh -s $(which zsh)  # set zsh as default shell
```

Lf is a neat little terminal file manager which is not available in Ubuntu repository.
Below is an example on how to install version r26 on amd64 architecture.
Hotkey after installation is CTRL+P in terminal.

```
wget https://github.com/gokcehan/lf/releases/download/r26/lf-linux-amd64.tar.gz
tar zxf lf-linux-*.tar.gz
sudo mv lf /usr/local/bin/lf
rm lf-linux-*.tar.gz
```

## i3-wm

> Note: It may be worth adding sur5r's Ubuntu repository to get the latest i3-wm version.
> Go [HERE](https://i3wm.org/docs/repositories.html) for instructions.


Execute the below command to install i3-wm and other dependencies required by the configuration:

```
sudo apt install \
  feh  `# background image` \
  i3-wm  `# i3 window manager` \
  i3blocks  `# status bar` \
  i3lock  `# lock screen` \
  i3status  `# status bar` \
  rofi  `# application launcher` \
  scrot  `# screen capturing`
```

### Font Awesome

> Note: I've had issues previously when installing fontawesome from Ubuntu repository which is why I'm doing it manually.

Download the [Font Awesome](https://fontawesome.com/download) (click "Free for Desktop") fonts which are used in i3-blocks.

```
cd Downloads/
unzip fontawesome-*.zip
mkdir -p ~/.fonts/
mv fontawesome-*/otfs/*.otf ~/.fonts/
```

### i3-blocks

List all programs used by your i3-blocks configuration.

```
cat ~/.config/i3/i3blocks.conf | grep -o '~/.config/i3/i3blocks-contrib/[-_a-Z]\+' | xargs -L1 -I 'PATH' echo PATH/README.md
```

Read the README.md files for each program and follow the instructions to install their dependencies.

### Set a GTK Theme

Start by installing lxappearance.

```
sudo apt install lxappearance
```

> Note: Lxappearance doesn't work in GNOME (it has it's own program to set themes).
> You can only use lxappearance in i3-wm.

Open lxappearance and see if you find a theme you like.
There are more available at [gnome-look.org](gnome-look.org).
Install by extracting the archive into either ~/.themes/ or ~/.icons/ depending on if it's a GTK theme or an icon theme.

### LunarVim

LunarVim requires installing Neovim of version 0.5 and later.
Add the official PPA and install the latest version of Neovim with the below commands:

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

Install nerdfont which is required for icons to show.
Follow the [instructions in the LunarVim documentation](https://www.lunarvim.org/configuration/04-nerd-fonts.html#installing-a-font).
Make sure you also change the font of your terminal.

The following programs (except for xclip) are listed as prerequisites to install LunarVim:

```
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -  # Install PPA for nodejs v16.x
sudo apt install \
  build-essential  `# make is required to install LunarVim` \
  cargo  `# required to install packages` \
  nodejs  `# required to install packages` \
  python3-venv  `# required to install packages` \
  xclip  `# required for system and vim to share clipboard`
```

Install LunarVim with the following command:

```
bash <(curl -s https://raw.githubusercontent.com/simonfontana/lunarvim/master/utils/installer/install.sh)
```

Now go to the [LunarVim documentation](https://www.lunarvim.org/02-after-install.html#quick-start) to get started.

## Enjoy!

Reboot and go to the login screen. Click the gear wheel and select i3 as your window manager.

README
======

## Introduction
These are my dotfiles.
Instructions below are mostly for myself, but I've made this project public so that anyone can use it, but do so at your own risk.
Some commands **will** overwrite files in your home directory, proceed with care. I recommend trying it in a VM first.

## Prerequisites

System: Ubuntu 24.04.

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
sudo apt update && sudo apt dist-upgrade
sudo add-apt-repository universe  # additional repository required to install FUSE
sudo apt install \
  autorandr  `# automatically switch displays` \
  brightnessctl  `# set screen brightness` \
  curl  `# transfer url` \
  docker.io  `# run docker containers` \
  libfuse2t64  `# run AppImages` \
  pavucontrol  `# volume control tool` \
  playerctl  `# required for i3-blocks mediaplayer and for mediakeys to work` \
  python3-dev python3-pip python3-setuptools  `# good to have python tools, also required by thefuck` \
  python3-venv  `# virtual environments for python` \
  redshift-gtk  `# adjust color temperature of your screen` \
  thunar  `# file manager` \
  thefuck  `# correct errors in previous command` \
  vim  `# text editor`
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  # package manager
```

```
brew install lazygit  # nice git tool
brew install ydiff  # nice diff tool
go install github.com/rhysd/notes-cli/cmd/notes@latest
go install github.com/charmbracelet/glow@latest
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

### Alacritty Terminal

Install Alacritty following the installation instructions: https://github.com/alacritty/alacritty/blob/master/INSTALL.md

```
curl https://sh.rustup.rs -sSf | sh  # install rust
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3  # install dependencies
cargo install alacritty  # install alacritty
```

To use the opacity configuration, I use picom as compisotor.
To build and install picom, go to: https://github.com/yshui/picom

### i3-blocks

#### Ubuntu Nerd Font

Start by installing Ubuntu NF fonts which is what I have configured for i3.
Without it, icons will not show properly in i3-bar.

```
mkdir -p ~/.fonts/Ubuntu-Nerd-Font/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.zip
unzip -d ~/.fonts/Ubuntu-Nerd-Font/ Ubuntu.zip
rm Ubuntu.zip
```

#### Configuration

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

Simply follow the [LunarVim documentation](https://www.lunarvim.org/docs/installation)

## Enjoy!

Reboot and go to the login screen. Click the gear wheel and select i3 as your window manager.

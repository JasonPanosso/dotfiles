#!/bin/bash

sudo apt update
sudo apt install build-essential cmake libxext-dev libxcb-randr0-dev libsdbus-c++-dev libudev-dev
sudo apt install snapd git curl zsh gimp gnome-tweaks tmux
sudo snap install slack
sudo snap install --classic code
sudo snap install insomnia

#NVIM
sudo add-apt-repository ppa:neovim-ppa/stable 
sudo apt-get update
sudo apt-get install neovim
sudo apt-get intstall python3-neovim
sudo apt install python3.10-venv
#NVM
snap install node --classic
npm install -g @fsouza/prettierd eslint_d tree-sitter-cli ts-node typescript 

#Font
curl https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip

#Gummy
git clone https://github.com/Fushko/gummy.git
cd gummy
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
cmake --build .
sudo make install

#Discord
curl https://discord.com/api/download?platform=linux&format=deb

#thefuck
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user

#Dotfiles
git clone https://github.com/jasonpanosso/dotfiles.git $HOME/.dotfiles && source ~/.zshrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

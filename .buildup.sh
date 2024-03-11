#!/bin/bash

# Upgrading  and installing core apps (for me)
sudo apt-get update
sudo apt-get upgrade
sudo apt install git vim curl build-essential python3.12-full gnome-tweaks gnome-browser-connector gh perl wget fzf fd-find zsh ripgrep kitty tmux nodejs cmake gettext npm -y

# Setting default terminal
sudo update-alternatives --config x-terminal-emulator 2

# Changing default shell
sudo cp .pam.d/chshpre /etc/pam.d/chsh
sudo chsh -s /usr/bin/zsh
sudo cp .pam.d/chshpost /etc/pam.d/chsh

# Install tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Get antigen.zsh
curl -L git.io/antigen > ~/antigen.zsh

# Moving kitty terminal configuration
sudo mkdir ~/.config/kitty
cp ./kitty.conf ~/.config/kitty/

# Download Fira Code Nerd Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
sudo unzip FiraCode.zip -d ~/.local/share/fonts
sudo rm FiraCode.zip
fc-cache -f -v

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo rm google-chrome-stable_current_amd64.deb


# Install Nix Package Manager (fuck me)
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# Install luajit (needed for Neovim)
git clone https://luajit.org/git/luajit.git && cd luajit && make && sudo make install && cd .. && rm -rf luajit

# Installing auto switch env for python"
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git"

# Latest Neovim
git clone https://github.com/neovim/neovim.git && cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install && cd .. && rm -rf neovim

# Use zsh shell and source tmux
sudo chown -R $USER /home/$USER


echo
echo
echo
echo "Finished configuring new system. Session will be restarted, so some changes can take effect."
sleep 3
sudo systemctl restart gdm3

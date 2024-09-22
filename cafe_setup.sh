#!/bin/bash

echo """
                                                  
▗▄▄▖ ▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖ ▗▄▖ ▗▄▄▄▖▗▄▄▄▖
▐▌ ▐▌  █   ▝▚▞▘ ▐▌   ▐▌ ▐▌▐▌   ▐▌   
▐▛▀▘   █    ▐▌  ▐▌   ▐▛▀▜▌▐▛▀▀▘▐▛▀▀▘
▐▌   ▗▄█▄▖▗▞▘▝▚▖▝▚▄▄▖▐▌ ▐▌▐▌   ▐▙▄▄▖
                                    
     
"""

# Startup
echo "Starting setup..."

# Update system
echo "Updating repository..."
pkg update
pkg upgrade

# Installing system requirements
echo "Installing system requirements..."
pkg install wget
pkg install curl
pkg install git
pkg install root-repo
pkg install x11-repo

# Clear terminal
echo "Clearing cache..."
clear

# General language setup
echo "Setting up general languages..."
pkg install nodejs
pkg install python3
pkg install ruby

# Clear terminal
echo "Clearing cache..."
clear

# Setup code editor for mobile/tablet
echo "Setting up code editor with nvim..."
pkg install neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

mkdir -p ~/fontnerd
cd ~/fontnerd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
cp JetBrainsMonoNerdFont-Bold.ttf ~/.termux/font.ttf

touch ~/.termux/colors.properties
cat <<EOF > ~/.termux/colors.properties
background=#0e1019
foreground=#fffaf4
cursor=#fffaf4

color0=#232323
color1=#ff000f
color2=#8ce10b
color3=#ffb900
color4=#008df8
color5=#6d43a6
color6=#00d8eb
color7=#ffffff
color8=#444444
color9=#ff2740
color10=#abe15b
color11=#ffd242
color12=#0092ff
color13=#9a5feb
color14=#67fff0
color15=#ffffff
EOF

# Clear terminal
clear

# Setup theme for Termux
echo "Setting up theme..."
pkg install starship

if [ -d "~/.config" ]; then
  echo "Folder already exists, but you must create the json theme."
else
  mkdir -p ~/.config
fi

touch ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml

touch ~/.bashrc
cat <<EOF >> ~/.bashrc
export STARSHIP_CONFIG=~/.config/starship.toml
eval "\$(starship init bash)"
EOF

# Clear terminal
clear

echo """
┏━━━┓━━━━━━━━━━━━━━━━━━━━
┃┏━┓┃━━━━━━━━━━━━━━━━━━━━
┃┗━━┓┏┓┏┓┏━━┓┏━━┓┏━━┓┏━━┓
┗━━┓┃┃┃┃┃┃┏━┛┃┏━┛┃┏┓┃┃━━┫
┃┗━┛┃┃┗┛┃┃┗━┓┃┗━┓┃┃━┫┣━━┃
┗━━━┛┗━━┛┗━━┛┗━━┛┗━━┛┗━━┛
━━━━━━━━━━━━━━━━━━━━━━━━━
━━━━━━━━━━━━━━━━━━━━━━━━━
"""

echo "Installation is successful."
echo "Thank you for using it."

echo """

                                                  
,------. ,--.                        ,---.        
|  .--. '`--',--.  ,--.,---. ,--,--./  .-' ,---.  
|  '--' |,--. \  `'  /| .--'' ,-.  ||  `-,| .-. : 
|  | --' |  | /  /.  \\ `--.\ '-'  ||  .-'\   --. 
`--'     `--''--'  '--'`---' `--`--'`--'   `----' 
                                                  

"""
#startup
echo "starting setup..."

#update system
echo "update repository"
pkg update
pkg upgrade

#installing system for requirements
echo "install system..."
pkg install wget
pkg install curl
pkg install git
pkg install root-repo
pkg install x11-repo

#clear terminal
echo "clear cache..."
clear

#general language everyday
echo "general language setup...."
pkg install nodejs
pkg install python3
pkg install ruby

#clear terminal
echo "clear cache..."
clear

#setup code editor for mobile/tablet
echo "setup code editor with nvim...."
pkg install neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
mkdir fontnerd
cd fontnerd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
cp JetBrainsMonoNerdFont-Bold.ttf ~/.termux/font.ttf
touch ~/.termux/colors.properties
echo """
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
color15=#ffffff """ >> ~/.termux/colors.properties


#clear terminal
clear

#setup theme termux
echo "theme setup...."
pkg install starship
if [-d "~/.config"]; then
  echo "folder already but you must create json theme"
  touch ~/.config/starship.toml
else
  mkdir -p ~/.config && touch ~/.config/starship.toml
starship preset pastel-powerline -o ~/.config/starship.toml
touch .bashrc
echo """
export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(starship init bash)" """ >> ~/.bashrc

#clear terminal
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

echo "install is succes.."
echo "Thank you for using it"

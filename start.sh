#!/bin/bash

sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autopurge && sudo apt autoclean && flatpak update && snap refresh

#vlc 
sudo apt install -y vlc

#for coding
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

#venv
sudo apt install python3-venv
sudo apt-get install -y python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev-is-python3
sudo apt install build-essential libssl-dev libffi-dev python3-dev
sudo apt install python3-venv -y
#python3 -m venv venv
#source venv/bin/activate

wget https://download.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb
sudo apt install ./binance-amd64-linux.deb

sudo flatpak install flathub com.google.Chrome
sudo flatpak install flathub com.github.arminstraub.krop
sudo flatpak install flathub com.anydesk.Anydesk
sudo flatpak install flathub org.telegram.desktop
sudo apt install tilix

#text_editor
sudo apt install kate breeze

sudo apt install micro
# micro ~/.config/micro/settings.json
# {
#     "hlsearch": true,
#     "lsp.autocompleteDetails": true,
#     "lsp.servers": {
#         "go": "gopls",
#         "python": "pylsp"
#     },
#     "scrollbar": true
# }

#lsp
go install golang.org/x/tools/gopls@latest
sudo apt-get install python3-pylsp
sudo snap install bash-language-server --classic

#snapstore
sudo apt install snapd

#syncthing
sudo apt install syncthing

#keepassxc
sudo apt install keepassxc

#CPU
# @reboot sleep 30 && sudo cpupower frequency-set -g powersave -d 800kHz -u 1.2GHz
# sudo crontab -u root -e

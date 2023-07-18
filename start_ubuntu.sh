#!/bin/bash

sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autopurge -y && sudo apt autoclean -y && sudo snap refresh

gsettings set org.gnome.desktop.background picture-options 'none'

#chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

#vlc 
sudo apt install -y vlc

#libreoffice
sudo add-apt-repository ppa:libreoffice/ppa && sudo apt update
sudo apt install -y libreoffice

sudo apt remove firefox* -y 

sudo snap install pycharm-community --classic

sudo ssh-keygen

sudo cp ./config ~/.ssh/config

sudo cp ./.bash_aliases ~/.bash_aliases

sudo cp ./.bashrc ~/.bashrc

sudo cp ./.bash_history ~/.bash_history

sudo apt install transmission

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git

#CSSource
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get install libtcmalloc-minimal4:i386
sudo apt-get install libgl1-mesa-glx:i386

sudo snap install telegram-desktop

#venv
sudo apt install python3-venv
sudo apt-get install -y python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev-is-python3
sudo apt install build-essential libssl-dev libffi-dev python3-dev
sudo apt install python3-venv -y
#python3 -m venv test_env
#source env/bin/activate

#jupyterlab
pip install jupyterlab

#Krop PDF
sudo snap install krop

#для работы ifconfig
sudo apt install net-tools

#Sublime тестовый редактор
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#показать ключи ssh
cat ~/.ssh/id_rsa.pub 

#!/bin/bash

clear
echo "  ___       _                   _       _____             _          _  _ ";
echo " / _ \     | |                 ( )     |_   _|           | |        | || |";
echo "/ /_\ \  __| |  __ _  _ __ ___ |/ ___    | |  _ __   ___ | |_  __ _ | || |";
echo "|  _  | / _\` | / _\` || '_ \` _ \  / __|   | | | '_ \ / __|| __|/ _\` || || |";
echo "| | | || (_| || (_| || | | | | | \__ \  _| |_| | | |\__ \| |_| (_| || || |";
echo "\_| |_/ \__,_| \__,_||_| |_| |_| |___/  \___/|_| |_||___/ \__|\__,_||_||_|";
echo "                                                                          ";
echo "                                                                          ";
sleep 3

# ask questions for adding extra stuff (used later)
read -p "Would you like to install atom and its packages (y/n)? " atom_answer
read -p "Would you like to install python and its packages (y/n)? " python_answer
read -p "Would you like to install OSINT tools (y/n)?" osint_answer
read -p "Would you like to install vlc (y/n)? " vlc_answer

# update and upgrade
sudo apt update && sudo apt upgrade -y
clear

# set up basic tools like git, curl, etc.
sudo apt install git-all -y \
  curl -y \
  openssh-server -y \
  openssh-client -y \
  net-tools -y \
  vim -y \
  xclip -y \
  fail2ban -y

# install atom
case ${atom_answer:0:1} in
  y|Y )
    echo "Installing Atom"
    sudo snap install atom --classic
    packages=$( cat ../shared/atom-plugins.txt | tr "\n" " ")
    echo "Installing Atom Packages: $packages"
    read -a packarr <<< $packages
    for package in "$packarr[@]"; do
      if [[ ! -z $package ]]
      then
        apm install $package
      fi
    done
  ;;
  * )
    echo "Skipping Atom"
  ;;
esac

# install OSINT tools
case ${osint_answer:0:1} in
  y|Y )
    echo "Installing OSINT tools"
    mkdir ~/Documents/OSINT
    cwd=$(pwd)
    packages=$( cat ../shared/osint-tools.txt | tr "\n" " ")
    cd ~/Documents/OSINT
    echo "Installing OSINT packages: $packages"
    read -a packarr <<< $packages
    for package in "$packarr[@]"; do
      if [[ ! -z $package ]]
      then
        git clone $package
      fi
    done
    cd $cwd
  ;;
  * )
    echo "Skipping OSINT tools"
  ;;
esac

# install python
case ${python_answer:0:1} in
  y|Y )
    echo "Installing Python"
    sudo apt install python3-pip -y
    pip3 install -r ../shared/python-packages.txt
  ;;
  * )
    echo "Skipping Python"
  ;;
esac

# install vlc
case ${vlc_answer:0:1} in
  y|Y )
    echo "Installing VLC"
    sudo apt install vlc -y
  ;;
  * )
    echo "Skipping VLC"
  ;;
esac

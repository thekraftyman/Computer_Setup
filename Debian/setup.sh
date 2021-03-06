#!/bin/bash
echo "███████╗ █████╗ ███████╗██╗   ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "█████╗  ███████║███████╗ ╚████╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██╔══╝  ██╔══██║╚════██║  ╚██╔╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "███████╗██║  ██║███████║   ██║       ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "                                                                                           ";
echo "                                                                                           ";
sleep 3

# ask questions for adding extra stuff (used later)
read -p "Would you like to install atom and its packages (y/n)? " atom_answer
read -p "Would you like to install python and its packages (y/n)? " python_answer
read -p "Would you like to install OSINT tools (y/n)?" osint_answer
read -p "Would you like to install vlc (y/n)? " vlc_answer
read -p "Would you like to set up a hypervisor for virtualization (y/n)? " hypervisor_answer

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
  fail2ban -y \
  python3-venv \
  zsh -y

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# install hypervisor
case ${hypervisor_answer:0:1} in
  y|Y )
    echo "Installing hypervisor"
    sudo apt install -y \
     qemu-kvm -y \
     libvirt-daemon-system -y \
     libvirt-clients -y \
     bridge-utils -y \
     virtinst -y \
     virt-manager -y

    sudo systemctl is-active libvirtd
    sudo usermod -aG libvirt $USER
    sudo usermod -aG kvm $USER
  ;;
  * )
    echo "Skipping hypervisor"
  ;;
esac

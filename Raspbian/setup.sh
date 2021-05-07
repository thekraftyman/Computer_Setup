#!/bin/bash
echo "███████╗ █████╗ ███████╗██╗   ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "█████╗  ███████║███████╗ ╚████╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██╔══╝  ██╔══██║╚════██║  ╚██╔╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "███████╗██║  ██║███████║   ██║       ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
echo "                                                                                           ";
sleep 3

# ask questions for adding extra stuff (used later)
read -p "Would you like to install the ufw firewall (y/n)? " ufw_answer
read -p "Would you like to install python and its packages (y/n)? " python_answer

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

# install ufw
case ${ufw_answer:0:1} in
  y|Y )
    echo "Installing ufw"
    sudo apt install ufw -y
  ;;
  * )
    echo "Skipping ufw"
  ;;
esac

# install python
case ${python_answer:0:1} in
  y|Y )
    echo "Installing python packages"
    sudo apt install python3-pip -y
    pip3 install -r ../shared/python-packages.txt
  ;;
  * )
    echo "Skipping python"
  ;;
esac

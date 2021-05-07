#!/bin/bash
# to run type 'mac.setup.sh'
# then type 'mac.setup.sh'
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

# update
echo "Updating OS"
sleep 1
softwareupdate -i -a

# create fun folders
clear
sleep 2
echo "creating folders for convenience"
sleep 1
mkdir ~/Documents/python_programs
mkdir ~/Documents/luther_development
touch ~/Documents/luther_development/server_ip.txt
echo "Dev: 10.6.4.5 \nStaging: 10.6.4.6 \nProduction: 10.6.4.4" >> ~/Documents/luther_development/server_ip.txt

# install brew
sleep 2
clear
echo "installing brew"
sleep 1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install atom
sleep 2
clear
echo "installing Atom"
sleep 1
brew cask install atom

# install google-chrome
sleep 2
clear
echo "installing google-chrome"
sleep 1
brew cask install google-chrome

# install alfred
sleep 2
clear
echo "installing alfred"
sleep 1
brew cask install alfred

# install atom packages
sleep 2
clear
echo "installing Atom packages"
sleep 1
apm install atom-ide-ui
apm install minimap
apm install script
apm install minimap-find-and-replace
apm install platformio-ide-terminal
apm install multi-cursor
apm install atom-file-icons
apm install pigments
apm install minimap-pigments
apm install expose
apm install highlight-selected
apm install minimap-highlight-selected
apm install minimap-git-diff
apm install qolor

# install sequel pro
sleep 2
clear
echo "installing Sequel Pro"
sleep 1
brew cask install sequel-pro

# install virtualbox
sleep 2
clear
echo "installing virtualbox"
sleep 1
# brew cask install virtualbox
cd ~/Downloads
wget -O https://download.virtualbox.org/virtualbox/6.0.14/VirtualBox-6.0.14-133895-OSX.dmg

# install vagrant
sleep 2
clear
echo "installing vagrant"
sleep 1
# brew cask install vagrant
wget -O https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.dmg

# install screaming-frog-seo-spider
sleep 2
clear
echo "installing screaming-frog-seo-spider"
sleep 1
brew cask install screaming-frog-seo-spider

# installing pip
sleep 2
clear
echo "installing pip"
sleep 1
sudo easy_install pip

# install ansible
sleep 2
clear
echo "installing ansible"
sleep 1
pip install --user ansible


# install git
sleep 2
clear
echo "install git (will be prompted)"
sleep 1
git --version

sleep 2
echo git config --global user.name myusername
echo git config --global user.email myemail
echo "If everything worked, go here to set up ssh https://docs.gitlab.com/ee/ssh/README.html#rsa-ssh-keys"

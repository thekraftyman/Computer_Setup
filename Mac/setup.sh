#!/bin/zsh
# to run type 'setup.sh'
echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "";

# update
echo "Updating OS"
softwareupdate -i -a

# create folders
clear
sleep 1
echo "Creating folders for convenience"
sleep 1
mkdir ~/Documents/python_programs
mkdir ~/Documents/luther_development

# install brew
echo "Installing homebrew"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install pip
sudo easy_install pip

# run the curl script
# /bin/zsh ./curl_packages.sh

# run the homebrew script
/bin/zsh ./brew_packages_installer.sh

# iterm2 information
clear
echo "You can import iterm 2 configuration from the config file in ../shared/configurations/ "

# install ansible
pip install --user ansible

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# run the configuration script
/bin/zsh ./configurations.sh

# generate ssh keys to add places
/bin/zsh ./ssh_keys_setup.sh

# finally, tell the setup user of the next steps
/bin/zsh ./next_steps.sh

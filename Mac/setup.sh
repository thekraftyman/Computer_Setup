#!/bin/zsh
# to run type 'setup.sh'
echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "";

read "osupdate?Would you like to update the OS? (y/n): "
read "customfolders?Would you like to create custom folders? (y/n): "
read "homebrewanswer?Would you like to install homebrew? (y/n): "
read "pipanswer?Would you like to install pip and ansible? (y/n): "
read "ohmyzshanswer?Would you like to install oh-my-zsh? (y/n): "
read "configurationanswer?Would you like to install custom configurations? (requires oh-my-zsh and homebrew) (y/n): "
read "sshkeysetup?Would you like to set up ssh keys? (y/n): "
read "gpgkeysetup?Would you like to set up gpg keys? (y/n): "

# update
case ${osupdate:0:1} in
  y|Y )
    echo "Updating OS"
    softwareupdate -i -a
  ;;
  * )
    echo "Skipping OS Update"
  ;;
esac

# create folders
case ${customfolders:0:1} in
  y|Y )
    clear
    sleep 1
    echo "Creating folders for convenience"
    sleep 1
    mkdir ~/Documents/python_programs
    mkdir ~/Documents/luther_development
  ;;
  * )
    echo "Skipping custom folder creation"
  ;;
esac

# run the curl script
# /bin/zsh ./curl_packages.sh

# install brew
case ${homebrewanswer:0:1} in
  y|Y )
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # install brew packages
    brew bundle --file=./Brewfile
  ;;
  * )
    echo "Skipping homebrew installation and its packages"
  ;;
esac

# install pip and ansible
case ${pipanswer:0:1} in
  y|Y )
    sudo easy_install pip

    pip3 install --user ansible
  ;;
  * )
    echo "Skipping pip and ansible installation"
  ;;
esac

# install oh-my-zsh
case ${ohmyzshanswer:0:1} in
  y|Y )
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ;;
  * )
    echo "Skipping oh-my-zsh installation"
  ;;
esac

# run the configuration script
case ${configurationanswer:0:1} in
  y|Y )
    /bin/zsh ./configurations.sh
  ;;
  * )
    echo "Skipping customization"
  ;;
esac

# generate ssh keys to add places
case ${sshkeysetup:0:1} in
  y|Y )
    /bin/zsh ./ssh_keys_setup.sh
  ;;
  * )
    echo "Skipping ssh key setup"
  ;;
esac

# add gpg setup
case ${gpgkeysetup:0:1} in
  y|Y )
    /bin/zsh ./gpg_setup.sh
  ;;
  * )
    echo "Skipping ssh key setup"
  ;;
esac

# finally, tell the setup user of the next steps
/bin/zsh ./next_steps.sh

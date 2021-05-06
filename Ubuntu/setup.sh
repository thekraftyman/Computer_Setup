#!/bin/bash
# to run type 'initial_linux_setup.sh'
# then type 'initial_linux_setup.sh'

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

# update and upgrade
sudo apt update && sudo apt upgrade -y
clear

# get some applications
read -p "Would you like to install the core applications and packages(y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        echo installing chromium
        sleep 2
        sudo apt install chromium-browser -y
        clear
        echo installing synaptic
        sleep 2
        sudo apt install synaptic -y
        clear
        echo installing vlc
        sleep 2
        sudo apt install vlc -y
        clear
        echo installing atom
        sleep 2
        sudo add-apt-repository ppa:webupd8team/atom
        sudo apt update && sudo apt upgrade -y
        sudo apt install atom
        clear
        echo installing texstudio
        sleep 2
        sudo apt install texstudio -y
        clear
        echo installing openssh
        sleep 2
        sudo apt install openssh-client
        clear
        echo installing sqlite
        sleep 2
        sudo apt install sqlite -y
        clear
        echo installing git
        sleep 2
        sudo apt install git-all -y
        clear
        echo installing xfce4-whisker
        sleep 2
        sudo add-apt-repository ppa:gottcode/gcppa
        sudo apt-get update && sudo apt-get install xfce4-whiskermenu-plugin
        clear


        # make a directory
        echo making directories
        sleep 2
        mkdir ~/Programs
        mkdir ~/Programs/python
        mkdir ~/Documents/initial_setup
        clear

        # install pip
        echo getting pip
        sleep 1
        sudo apt-get install python3-pip -y

        # install some python packages
        sudo pip3 install setuptools
        sudo pip3 install numpy
        sudo pip3 install requests
        sudo pip3 install bs4
        sudo pip3 install mechanicalsoup
        sudo pip3 install selenium
        sudo pip3 install scipy
        sudo pip3 install pandas
        sudo pip3 install sqlite3
        sudo pip3 install opencv-python
        sudo pip3 install qrcode[pil]
        sudo apt install python3-tk
        clear

        # install some atom packages
        echo intsalling atom packages
        sleep 2
        apm install atom-ide-ui
        apm install ide-python
        apm install language-latex
        apm install latex
        apm install minimap
        apm install script
        apm install minimap-find-and-replace
        apm install platformio-ide-terminal
        apm install multi-cursor
        apm install kite
        apm install python-autopep8
        apm install atom-file-icons
        # apm install autocomplete-python
        clear

        # Get my custom python library from GitHub
        echo geting my custom python library...
        sleep 2
        cd ~/Programs/python
        curl -o AdamPyLib.py https://raw.githubusercontent.com/thekraftyman/AdamPyLib/master/AdamPyLib.py
    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac


# check for plex server
clear
read -p "Would you like to set up a Plex server (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        mkdir -p ~/Docuemtns/initial_setup
        cd ~/Documents/initial_setup
        curl -o plex_setup.sh https://raw.githubusercontent.com/thekraftyman/Linux_Setup/master/ubuntu_plex_setup.sh
        sudo bash plex_setup.sh
    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

# check for conky
clear
read -p "Would you like to set up Conky? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        cd ~/Documents/initial_setup
        sudo apt install conky-all -y
        sudo git clone https://github.com/thekraftyman/conky_adam.git
        cd conky_adam
        sudo cp .conkyrc ~/.conkyrc
        sudo cp conky-startup.sh ~/conky-startup.sh
        cd ~/
        sudo chmod +x conky-startup.sh

    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

# check for some fun tools ;)
clear
read -p "Would you like to set up some Cyber Weapons and OSINT tools? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        cd ~/

        echo setting up whois...
        sleep 1
        sudo apt install whois -y
        clear

        echo setting up sherlock...
        sleep 1
        mkdir -p ~/Programs
        cd ~/Programs
        git clone https://github.com/sherlock-project/sherlock.git
        cd sherlock
        pip3 install -r requirements.txt
        cd ~/
        clear

        echo setting up macchanger and aircrack-ng...
        sleep 1
        sudo apt-get install macchanger aircrack-ng
        mkdir ~/Documents/hack_OSIN_tutorials
        cd ~/Documents/hack_OSIN_tutorials
        curl -o wifi_mac_spoofing.html https://null-byte.wonderhowto.com/how-to/hack-open-hotel-airplane-coffee-shop-wi-fi-with-mac-address-spoofing-0183387/
        clear

        #echo setting up wireshark...

        echo setting ip exif...
        sleep 1
        sudo apt install exif -y
        curl -o exif_data.html https://null-byte.wonderhowto.com/how-to/obtain-valuable-data-from-images-using-exif-extractors-0195471/
        clear

        echo setting up fluxion...
        sleep 1
        cd ~/Programs
        git clone https://github.com/wi-fi-analyzer/fluxion.git
        cd ~/Documents/hack_OSIN_tutorials
        curl -o fluxion.html https://null-byte.wonderhowto.com/how-to/hack-wi-fi-capturing-wpa-passwords-by-targeting-users-with-fluxion-attack-0176134/
        clear

        echo getting grabify tutorial...
        sleep 1
        curl -o grabify.html https://null-byte.wonderhowto.com/how-to/catch-internet-catfish-with-grabify-tracking-links-0195466/
        clear

        echo set up photo metadata payload and exiftool...
        sleep 1
        sudo apt-get install exiftool -y
        curl -o photo_payload.html https://null-byte.wonderhowto.com/how-to/hacking-macos-hide-payloads-inside-photo-metadata-0196815/
        clear

    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

# check for custom commands
clear
read -p "Would you like to set up custom commands? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        sleep 2
        cd ~/
        curl -o .bash_aliases https://raw.githubusercontent.com/thekraftyman/Linux_Setup/master/.bash_aliases

    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

# check for apache web server for eportfolio
clear
read -p "Would you like to set up an eportfolio? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        sleep 2
        cd ~/
        sudo apt update && sudo apt upgrade -y
        clear
        echo installing apache2
        sudo apt install apache2 -y
        cd /var/www/html
        sudo rm index.html
        sudo git clone https://github.com/thekraftyman/Adam-eportfolio.git
        sudo mv Adam-eportfolio/* .
        sleep 2
        sudo service apache2 restart

    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

# check for minecraft server
clear
read -p "Would you like to set up a Minecraft Server? (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo 'Awesome:'
        sleep 2
        cd ~/
        sudo apt update && sudo apt upgrade -y
        clear
        sudo apt install libcurl3
        cd ~/Documents
        mkdir mc_server
        wget -O ~/Downloads/mc_server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip
        unzip ~/Downloads/mc_server.zip -d ~/Documents/mc_server
        cd ~/mc_server
        echo Getting IP address:
        hostname -I
        LD_LIBRARY_PATH=. ./bedrock_server
    ;;
    * )
        echo 'Alright then... maybe next time'
    ;;
esac

cd ~/

echo
echo 'All done!'
sleep 5
clear

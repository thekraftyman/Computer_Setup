#!/bin/zsh

# Atom packages
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

# iterm2 info
clear
echo "You can import iterm 2 configuration from the config file in ../shared/configurations/ "

# vimrc & zshrc
ln -s ../shared/configurations/.vimrc ~/.vimrc
ln -s ../shared/configurations/.zshrc ~/.zshrc
## mv ../shared/configurations/.vimrc ~/.vimrc
## mv ../shared/configurations/.zshrc ~/.zshrc

# install the zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

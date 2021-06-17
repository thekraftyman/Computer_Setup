#!/bin/zsh

# upgrade gpg program
brew upgrade gnupg

# install pinetry
brew install pinetry-mac

# add pinetry to zsh
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

# kill gpg
killall gpg-agent

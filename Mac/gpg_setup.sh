#!/bin/zsh

# upgrade gpg program
brew upgrade gnupg

# unlink gpg
brew link --overwrite gnupg

# install pinetry
brew install pinentry-mac

# add pinetry to zsh
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

# kill gpg
killall gpg-agent

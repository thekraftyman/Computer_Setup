#!/bin/zsh

read "git_username?Git username: "
read "git_email?Git email: "

# set up git config
git config --global user.name $git_username
git config --global user.email $git_email

# set up ssh key
ssh-keygen -t rsa -b 4096 -C "$git_email"

#!/bin/zsh
echo "Installing homebrew packages"
packages=$( cat ./brew_packages.txt | tr "\n" " ")
packarr=(${(@s: :)packages})
for package in $packarr; do
  if [[ ! -z $package ]]
  then
    brew install $package
  fi
done

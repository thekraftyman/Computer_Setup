#!/bin/zsh
echo "Installing homebrew packages"
packages=$( cat ./brew_packages.txt | tr "\n" " ")
read -a packarr <<< $packages
for package in "$packarr[@]"; do
  if [[! -z $package ]]
  then
    brew install $package
  fi
done

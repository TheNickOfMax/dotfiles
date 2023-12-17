#!/bin/bash

cp -fr ./.zshrc $HOME
cp -fr ./.nanorc $HOME
cp -fr ./.gitconfig $HOME
cp -fr .fehbg $HOME

cp -fr ./i3 $HOME/.config
cp -fr ./rofi $HOME/.config

sudo cp -fr ./i3blocks.conf /etc
sudo cp -fr ./i3status.conf /etc

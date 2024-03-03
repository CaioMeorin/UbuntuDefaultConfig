#!/bin/bash

# Moving config files
sudo cp .zshrc ~
sudo cp -r .tmux ~
sudo cp .tmux.conf ~

# Installing wanted packages packages
sudo chmod 777 .buildup.sh
./.buildup.sh &

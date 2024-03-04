#!/bin/bash

# Moving config files.
# THESE ARE PERSONAL CONFIG FILES. ADD/REPLACE THEM AS YOU WISH.
sudo cp .zshrc ~
sudo cp -r .tmux ~
sudo cp .tmux.conf ~

# Installing wanted packages packages
sudo chmod 777 .buildup.sh
./.buildup.sh &

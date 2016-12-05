#!/bin/bash
#############################################
# Module Update Script                      #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/07/2016                        #
#############################################

# Update Drupal installation.
cd /var/www/
sudo git stash
sudo git checkout 8.x
sudo git fetch origin 8.x
sudo git rebase -i origin/8.x
sudo git push origin 8.x
sudo git stash pop
sudo composer update
cd html
sudo composer update

# Update local custom module repository from GitHub.
cd modules/custom/vmenu
sudo git stash
sudo git checkout master
sudo git fetch origin master
sudo git rebase -i origin/master
sudo git push origin master
sudo git push drupal master
sudo git stash pop

# Copy updated theme data to themes directory.
cd ../../..
sudo rm -rf ./themes/custom/*
sudo cp -R ./modules/custom/vmenu/theme/vmenu ./themes/custom

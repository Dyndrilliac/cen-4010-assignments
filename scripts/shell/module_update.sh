#!/bin/bash
#############################################
# Custom Module Update Script               #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/07/2016                        #
#############################################

# Change directory to Drupal installation.
cd /var/www/html/modules/custom/vmenu

# Update local custom module repository from GitHub.
sudo git stash
sudo git checkout master
sudo git fetch origin master
sudo git rebase -i origin/master
sudo git push origin master
sudo git push drupal master
sudo git stash pop

# Copy theme data to themes directory.
cd ../../..
sudo rm -rf ./themes/custom/*
sudo cp -R ./modules/custom/vmenu/theme/vmenu ./themes/custom

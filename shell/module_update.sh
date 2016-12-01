#!/bin/bash
#############################################
# Custom Module Update Script               #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/07/2016                        #
#############################################

# Explanation of Command-Line Paramaters
#############################################
# $1 is the root directory where you have Drupal installed.
# Examples:
#     - /var/www/html
#     - /usr/www

# Change directory to drupal installation.
cd $1

# Update local custom module repository from GitHub.
cd modules/custom/vmenu
sudo git stash
sudo git checkout master
sudo git fetch origin master
sudo git rebase -i origin/master
sudo git push origin master
sudo git stash pop

# Copy theme data to themes directory.
cd ../../..
sudo rm -rf ./themes/custom/*
sudo cp -R ./modules/custom/vmenu/theme/vmenu ./themes/custom

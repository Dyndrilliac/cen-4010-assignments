#!/bin/bash
#############################################
# Install Shell Dependencies                #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/04/2016                        #
#############################################

# Run update script.
sudo wget https://raw.githubusercontent.com/Dyndrilliac/linux-shell-scripts/master/update.sh
sudo chmod 755 update.sh
sudo ./update.sh

# Install zip archive extraction tool.
sudo apt install unzip

# Install JQ to handle JSON.
sudo apt-get install jq

# Install PHP 7.x dev tools.
sudo apt-get install php7.0-dev

# Install Composer PHP dependency manager.
EXPECTED_SIGNATURE=$(sudo wget -q -O - https://composer.github.io/installer.sig)
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(sudo php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    sudo rm composer-setup.php
    exit 1
fi

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet
RESULT=$?
sudo rm composer-setup.php
sudo chmod 755 /usr/local/bin/composer

# Run update script.
sudo ./update.sh
sudo rm -f update.sh
exit $RESULT

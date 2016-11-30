#!/bin/bash
#############################################
# Install Shell Dependencies                #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/04/2016                        #
#############################################

# Install zip archive extraction tool.
sudo apt install unzip

# Install PHP 7.x dev tools.
sudo apt-get install php7.0-dev

# Install Composer dependency manager.
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"
sudo chmod 755 /usr/local/bin/composer

#!/bin/bash
#############################################
# Drupal Server Initialization Script       #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/04/2016                        #
#############################################

# Explanation of Command-Line Paramaters
#############################################
# $2 is the single trusted canonical host domain or IP address.
# The script automatically escapes periods contained within the string.
# Examples:
#     - localhost
#     - 192.168.1.4
#     - www.example.com
#     - example.org

# Check for updates, install dependencies, then check for updates again.
sudo wget https://raw.githubusercontent.com/Dyndrilliac/cen-4010-assignments/master/scripts/shell/install_deps.sh
sudo chmod 755 install_deps.sh
sudo ./install_deps.sh
sudo rm -f install_deps.sh

# Drop all default Drupal tables from MySQL/MariaDB.
sudo wget https://raw.githubusercontent.com/Dyndrilliac/cen-4010-assignments/master/scripts/sql/drop_all_default_drupal_tables.sql
sudo mysql -u drupal -p drupal < drop_all_default_drupal_tables.sql
sudo rm -f drop_all_default_drupal_tables.sql

# Delete all Drupal files, then clone the drupal-project repository and run composer.
cd /var/www/
sudo rm -rf *
sudo rm -rf .g*
sudo rm -rf .t*
cd ..
sudo git clone https://github.com/Dyndrilliac/drupal-project.git www
cd www
sudo composer create-project --stability dev --no-interaction

# Download and unpack contrib modules/themes with composer.
sudo composer update

# Download and unpack libraries needed by modules.
cd html
sudo composer update
sudo mkdir libraries
cd libraries
sudo mkdir d3
sudo mkdir highlight
sudo mkdir colorbox
cd d3
sudo wget https://d3js.org/d3.v4.min.js
sudo mv d3.v4.min.js d3.min.js
cd ../highlight
sudo wget https://www.mythicdigitalizations.com/highlight.zip
sudo unzip highlight.zip
sudo rm -f highlight.zip
cd ../colorbox
sudo wget https://github.com/jackmoore/colorbox/archive/1.x.zip
sudo unzip 1.x.zip
sudo rm -f 1.x.zip
sudo mv colorbox-1.x/* .
sudo rm -rf colorbox-1.x

# Setup testing framework.
cd ../../sites
sudo mkdir simpletest
sudo chmod 777 simpletest

# Append trusted host pattern to settings.php.
cd default
sudo echo -e "" >> settings.php
sudo echo "\$settings['trusted_host_patterns'] = array(" >> settings.php
sudo echo "  '^${1//./\\.}\$'," >> settings.php
sudo echo ");" >> settings.php

# Update the PHP Filter module manually.
cd ../../modules
sudo mkdir custom
cd contrib
sudo wget https://ftp.drupal.org/files/projects/php-8.x-1.0-beta2.tar.gz
sudo sudo tar -xvzf php-8.x-1.0-beta2.tar.gz

# Download and unpack custom modules with git.
cd ../custom
sudo git clone https://github.com/Dyndrilliac/cen-4010-assignments.git vmenu

# Copy custom theme from module directory.
cd ../../themes
sudo mkdir custom
cd custom
sudo cp -R ../../modules/custom/vmenu/theme/vmenu .

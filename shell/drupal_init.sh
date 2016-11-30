#!/bin/bash
#############################################
# Drupal Server 8.2.2 Initialization Script #
# Author: Dyndrilliac (Matthew Boyette)     #
# Date:   11/04/2016                        #
#############################################

# Install dependencies (unzip and php7.0-dev).
sudo wget https://raw.githubusercontent.com/Dyndrilliac/cen-4010-assignments/master/shell/install_deps.sh
sudo chmod 755 install_deps.sh
sudo ./install_deps.sh
sudo rm -f install_deps.sh

# Run update script.
sudo wget https://raw.githubusercontent.com/Dyndrilliac/linux-shell-scripts/master/update.sh
sudo chmod 755 update.sh
sudo ./update.sh
sudo rm -f update.sh

# Drop all default Drupal tables from MySQL/MariaDB.
sudo wget https://raw.githubusercontent.com/Dyndrilliac/cen-4010-assignments/master/sql/drop_all_default_drupal_tables.sql
sudo mysql -u drupal -p drupal < drop_all_default_drupal_tables.sql
sudo rm -f drop_all_default_drupal_tables.sql

# Delete all Drupal files.
cd /var/www/html
sudo rm -rf *

# Download and unpack the default Drupal 8.2.3 archive.
sudo wget https://ftp.drupal.org/files/projects/drupal-8.2.3.tar.gz
sudo tar -xvzf drupal-8.2.3.tar.gz
sudo mv drupal-8.2.3/* .
sudo rm -rf drupal-8.2.3
sudo rm -f drupal-8.2.3.tar.gz

# Download and unpack libraries needed by modules.
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
sudo mv colorbox-1.x/* .
sudo rm -rf colorbox-1.x
sudo unzip colorbox-1.x.zip
sudo rm -f colorbox-1.x.zip
sudo unzip 1.x.zip
sudo rm -f 1.x.zip
sudo mv colorbox-1.x/* .
sudo rm -rf colorbox-1.x
cd ../../modules

# Download and unpack modules.
sudo mkdir contrib
sudo mkdir custom
cd contrib
sudo wget https://ftp.drupal.org/files/projects/addtoany-8.x-1.7.tar.gz
sudo wget https://ftp.drupal.org/files/projects/admin_toolbar-8.x-1.17.tar.gz
sudo wget https://ftp.drupal.org/files/projects/backup_migrate-8.x-4.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/bootstrap_layouts-8.x-3.1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/captcha-8.x-1.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/colorbox-8.x-1.2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/ctools-8.x-3.0-alpha27.tar.gz
sudo wget https://ftp.drupal.org/files/projects/devel-8.x-1.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/ds-8.x-2.6.tar.gz
sudo wget https://ftp.drupal.org/files/projects/entity-8.x-1.0-alpha3.tar.gz
sudo wget https://ftp.drupal.org/files/projects/google_analytics-8.x-2.1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/layout_plugin-8.x-1.0-alpha23.tar.gz
sudo wget https://ftp.drupal.org/files/projects/page_manager-8.x-1.0-alpha24.tar.gz
sudo wget https://ftp.drupal.org/files/projects/panels-7.x-3.8.tar.gz
sudo wget https://ftp.drupal.org/files/projects/pathauto-8.x-1.0-beta1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/php-8.x-1.0-beta2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/recaptcha-8.x-2.2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/search_api-8.x-1.0-beta3.tar.gz
sudo wget https://ftp.drupal.org/files/projects/token-8.x-1.0-beta2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/ubercart-8.x-4.0-alpha5.tar.gz
sudo wget https://ftp.drupal.org/files/projects/vcl-8.x-1.1.tar.gz
sudo tar -xvzf *.tar.gz
sudo rm -f *.tar.gz
cd ../custom
sudo git clone https://github.com/Dyndrilliac/cen-4010-assignments.git

# Set up the public unit testing directory, public files directory, and copy Drupal's default settings.
cd ../../sites
sudo mkdir simpletest
sudo chmod 777 simpletest
cd default
sudo mkdir files
sudo chmod 777 files
sudo cp default.settings.php settings.php
sudo chmod 777 settings.php

# Download and unpack themes.
cd ../../themes
sudo mkdir contrib
sudo mkdir custom
cd contrib
sudo wget https://ftp.drupal.org/files/projects/bootstrap-8.x-3.1.tar.gz
sudo tar -xvzf bootstrap-8.x-3.1.tar.gz
sudo rm -f *.tar.gz
cd ../custom
sudo cp -R ../../modules/custom/cen-4010-assignments/theme/vmenu .

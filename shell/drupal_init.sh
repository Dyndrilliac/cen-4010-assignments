#!/bin/bash
####################################################################################
# Drupal Server Initialization Script - SoftwareEngineering Fall 2016 Team Project #
####################################################################################
sudo wget https://raw.githubusercontent.com/Dyndrilliac/linux-shell-scripts/master/update.sh
sudo chmod 755 update.sh
sudo ./update.sh
sudo rm -f update.sh
cd /var/www/html/
sudo rm -rf *
sudo wget https://ftp.drupal.org/files/projects/drupal-8.2.2.tar.gz
sudo tar -xvzf drupal-8.2.2.tar.gz
sudo mv drupal-8.2.2/* .
sudo rm -rf drupal-8.2.2
sudo rm -f drupal-8.2.2.tar.gz
cd modules
sudo mkdir contrib
sudo mkdir custom
cd contrib
sudo wget https://ftp.drupal.org/files/projects/admin_toolbar-8.x-1.17.tar.gz
sudo wget https://ftp.drupal.org/files/projects/backup_migrate-8.x-4.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/captcha-8.x-1.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/ctools-8.x-3.0-alpha27.tar.gz
sudo wget https://ftp.drupal.org/files/projects/google_analytics-8.x-2.1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/pathauto-8.x-1.0-beta1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/recaptcha-8.x-2.2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/token-8.x-1.0-beta2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/vcl-8.x-1.1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/php-8.x-1.0-beta2.tar.gz
sudo wget https://ftp.drupal.org/files/projects/devel-8.x-1.0-alpha1.tar.gz
sudo wget https://ftp.drupal.org/files/projects/addtoany-8.x-1.7.tar.gz
sudo wget http://openmenu.com/downloads/openmenu_drupal.zip
sudo tar -xvzf admin_toolbar-8.x-1.17.tar.gz
sudo tar -xvzf backup_migrate-8.x-4.0-alpha1.tar.gz
sudo tar -xvzf captcha-8.x-1.0-alpha1.tar.gz
sudo tar -xvzf ctools-8.x-3.0-alpha27.tar.gz
sudo tar -xvzf google_analytics-8.x-2.1.tar.gz
sudo tar -xvzf pathauto-8.x-1.0-beta1.tar.gz
sudo tar -xvzf recaptcha-8.x-2.2.tar.gz
sudo tar -xvzf token-8.x-1.0-beta2.tar.gz
sudo tar -xvzf vcl-8.x-1.1.tar.gz
sudo tar -xvzf php-8.x-1.0-beta2.tar.gz
sudo tar -xvzf devel-8.x-1.0-alpha1.tar.gz
sudo tar -xvzf addtoany-8.x-1.7.tar.gz
sudo unzip openmenu_drupal.zip
sudo rm -f *.tar.gz
sudo rm -f *.zip
cd ../custom
sudo git clone https://github.com/Dyndrilliac/cen-4010-assignments.git
cd ../../sites
sudo mkdir simpletest
sudo chmod 777 simpletest
cd default
sudo cp default.settings.php settings.php
sudo chmod 777 settings.php
sudo mkdir files
sudo chmod 777 files
sudo reboot

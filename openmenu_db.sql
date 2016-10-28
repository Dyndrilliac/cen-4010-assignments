/*
OpenMenu DB Schema
authored: OpenMenu.org
website: http://openmenu.org/sdk.php
version: 1.6
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `om_menus`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menus` (
  `MenuID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_description` varchar(255) DEFAULT NULL,
  `menu_note` varchar(255) DEFAULT NULL,
  `currency_symbol` char(3) CHARACTER SET latin1 DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `menu_uid` binary(16) DEFAULT NULL,
  `menu_duration_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `menu_duration_time_start` time DEFAULT NULL,
  `menu_duration_time_end` time DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MenuID`),
  UNIQUE KEY `idx_uid` (`menu_uid`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_groups`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_groups` (
  `MenuGroupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuID` int(10) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(50) DEFAULT NULL,
  `group_description` varchar(255) DEFAULT NULL,
  `group_note` varchar(255) DEFAULT NULL,
  `group_uid` binary(16) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MenuGroupID`),
  UNIQUE KEY `idx_uid` (`group_uid`),
  KEY `idx_menu` (`MenuID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_group_options`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_group_options` (
  `OptionsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `group_options_name` varchar(50) DEFAULT NULL,
  `menu_group_option_information` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `menu_group_option_min_selected` smallint(3) DEFAULT NULL,
  `menu_group_option_max_selected` smallint(3) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OptionsID`),
  KEY `idx_group` (`MenuGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_group_option_item`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_group_option_item` (
  `OptionItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OptionsID` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_group_option_name` varchar(50) DEFAULT NULL,
  `menu_group_option_additional_cost` double(6,2) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OptionItemID`),
  KEY `idx_option` (`OptionsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_items`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_items` (
  `MenuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `item_uid` binary(16) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `special` tinyint(1) DEFAULT NULL,
  `vegetarian` tinyint(1) DEFAULT NULL,
  `vegan` tinyint(1) DEFAULT NULL,
  `kosher` tinyint(1) DEFAULT NULL,
  `halal` tinyint(1) DEFAULT NULL,
  `gluten_free` tinyint(1) DEFAULT NULL,
  `menu_item_name` varchar(75) DEFAULT NULL,
  `menu_item_description` varchar(450) DEFAULT NULL,
  `menu_item_price` double(7,2) DEFAULT NULL,
  `menu_item_calories` int(11) DEFAULT NULL,
  `menu_item_heat_index` tinyint(1) DEFAULT NULL,
  `menu_item_allergy_information` varchar(450) DEFAULT NULL,
  `menu_item_allergy_information_allergens` varchar(120) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MenuItemID`),
  UNIQUE KEY `idx_uid` (`item_uid`),
  KEY `idx_group` (`MenuGroupID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_item_images`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_item_images` (
  `ItemImageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuItemID` int(10) unsigned NOT NULL,
  `image_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ImageMediaID` int(11) DEFAULT NULL,
  `ImageTypeID` int(11) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ItemImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_item_options`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_item_options` (
  `OptionsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `item_options_name` varchar(50) DEFAULT NULL,
  `menu_item_option_information` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `menu_item_option_min_selected` smallint(3) DEFAULT NULL,
  `menu_item_option_max_selected` smallint(3) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OptionsID`),
  KEY `idx_menuitem` (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_item_option_item`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_item_option_item` (
  `OptionItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OptionsID` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_item_option_name` varchar(50) DEFAULT NULL,
  `menu_item_option_additional_cost` double(6,2) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OptionItemID`),
  KEY `idx_option` (`OptionsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_item_sizes`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_item_sizes` (
  `SizeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_item_size_name` varchar(75) DEFAULT NULL,
  `menu_item_size_description` varchar(450) DEFAULT NULL,
  `menu_item_size_price` double(7,2) DEFAULT NULL,
  `menu_item_size_calories` int(11) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SizeID`),
  KEY `idx_menuitem` (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_menu_item_tags`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_menu_item_tags` (
  `TagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MenuItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_item_tag` varchar(35) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TagID`),
  KEY `idx_menuitem` (`MenuItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_openmenu`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_openmenu` (
  `OmID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accuracy` tinyint(1) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `openmenu_id` char(36) DEFAULT NULL,
  `om_version` char(8) DEFAULT NULL,
  `fDateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fDateUpdated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OmID`),
  UNIQUE KEY `idx_uuid` (`openmenu_id`),
  KEY `idx_lastupdate` (`fDateUpdated`)
) ENGINE=MyISAM AUTO_INCREMENT=33739 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `om_ri`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri` (
  `OmfID` int(10) unsigned NOT NULL DEFAULT '0',
  `restaurant_name` varchar(255) DEFAULT NULL,
  `brief_description` varchar(255) DEFAULT NULL,
  `full_description` varchar(2000) DEFAULT NULL,
  `location_id` varchar(25) DEFAULT NULL,
  `mobile` tinyint(1) DEFAULT NULL,
  `address_1` varchar(120) DEFAULT NULL,
  `address_2` varchar(120) DEFAULT NULL,
  `city_town` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `state_province` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `postal_code` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `country` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `longitude` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `latitude` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `utc_offset` double(4,2) DEFAULT NULL,
  `business_type` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `website_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `omf_file_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OmfID`),
  KEY `idx_search_full` (`city_town`,`state_province`,`country`) USING BTREE,
  KEY `idx_search_sml` (`city_town`,`country`),
  KEY `idx_geo` (`latitude`,`longitude`),
  KEY `idx_lat` (`latitude`),
  KEY `idx_lng` (`longitude`),
  KEY `idx_restaurant` (`restaurant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_contacts`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_contacts` (
  `ContactID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL,
  `first_name` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `contact_type` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ContactID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_currency`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_currency` (
  `CurrencyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL,
  `accepted_currency` char(3) CHARACTER SET latin1 DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CurrencyID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_environment`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_environment` (
  `OmfID` int(10) unsigned NOT NULL DEFAULT '0',
  `cuisine_type_secondary` varchar(120) DEFAULT NULL,
  `cuisine_type_primary` varchar(120) DEFAULT NULL,
  `smoking_allowed` tinyint(1) DEFAULT NULL,
  `takeout_available` tinyint(1) DEFAULT NULL,
  `seating_qty` int(4) DEFAULT NULL,
  `max_group_size` int(4) DEFAULT NULL,
  `pets_allowed` tinyint(1) DEFAULT NULL,
  `wheelchair_accessible` tinyint(1) DEFAULT NULL,
  `age_level_preference` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `dress_code` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `music_type` varchar(12) CHARACTER SET latin1 DEFAULT NULL,
  `alcohol_type` varchar(13) CHARACTER SET latin1 DEFAULT NULL,
  `reservations` varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  `catering_available` tinyint(1) DEFAULT NULL,
  `delivery_available` tinyint(1) DEFAULT NULL,
  `delivery_radius` double(5,2) DEFAULT NULL,
  `delivery_fee` double(7,2) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OmfID`),
  KEY `idx_cuisine_type` (`cuisine_type_primary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_logos`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_logos` (
  `LogoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL,
  `logo_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `ImageMediaID` int(11) DEFAULT NULL,
  `ImageTypeID` int(11) DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogoID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_online_ordering`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_online_ordering` (
  `OnlineOrderingID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned DEFAULT NULL,
  `online_order_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `online_order_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `online_order_type` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`OnlineOrderingID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_online_reservations`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_online_reservations` (
  `OnlineReservationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned DEFAULT NULL,
  `online_reservation_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `online_reservation_url` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `online_reservation_type` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`OnlineReservationID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_operating_days`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_operating_days` (
  `OmfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mon_open_time` time DEFAULT NULL,
  `mon_close_time` time DEFAULT NULL,
  `tue_open_time` time DEFAULT NULL,
  `tue_close_time` time DEFAULT NULL,
  `wed_open_time` time DEFAULT NULL,
  `wed_close_time` time DEFAULT NULL,
  `thu_open_time` time DEFAULT NULL,
  `thu_close_time` time DEFAULT NULL,
  `fri_open_time` time DEFAULT NULL,
  `fri_close_time` time DEFAULT NULL,
  `sat_open_time` time DEFAULT NULL,
  `sat_close_time` time DEFAULT NULL,
  `sun_open_time` time DEFAULT NULL,
  `sun_close_time` time DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_parent`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_parent` (
  `OmfID` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_company_name` tinytext CHARACTER SET latin1,
  `address_1` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `address_2` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `city_town` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `state_province` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `postal_code` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `country` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `parent_company_website` varchar(120) CHARACTER SET latin1 DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_parking`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_parking` (
  `OmfID` int(10) unsigned NOT NULL,
  `street_free` tinyint(1) DEFAULT NULL,
  `street_metered` tinyint(1) DEFAULT NULL,
  `private_lot` tinyint(1) DEFAULT NULL,
  `garage` tinyint(1) DEFAULT NULL,
  `valet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_regions`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_regions` (
  `RegionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL,
  `ParentID` int(11) unsigned DEFAULT NULL COMMENT 'ID of the parent for this region - if blank its the root',
  `region_name` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `destination` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RegionID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_ri_seating_locations`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_ri_seating_locations` (
  `SeatingLocationsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OmfID` int(10) unsigned NOT NULL,
  `seating_location` tinytext CHARACTER SET latin1,
  `fDateAdded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SeatingLocationsID`),
  KEY `idx_omf` (`OmfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `om_type_image_media`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_type_image_media` (
  `ImageMediaID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`ImageMediaID`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of om_type_image_media
-- ----------------------------
INSERT INTO om_type_image_media VALUES ('1', 'Mobile');
INSERT INTO om_type_image_media VALUES ('2', 'Print');
INSERT INTO om_type_image_media VALUES ('3', 'Web');
INSERT INTO om_type_image_media VALUES ('4', 'All');

-- ----------------------------
-- Table structure for `om_type_image_type`
-- ----------------------------
CREATE TABLE IF NOT EXISTS `om_type_image_type` (
  `ImageTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`ImageTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of om_type_image_type
-- ----------------------------
INSERT INTO om_type_image_type VALUES ('1', 'Full');
INSERT INTO om_type_image_type VALUES ('2', 'Thumbnail');
INSERT INTO om_type_image_type VALUES ('3', 'Zoom');

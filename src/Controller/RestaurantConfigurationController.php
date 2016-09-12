<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\RestaurantConfigurationController.
 */

namespace Drupal\restaurant_manager\Controller;

use Drupal\Core\Controller\BlockController;
use Drupal\restaurant_manager\Plugin\Block\RestaurantNameBlock;

class RestaurantConfigurationController extends BlockController {
  public function content() {
    $nameBlock = new RestaurantNameBlock();
    return $nameBlock->build();
  }
}

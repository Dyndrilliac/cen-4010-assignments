<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\RestaurantConfigurationController.
 */

namespace Drupal\restaurant_manager\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\restaurant_manager\Plugin\Block\RestaurantNameBlock;

class RestaurantConfigurationController extends ControllerBase {
  public function content() {
    return array(
      '#type' => 'markup',
      '#markup' => t('Hello, Food!'),
    );
  }
}

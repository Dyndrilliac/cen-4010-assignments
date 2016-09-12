<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\RestaurantController.
 */

namespace Drupal\restaurant_manager\Controller;

use Drupal\Core\Controller\ControllerBase;

class RestaurantController extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('Hello, Food!'),
    );
  }
}

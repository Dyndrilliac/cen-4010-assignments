<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\HelloWorld.
 */

namespace Drupal\restaurant_manager\Controller;

use Drupal\Core\Controller\ControllerBase;

class HelloWorld extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('Why aren't we learning!'),
    );
  }
}

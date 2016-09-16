<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\HelloWorld.
 */

//Controller is name of file
namespace Drupal\restaurant_manager\Controller;

//ControllerBase is the base class for file
use Drupal\Core\Controller\ControllerBase;

class HelloWorld extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('Why aren\'t we learning!'),
    );
  }
}

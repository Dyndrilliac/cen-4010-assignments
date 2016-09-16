<?php
/**
 * @file
 * Contains \Drupal\restaurant_manager\Controller\StatusController.
 */

/**Controller is name of file*/
namespace Drupal\restaurant_manager\Controller;

use Drupal\Core\Controller\ControllerBase;

class StatusController extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('A real-time status update will display here using AJAX in later iterations.'),
    );
  }
}

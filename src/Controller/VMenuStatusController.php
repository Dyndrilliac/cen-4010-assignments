<?php
/**
 * @file
 * Contains \Drupal\vmenu\Controller\StatusController.
 */

/**Controller is name of file*/
namespace Drupal\vmenu\Controller;

use Drupal\Core\Controller\ControllerBase;

class VMenuStatusController extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('A real-time status update will be displayed here in later iterations using AJAX.'),
    );
  }
}

<?php
/**
 * @file
 * Contains \Drupal\vmenu\Controller\StatusController.
 */
namespace Drupal\vmenu\Controller;

use Drupal\Core\Controller\ControllerBase;

class StatusController extends ControllerBase {
  public function content() {
    return array(
        '#type' => 'markup',
        '#markup' => $this->t('TODO: Display orders based on user permissions.'),
    );
  }
}

<?php
namespace Drupal\restaurant_manager\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'Restaurant Manager config' block
 *
 * @Block(
 *   id = "restaurant_manager_config_block",
 *   admin_label = @Translation("Restaurant Manager config block"),
 * )
 */
class RestaurantManagerBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $form = \Drupal::formBuilder()->getForm('Drupal\restaurant_manager\Form\RestaurantConfigurationForm');
    return $form;
  }
}


<?php
namespace Drupal\restaurant_manager\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'Restaurant Manager configuration' block
 *
 * @Block(
 *   id = "restaurant_manager_configuration_block",
 *   admin_label = @Translation("Restaurant Manager configuration block"),
 * )
 */
class RestaurantManagerConfigurationBlock extends BlockBase {
  /**
   * {@inheritdoc}
   */
  public function build() {
    $form = \Drupal::formBuilder()->getForm('Drupal\restaurant_manager\Form\RestaurantManagerConfigurationForm');
    return $form;
  }
}

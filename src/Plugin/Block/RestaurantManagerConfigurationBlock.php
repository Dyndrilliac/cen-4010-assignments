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
  public function getBlockId() {
    // Unique ID of the block.
    return 'restaurant_manager_configuration_block';
  }
  
  /**
   * {@inheritdoc}
   */
  public function build() {
    $form = \Drupal::formBuilder()->getForm('Drupal\restaurant_manager\Form\RestaurantManagerConfigurationForm');
    return $form;
  }
}

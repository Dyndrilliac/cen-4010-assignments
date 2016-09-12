<?php
namespace Drupal\restaurant_manager\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant Name' block
 *
 * @Block(
 *   id = "restaurant_name_block",
 *   admin_label = @Translation("Restaurant Name block"),
 * )
 */
class RestaurantNameBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $form = \Drupal::formBuilder()->getForm('Drupal\restaurant_manager\Form\RestaurantNameForm');

	return $form;
  }
}


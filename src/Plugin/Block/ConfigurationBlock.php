<?php
/**
 * @file
 * Contains \Drupal\vmenu\Plugin\ConfigurationBlock.
 */
namespace Drupal\vmenu\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a 'V-Menu configuration' block
 *
 * @Block(
 *   id = "vmenu_configuration_block",
 *   admin_label = @Translation("V-Menu configuration block"),
 * )
 */
class ConfigurationBlock extends BlockBase {
  /**
   * {@inheritdoc}
   */
  public function build() {
    $form = \Drupal::formBuilder()->getForm('Drupal\vmenu\Form\ConfigurationForm');
    return $form;
  }
}

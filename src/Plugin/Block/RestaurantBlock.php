<?php
namespace Drupal\restaurant_manager\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant Name' block
 *
 * @Block(
 *   id = "restaurant_name_block",
 *   admin_label = @Translation("Restaurant name block"),
 * )
 */
class RestaurantNameBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $config = $this->getConfiguration();

    if (!empty($config['restaurant_name_block_settings'])) {
      $name = $config['restaurant_name_block_settings'];
    }
    else {
      $name = $this->t('to no one');
    }
    return array(
      '#markup' => $this->t('Hello, @name!', array(
          '@name' => $name,
        )
      ),
    );
  }

  /**
   * {@inheritdoc}
   */
  public function blockForm($form, FormStateInterface $form_state) {
    $form = parent::blockForm($form, $form_state);

    $default_config = \Drupal::config('restaurant_manager.settings.yml');
    $config = $this->getConfiguration();

    $form['restaurant_name_block_settings'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Restaurant Name'),
      '#description' => $this->t('What is the name of your restaurant?'),
      '#default_value' => isset($config['restaurant_name_block_settings']) ? $config['restaurant_name_block_settings'] : $default_config->get('restaurant.name'),
    );

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function blockSubmit($form, FormStateInterface $form_state) {
    $this->setConfigurationValue('restaurant_block_settings', $form_state->getValue('restaurant_block_settings'));
  }
}


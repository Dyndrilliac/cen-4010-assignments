<?php
namespace Drupal\restaurant_manager\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant' Block
 *
 * @Block(
 *   id = "restaurant_block",
 *   admin_label = @Translation("Restaurant block"),
 * )
 */
class RestaurantBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $config = $this->getConfiguration();

    if (!empty($config['restaurant_block_settings'])) {
      $name = $config['restaurant_block_settings'];
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

    $form['hello_block_settings'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Who'),
      '#description' => $this->t('Who do you want to say hello to?'),
      '#default_value' => isset($config['restaurant_block_settings']) ? $config['restaurant_block_settings'] : $default_config->get('restaurant.name'),
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


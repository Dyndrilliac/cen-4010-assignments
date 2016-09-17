<?php
namespace Drupal\restaurant_manager\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant Manager Configuration' form
 *
 * @Form(
 *   id = "restaurant_manager_configuration_form",
 *   admin_label = @Translation("Restaurant Manager Configuration form"),
 * )
 */
class RestaurantManagerConfigurationForm extends FormBase {
  public function getFormId() {
    // Unique ID of the form.
    return 'restaurant_manager_configuration_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    //$default_config = \Drupal::config('resaurant_manager.settings');
    //$config = $this->getConfiguration();
    
    $form['restaurant_name'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Restaurant Name'),
      '#description' => $this->t('What is the name of your restaurant?'),
      '#required' => true,
      //'#default_value' => isset($config['restaurant_name']) ? $config['restaurant_name'] : $default_config->get('restaurant.name'),
    );
    
    $form['actions']['#type'] = 'actions';
    
    $form['actions']['submit'] = array(
      '#type' => 'submit',
      '#value' => $this->t('Save Configuration'),
      '#button_type' => 'primary',
    );

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    // Validate submitted form data.
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    // Handle submitted form data.
    //$this->setConfigurationValue('restaurant_name', $form_state->getValue('restaurant_name'));
  }
}

<?php
namespace Drupal\restaurant_manager\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant Manager configuration' form
 *
 * @Form(
 *   id = "restaurant_manager_configuration_form",
 *   admin_label = @Translation("Restaurant Manager configuration form"),
 * )
 */
class RestaurantManagerConfigurationForm extends FormBase {
  public function getFormId() {
    // Unique ID of the form.
    return 'restaurant_manager_configuration_form';
  }

  public function buildForm(array $form, FormStateInterface $form_state) {
    $default_config = \Drupal::service('config.factory')->getEditable('restaurant_manager.settings');
    $default_name = $default_config->get('restaurant.name');

    $form['restaurant_name'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Restaurant Name'),
      '#description' => $this->t('What is the name of your restaurant?'),
      '#required' => true,
      '#default_value' => $default_name,
    );
    
    $form['actions']['#type'] = 'actions';
    
    $form['actions']['submit'] = array(
      '#type' => 'submit',
      '#value' => $this->t('Save Configuration'),
      '#button_type' => 'primary',
    );

    return $form;
  }

  public function validateForm(array &$form, FormStateInterface $form_state) {
    // Validate submitted form data.
  }

  public function submitForm(array &$form, FormStateInterface $form_state) {
    // Handle submitted form data.
  }
}

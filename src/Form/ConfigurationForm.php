<?php
/**
 * @file
 * Contains \Drupal\vmenu\Form\ConfigurationForm.
 */
namespace Drupal\vmenu\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'V-Menu Configuration' form
 *
 * @Form(
 *   id = "vmenu_configuration_form",
 *   admin_label = @Translation("V-Menu Configuration form"),
 * )
 */
class ConfigurationForm extends FormBase {
  public function getFormId() {
    // Unique ID of the form.
    return 'vmenu_configuration_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {

    $form['restaurant_name'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Restaurant Name'),
      '#description' => $this->t('What is the name of your restaurant?'),
      '#required' => true,
      //'#default_value' => ?,
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
  }
}

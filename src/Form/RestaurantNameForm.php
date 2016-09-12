namespace Drupal\restaurant_manager\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

/**
 * Provides a 'Restaurant Name' form
 *
 * @Form(
 *   id = "restaurant_name_form",
 *   admin_label = @Translation("Restaurant Name form"),
 * )
 */
class RestaurantNameForm extends FormBase {
  public function getFormId() {
    // Unique ID of the form.
    return 'restaurant_name_form';
  }

  public function buildForm(array $form, FormStateInterface $form_state) {
    // Create a $form API array.
    $form = parent::blockForm($form, $form_state);
    
    // Get config.
    $default_config = \Drupal::config('restaurant_manager.settings.yml');
    $config = $this->getConfiguration();
    
    $form['restaurant_name_form_settings'] = array (
      '#type' => 'textfield',
      '#title' => $this->t('Restaurant Name'),
      '#description' => $this->t('What is the name of your restaurant?'),
      '#default_value' => isset($config['restaurant_name_form_settings']) ? $config['restaurant_name_form_settings'] : $default_config->get('restaurant.name'),
      '#required' => TRUE,
    );
    
    return $form;
  }

  public function validateForm(array &$form, FormStateInterface $form_state) {
    // Validate submitted form data.
  }

  public function submitForm(array &$form, FormStateInterface $form_state) {
    // Handle submitted form data.
    $this->setConfigurationValue('restaurant_name_form_settings', $form_state->getValue('restaurant_name_form_settings'));
  }
}

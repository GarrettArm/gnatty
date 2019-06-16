

if (file_get_contents('/run/secrets/drupal_salt') && empty($settings['hash_salt'])) {
    $settings['hash_salt'] = file_get_contents('/run/secrets/drupal_salt');
};

$config_directories['sync'] = '/drupal_sync';

$databases['default']['default'] = array (
  'database' => file_get_contents('/run/secrets/mysql_database'),
  'username' => file_get_contents('/run/secrets/mysql_user'),
  'password' => file_get_contents('/run/secrets/mysql_password'),
  'prefix' => '',
  'host' => file_get_contents('/run/secrets/mysql_host'),
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);

$settings['install_profile'] = 'minimal';

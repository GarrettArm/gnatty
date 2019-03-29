
$config_directories[CONFIG_SYNC_DIRECTORY] = 'config/sync';

if (file_exists(__DIR__ . '/settings.local.php') && (getenv('ENVIRONMENT') == 'DEV')) {
  include __DIR__ . '/settings.local.php';
}

$databases['default']['default'] = array (
  'database' => getenv('MYSQL_DATABASE'),
  'username' => getenv('MYSQL_USER'),
  'password' => getenv('MYSQL_PASSWORD'),
  'prefix' => '',
  'host' => getenv('MYSQL_HOST'),
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);

$settings['install_profile'] = 'minimal';

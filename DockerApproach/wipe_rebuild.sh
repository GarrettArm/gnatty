docker-compose down
echo "removing drupal_app"
sudo rm -R drupal_app
mkdir -p drupal_app
sudo chown www-data:www-data drupal_app
sudo chown www-data:www-data drupal_sync
docker ps
docker volume rm dockerapproach_site_root dockerapproach_db_data
docker network prune -f
docker system prune -f
docker volume ls
docker network ls
docker ps -a
docker-compose up
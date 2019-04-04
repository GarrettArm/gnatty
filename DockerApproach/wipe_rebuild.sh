docker-compose down
echo "removing drupal_app"
sudo rm -R drupal_app
mkdir -p drupal_app
sudo chown www-data:www-data drupal_app
echo "these containers are currently running (should be none)"
docker ps
docker volume rm dockerapproach_site_root dockerapproach_db_data
docker network prune -f
docker system prune -f
docker volume ls
echo "these volumes exist (should be none)"
docker network ls
echo "these netword exist (should be the default three)"
docker ps -a
echo "these containers exist (should be none)"
docker-compose up
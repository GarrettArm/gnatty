docker-compose down
echo "removing drupal_app"
sudo rm -R drupal_app
mkdir -p drupal_app
sudo chown root:root drupal_app
docker ps
docker volume prune -f
docker network prune -f
docker system prune  -f
docker volume ls
docker network ls
docker ps -a
docker-compose up

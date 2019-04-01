docker-compose down
echo "removing DrupalCode/app"
sudo rm -R DrupalCode/app
mkdir -p DrupalCode/app
sudo chown root:root DrupalCode/app
docker ps
docker volume prune -f
docker network prune -f
docker system prune  -f
docker volume ls
docker network ls
docker ps -a
docker-compose build --no-cache
docker-compose up --build

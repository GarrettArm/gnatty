docker-compose down
echo "##### these containers are currently running (should be none)"
docker ps
docker volume prune -f && docker network prune -f && docker system prune -f && sudo rm -r drupal_app/
echo "##### these volumes exist (should be none)"
docker volume ls
echo "##### these netword exist (should be the default three)"
docker network ls
echo "##### these containers exist (should be none)"
docker-compose up
docker-compose down
docker volume rm -f gnatty_db_data gnatty_drupal_data
docker-compose up --build -d

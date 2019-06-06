docker-compose down
docker volume rm gnatty_db_data -f && docker volumer rm gnatty_drupal_data -f
docker-compose up --build -d

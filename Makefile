default:
	make up

build:
	docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down -v

in:
	docker exec -it drupal bash

export:
	docker exec -it ${WP_CONTAINER_NAME} wp --allow-root db export db/dump-$(shell date +%F)${file}.sql

import:
	docker exec -i drupal drush sqlc < db/${file} && make cr

cr:
	docker exec -i drupal drush cr

sql-drop:
	docker exec -i drupal drush sql-drop -y


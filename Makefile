#  docker-compose up -d --build
# docker-compose exec php bash

# make fresh installation with all the needed initial dependencies
fresh-install: docker-rebuild docker-up composer-install

# the command used to install all the needed in the container vendors
install: composer-install

# the main command that runs all the services needed to run the app for development purpose
docker-up:
	docker-compose up -d --force-recreate
# docker-compose up -d --build


# get down all the services in terms of the project build with docker-compose
docker-down:
	docker-compose down

# general wrapper of a docker command which lists all the run containers in terms of this project
ls:
	docker-compose ps

# get SSH access to the bash of the CLI container used for artisan commands
ssh:
	docker-compose run php bash
# 	docker-compose exec server bash

# rebuild and recreate all the existing services
docker-rebuild:
	docker-compose build --no-cache
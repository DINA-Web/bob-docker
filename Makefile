NAME = dina/bob
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)
TS := $(shell date '+%Y_%m_%d_%H_%M')

all: build up

init:
	@echo "Pulling source code for dependencies..."
	cd repos && get_repos.sh	

build:
	@echo "Building everything..."
	docker build --tag $(NAME) .
	#docker tag bf8b47d608a3 dina-web/bob

clean:
	sudo rm -rf repos

push:
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	docker push $(NAME)

release: build push

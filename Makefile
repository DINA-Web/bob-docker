TS := $(shell date '+%Y_%m_%d')
NAME = dina/bob:$(TS)
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)

all: init build

init:
	Rscript create_scripts.R

build:
	@echo "Compiling docker image..."
	docker build --tag $(NAME) .

report-bigfiles:
	@echo "Finding big files"
	docker run -it --rm dina/bob find /repos -size +10000k

clean:
	sudo rm -rf repos

push:
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	docker push $(NAME)

release: build push

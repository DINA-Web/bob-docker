# bob-docker

Bob - Backups and Builds Binary OBjects - ie all components in DINA-Web are backuped and built from scratch

## Usage

All of DINA-Web repos w sources can be backuped into a single image with:

		make

That image is tagged with the date and can be pushed to Docker Hub with:

		make push

## Requirements

For this to work, you need:

- docker
- docker-compose
- git
- make

GIT_COMMIT=$(shell git rev-parse --short HEAD)
REPOSITORY_URL=rails-blog-example:$(GIT_COMMIT)

build:
	docker image build -t ${REPOSITORY_URL} .

run:
	docker container run -it ${REPOSITORY_URL} bash


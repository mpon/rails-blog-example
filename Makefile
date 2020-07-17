GIT_COMMIT=$(shell git rev-parse --short HEAD)
REPOSITORY_URL=rails-blog-example:$(GIT_COMMIT)

GENERATE_IMAGE=rails-generate:latest

build/generate:
	docker image build -t ${GENERATE_IMAGE} -f Dockerfile-generate .

generate: build/generate
	docker container run -it -v $(PWD):/work -w /work \
		${GENERATE_IMAGE} rails new blog

run:
	docker container run -it -v $(PWD):/work -w /work -p 3000:3000  ${REPOSITORY_URL} \
		sh -c 'cd blog && bundle install && rails s'


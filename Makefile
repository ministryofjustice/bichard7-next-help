BASE_DOCKER_CMD = docker run -it --volume $$PWD:/usr/src/app -w /usr/src/app --env BUNDLE_PATH=/usr/src/app/vendor/bundle
DOCKER_EXEC_CMD = $(BASE_DOCKER_CMD) ruby:3.0
DOCKER_SERVE_CMD = $(BASE_DOCKER_CMD) -p 4000:4000 ruby:3.0

.PHONY: install
install:
	$(DOCKER_EXEC_CMD) bundle install

.PHONY: build
build: install
	$(DOCKER_EXEC_CMD) bundle exec jekyll build

.PHONY: run
run: install
	$(DOCKER_SERVE_CMD) bundle exec jekyll serve --host 0.0.0.0

.PHONY: test
test: build
	$(DOCKER_EXEC_CMD) bundle exec htmlproofer --disable-external ./_site
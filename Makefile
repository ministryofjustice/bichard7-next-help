.PHONY: build
build:
	docker build -t bichard-help .

.PHONY: install
install: build
	docker run -it --volume $$PWD:/usr/src/app bichard-help bundle install

.PHONY: run
run: install
	docker run -it --volume $$PWD:/usr/src/app -p 4000:4000 bichard-help bundle exec jekyll serve --host 0.0.0.0

.PHONY: test
test: build
	docker run -it --volume $$PWD:/usr/src/app bichard-help bin/test.sh
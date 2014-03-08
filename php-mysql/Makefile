REPO=mikz/php-mysql

all: build

build:
	docker build -t $(REPO) -rm .

run:
	docker run -rm -t -i $(REPO)

bash:
	docker run -rm -t -i $(REPO) /bin/bash

push:
	docker push $(REPO)

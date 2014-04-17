REPO=mikz/passenger
TAG=1.8
IMAGE=$(REPO):$(TAG)

all: build

build:
	docker build -t $(IMAGE) --rm .

push:
	docker push $(REPO)

bash:
	docker run --rm -t -i $(IMAGE) /bin/bash

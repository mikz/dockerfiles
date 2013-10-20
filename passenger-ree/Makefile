REPO=mikz/passenger
TAG=1.8

all: build

build:
	docker build -t $(REPO):$(TAG) -rm .
push:
	docker push $(REPO)

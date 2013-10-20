REPO=mikz/passenger
TAG=1.9

all: build

build:
	docker build -t $(REPO):$(TAG) -rm .
push:
	docker push $(REPO)

REPO=mikz/base

all: build

build:
	docker build -t $(REPO):precise -rm .
push:
	docker push $(REPO)

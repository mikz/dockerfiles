REPO=mikz/base

.DEFAULT: build
.PHONY: build push all

all: build

build:
	docker build -t $(REPO):precise -rm .
push:
	docker push $(REPO)

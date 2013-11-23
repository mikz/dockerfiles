REPO=mikz/radiant

all: build

build:
	docker build -t $(REPO) -rm .
push:
	docker push $(REPO)

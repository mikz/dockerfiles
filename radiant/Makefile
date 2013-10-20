REPO=docker.o2h.cz/radiant

all: build

build:
	docker build -t $(REPO) -rm .
push:
	docker push $(REPO)

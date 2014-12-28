REPO=mikz/transmission

all: build

build:
	docker build -t $(REPO) .
push:
	docker push $(REPO)
bash:
	docker run -t -i -v ~/storage:/mnt/storage $(REPO) /bin/bash
run:
	docker run --detach --publish 22 --publish 51413:51413 --expose 9091 --volume ~/storage:/mnt/storage $(REPO)

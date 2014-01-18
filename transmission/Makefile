REPO=mikz/transmission

all: build

build:
	docker build -t $(REPO) -rm .
push:
	docker push $(REPO)
bash:
	docker run -t -i -v ~/storage:/mnt/storage $(REPO) /bin/bash
run:
	docker run -t -i -d -p 22 -p 51413:51413 -e 9091 -v ~/storage:/mnt/storage $(REPO)

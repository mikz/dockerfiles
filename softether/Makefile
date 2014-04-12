REPO=mikz/softether

.PHONY: admin bash start build

all: build

build:
	docker build -t $(REPO) .

push:
	docker push $(REPO)

start:
	docker run -d --name softether -p 1194:1194 $(REPO)

admin: CMD = vpnadmin
admin: run

bash: CMD = bash
bash: run

run:
	docker run -t -i --rm --link softether:softether $(REPO) $(CMD)


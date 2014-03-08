REPO=mikz/postgres

PG_DATA=/var/lib/postgresql/data/
VOLUMES=-v $(PG_DATA):/data

all: build

build:
	docker build -t $(REPO) -rm .

push:
	docker push $(REPO)

start:
	docker run -d -name postgres -p 172.17.42.1:5432:5432 $(VOLUMES) $(REPO)

run:
	docker run -t -i -rm -e PGHOST=172.17.42.1 $(VOLUMES) $(REPO) $(filter-out $@,$(MAKECMDGOALS)) $(ARGS)

bash:
	docker run -t -i -rm  $(REPO) /bin/bash

init:
	docker run $(VOLUMES) $(REPO) pg_ctl init

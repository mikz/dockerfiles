REPO=mikz/postgres

PG_DATA=/var/lib/postgresql/data/
all: build

build:
	docker build -t $(REPO) -rm .
push:
	docker push $(REPO)
start:
	docker run -d -name postgres -p 172.17.42.1:5432:5432 -v $(PG_DATA):/data $(REPO)
run:
	docker run -t -i -rm -e PGHOST=172.17.42.1 -v $(PG_DATA):/data $(REPO) $(filter-out $@,$(MAKECMDGOALS)) $(ARGS)

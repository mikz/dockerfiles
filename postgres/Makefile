REPO=mikz/postgres

PG_DATA=/var/lib/postgresql/data/
all: build

build:
	docker build -t $(REPO) -rm .
push:
	docker push $(REPO)
start:
	docker run -d -p 5432:5432 -v $(PG_DATA):/data $(REPO)

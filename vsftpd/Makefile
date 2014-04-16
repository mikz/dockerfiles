NAME=ftp
REPO=mikz/$(NAME)

.PHONY: admin bash start build

all: build

build:
	docker build -t $(REPO) .

push:
	docker push $(REPO)

start:
	docker run -d --name $(NAME) -p 21 $(REPO)

bash: CMD = bash
bash: build run

run:
	docker run -t -i -v /var:/ftp --rm $(REPO) $(CMD)


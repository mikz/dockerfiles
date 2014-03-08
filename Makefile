MODE=build

DOCKERS = base hosting passenger postgres passenger-ree php-mysql transmission

.PHONY: $(DOCKERS)
.DEFAULT: build

build: $(DOCKERS)
push: $(DOCKERS)


hosting: base
passenger: hosting
postgres: hosting
passenger-ree: hosting
php-mysql: base

$(DOCKERS):
	$(MAKE) -C $@


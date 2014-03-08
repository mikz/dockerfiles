MODE=build

DOCKERS = base hosting passenger postgres passenger-ree php-mysql transmission

.PHONY: $(DOCKERS)
.DEFAULT: build

build: $(DOCKERS)
push: $(DOCKERS)

$(DOCKERS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

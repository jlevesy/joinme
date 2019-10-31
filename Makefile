.PHONY: dev
dev:
	@hugo serve

.PHONY: build
build:
	@hugo -d $(DIST_DIR)

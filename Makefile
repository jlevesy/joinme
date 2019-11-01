DIST_DIR := ./_dist

.PHONY: dev
dev:
	@hugo serve

.PHONY: build
build:
	@hugo -d $(DIST_DIR)

.PHONY: clean
clean:
	@rm -rf $(DIST_DIR)/*

.PHONY: deploy
deploy: clean setup_worktree build
	cd $(DIST_DIR) && git add --all && git commit -m "Deploying to gh-pages"
	git push origin gh-pages

.PHONY: setup_worktree
setup_worktree:
	git worktree add -B gh-pages $(DIST_DIR) origin/gh-pages

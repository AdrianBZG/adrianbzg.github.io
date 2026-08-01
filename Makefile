# ---------------------------------------------------------------------------
# Makefile for the al-folio site published at https://bazaga.ai
#
# Typical workflow:
#   make install   # one-time: install Ruby gem dependencies
#   make serve     # local preview with live reload
#   make deploy    # build and publish to bazaga.ai (gh-pages branch)
#
# Run `make` or `make help` to list all available targets.
# ---------------------------------------------------------------------------

# Jekyll runs through Bundler so the versions from the Gemfile are used.
BUNDLE        := bundle
JEKYLL        := $(BUNDLE) exec jekyll
SITE_DIR      := _site
SRC_BRANCH    := master
DEPLOY_BRANCH := gh-pages

.DEFAULT_GOAL := help
.PHONY: help install build compile serve serve-drafts clean doctor update deploy publish

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

install: ## Install Ruby gem dependencies (bundle install)
	$(BUNDLE) install

build: ## Compile the static site into _site/
	$(JEKYLL) build

compile: build ## Alias for `build`

serve: ## Preview locally with live reload at http://localhost:4000
	$(JEKYLL) serve --livereload

serve-drafts: ## Like `serve`, but also render draft posts
	$(JEKYLL) serve --livereload --drafts

clean: ## Remove the generated site and Jekyll caches
	rm -rf $(SITE_DIR) .jekyll-cache .jekyll-metadata

doctor: ## Check the site for common configuration issues
	$(JEKYLL) doctor

update: ## Update gems to the latest versions allowed by the Gemfile
	$(BUNDLE) update

deploy: ## Build and deploy to bazaga.ai (force-push to gh-pages)
	./bin/deploy --src $(SRC_BRANCH) --deploy $(DEPLOY_BRANCH)

publish: ## Push master to trigger the GitHub Actions deploy
	git push origin $(SRC_BRANCH)

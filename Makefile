# ---------------------------------------------------------------------------
# Makefile for the static site published at https://bazaga.ai
#
# The site is plain static HTML served by GitHub Pages from the `gh-pages`
# branch. Day-to-day work happens on `master`; `make deploy` mirrors master
# to gh-pages, which updates the live site.
#
# Workflow:
#   1. edit files and commit on `master`
#   2. make deploy      # push master, then publish it to the live site
#
# Run `make` or `make help` to list targets.
# ---------------------------------------------------------------------------

SRC_BRANCH    := master
DEPLOY_BRANCH := gh-pages
PREVIEW_PORT  := 4000

.DEFAULT_GOAL := help
.PHONY: help preview deploy

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-9s\033[0m %s\n", $$1, $$2}'

preview: ## Serve the site locally at http://127.0.0.1:4000
	python3 -m http.server $(PREVIEW_PORT) --bind 127.0.0.1

deploy: ## Publish master to gh-pages (updates the live site at bazaga.ai)
	git push origin $(SRC_BRANCH)
	git push --force origin $(SRC_BRANCH):$(DEPLOY_BRANCH)

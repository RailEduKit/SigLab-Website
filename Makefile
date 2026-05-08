PANDOC ?= pandoc
SIBLINGS_ROOT ?= ..

OUT := public
BUILD := .build
TEMPLATE := site/template.html
FILTERS := --lua-filter=site/filters/md-links-to-html.lua --lua-filter=site/filters/figure-caption.lua

CONTENT_MD_SRC := $(shell find content -type f -name "*.md" ! -name "SUMMARY.md")
ROOT_MD_SRC := contributors.md
HTML_OUT := $(patsubst content/%.md,$(OUT)/%.html,$(CONTENT_MD_SRC)) $(patsubst %.md,$(OUT)/%.html,$(ROOT_MD_SRC))

export SIBLINGS_ROOT

all: check-deps external site

check-deps:
	tests/check-external.sh site/external-deps.tsv

external: check-deps
	site/scripts/copy-external.sh site/external-deps.tsv $(OUT)

site: $(HTML_OUT) $(OUT)/style.css local-assets

$(OUT)/%.html: content/%.md $(TEMPLATE) $(BUILD)/sidebar.html
	@mkdir -p $(dir $@)
	@if [ ! -f "$(BUILD)/prevnext/$*.yaml" ]; then mkdir -p "$(dir $(BUILD)/prevnext/$*.yaml)" && : > "$(BUILD)/prevnext/$*.yaml"; fi
	$(PANDOC) $(FILTERS) \
		--template=$(TEMPLATE) \
		--metadata=path:"$*" \
		--metadata-file=$(BUILD)/prevnext/$*.yaml \
		--variable sidebar="$$(cat $(BUILD)/sidebar.html)" \
		-o $@ $<

$(OUT)/%.html: %.md $(TEMPLATE) $(BUILD)/sidebar.html
	@mkdir -p $(dir $@)
	@if [ ! -f "$(BUILD)/prevnext/$*.yaml" ]; then mkdir -p "$(dir $(BUILD)/prevnext/$*.yaml)" && : > "$(BUILD)/prevnext/$*.yaml"; fi
	$(PANDOC) $(FILTERS) \
		--template=$(TEMPLATE) \
		--metadata=path:"$*" \
		--metadata-file=$(BUILD)/prevnext/$*.yaml \
		--variable sidebar="$$(cat $(BUILD)/sidebar.html)" \
		-o $@ $<

$(BUILD)/sidebar.html $(BUILD)/prevnext: content/SUMMARY.md
	@mkdir -p $(BUILD)
	site/scripts/build-nav.sh content/SUMMARY.md $(BUILD)

$(OUT)/style.css: site/style.css
	@mkdir -p $(OUT)
	cp $< $@

local-assets:
	@mkdir -p $(OUT)/assets
	cp -R assets/. $(OUT)/assets/

serve: all
	cd $(OUT) && python3 -m http.server 8000

clean:
	rm -rf $(OUT) $(BUILD)

.PHONY: all check-deps external site local-assets serve clean

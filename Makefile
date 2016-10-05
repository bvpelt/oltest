# General rules
CLOSURE_COMPILER=./node_modules/openlayers/node_modules/.bin/closure-util
DDIR =./dist
SDIR =./src

_DEPS = main.js
DEPS = $(patsubst %,$(SDIR)/%,$(_DEPS))

.PHONY: help
help:
	@echo
	@echo "The most common targets are:"
	@echo
	@echo "all        - build all"
	@echo "rebuild    - remove previous builds and do a build all"
	@echo "compile    - compile all sources"
	@echo "clean      - remove all temporary files (also node_modules"
	@echo "debug      - start closure server to enable debugging"
	@echo "npminit    - initialize node modules"
	@echo "check-deps - check for installed executables"

# the first target is the default target
all : compile
	@echo "Ready with build"

rebuild: clean compile
	@echo "Ready with rebuild"

compile: $(DDIR)/app.js
	@echo "Ready with compile"

$(DDIR)/app.js: config.json $(DEPS)
	$(CLOSURE_COMPILER) build config.json $(DDIR)/app.js

.PHONY: clean
clean:
	rm -Rf dist/* node_modules
	@echo "Ready with clean"

.PHONY: debug
debug:
	$(CLOSURE_COMPILER) serve config.json

.PHONY: npminit
npminit:
	npm install
	cd node_modules/openlayers && npm install

.PHONY: check-deps
check-deps: EXECUTABLES = git node python java
check-deps:
	@for exe in $(EXECUTABLES) ;\
	do \
		which $${exe} > /dev/null && \
		echo "Program $${exe} OK" || \
		echo "Program $${exe} MISSING!" ;\
		done ;\


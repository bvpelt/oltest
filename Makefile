
CLOSURE_COMPILER=./node_modules/openlayers/node_modules/.bin/closure-util
DDIR =./dist
SDIR =./src

_DEPS = main.js
DEPS = $(patsubst %,$(SDIR)/%,$(_DEPS))


.PHONY:	clean

all : compile
	echo "Ready with build"


rebuild: clean compile
	echo "Ready with rebuild"

compile: $(DDIR)/app.js
	echo "Ready with compile"

$(DDIR)/app.js: config.json $(DEPS)
	$(CLOSURE_COMPILER) build config.json $(DDIR)/app.js

clean:
	rm -Rf dist/*
	echo "Ready with clean"

debug:
	$(CLOSURE_COMPILER) serve config.json

npminit:
	npm install
	
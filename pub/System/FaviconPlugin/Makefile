TARGET=build/pkg.js
SOURCE=lib/favico.js src/FaviconManager.js

-include $(FOSWIKI_ROOT)/pub/System/JQueryPlugin/Makefile.include

.PHONY: git

clean: 
	rm -rf build/

build/pkg.uncompressed.js: $(SOURCE)
	test -d build || mkdir build
	cat $(SOURCE) > build/pkg.uncompressed.js

git:
	git clone https://github.com/ejci/favico.js.git git

ifneq (,$(wildcard git))
lib/favico.js: git/favico.js
	cp $< $@
endif

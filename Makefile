
DYLAN	?= $${HOME}/dylan

.PHONY: build install test dist clean distclean

build:
	deft update
	deft build v3d

install: build
	mkdir -p $(DYLAN)/install/v3d/lib
	cp -r _build/lib/lib* $(DYLAN)/install/v3d/lib/

test:
	deft update
	deft test -- --progress none --report surefire > _build/TEST-v3d.xml

dist: distclean install

clean:
	rm -rf _packages
	rm -rf registry
	rm -rf _build
	rm -rf _test
	rm -rf *~

distclean: clean
	rm -rf $(DYLAN)/install/v3d

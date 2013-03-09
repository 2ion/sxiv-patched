PACKAGE_NAME = sxiv-patched
UPSTREAM = sxiv
PACKAGE_VERSION = 1.0
TARBALL = $(PACKAGE_NAME)_$(PACKAGE_VERSION).orig.tar.gz
TARGET = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

package: $(TARGET)
	./build.sh

$(TARBALL):
	git submodule update
	tar -czf $(TARBALL) $(UPSTREAM)/*

$(TARGET): $(TARBALL)
	mkdir $(TARGET)
	tar -xf $(TARBALL) -C $(TARGET) --strip-components=1
	cp -r debian $(UPSTREAM)/

clean:
	-rm $(TARBALL)
	-rm -rf $(TARGET)
	-rm -rf $(UPSTREAM)/debian/$(UPSTREAM)
	-rm -rf $(UPSTREAM)/debian


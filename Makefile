prefix = /usr
bindir = $(prefix)/bin
datadir = $(prefix)/share/
mandir = $(datadir)/man/

DESTDIR =

NS_XSL=$(wildcard xsl/*.xsl)
NON_NS_XSL=$(addprefix non-ns-xsl/,$(notdir $(NS_XSL)))

all: translate-ns
	$(MAKE) -C examples

help:
	@echo "make test"
	@echo "make check"
	@echo "make install"
	@echo "make uninstall"

install:
	install -Dp -m0755 utils/docbook2odf $(DESTDIR)$(bindir)/docbook2odf
	install -Dp -m0644 docs/docbook2odf.1 $(DESTDIR)$(mandir)/man1/docbook2odf.1
	install -Dp -m0644 bindings/desktop/docbook2odf.desktop $(DESTDIR)/$(datadir)/applications/docbook2odf.desktop

	install -dp -m0755 $(DESTDIR)$(datadir)/docbook2odf/
	install -dp -m0755 $(DESTDIR)$(datadir)/xml/docbook/stylesheet/docbook-xsl-ns/odf/
	install -dp -m0755 $(DESTDIR)$(datadir)/xml/docbook/stylesheet/docbook-xsl/odf/

	cp -auvx xsl/*.xsl $(DESTDIR)$(datadir)/xml/docbook/stylesheet/docbook-xsl-ns/odf/
	cp -auvx non-ns-xsl/*.xsl $(DESTDIR)$(datadir)/xml/docbook/stylesheet/docbook-xsl/odf/

uninstall:
	rm $(bindir)/docbook2odf
	rm $(mandir)/man1/docbook2odf.1
	rm $(datadir)/applications/docbook2odf.desktop
	rm -rf $(datadir)/docbook2odf/

# Convert the namespace version of the stylesheets into a
# namespace-netural version. This matches the differences between
# docbook-xsl and docbook-xsl-ns.
translate-ns: $(NON_NS_XSL)

non-ns-xsl/%.xsl: xsl/%.xsl utils/strip-ns
	if [ ! -d non-ns-xsl ];then mkdir non-ns-xsl; fi
	utils/strip-ns xsl/$*.xsl > non-ns-xsl/$*.xsl

# Checking attempts to build every example docbook into an ODT
# version.
check:
	$(MAKE) -C examples check

# Test goes through the examples and ensures they validate against the
# DocBook schema.
test:
	$(MAKE) -C examples test

prefix = /usr
bindir = $(prefix)/bin
datadir = $(prefix)/share/
mandir = $(datadir)/man/

DESTDIR =

all:
	@echo "nothing to build."

install:
	install -Dp -m0755 utils/docbook2odf $(DESTDIR)$(bindir)/docbook2odf
	install -Dp -m0644 docs/docbook2odf.1 $(DESTDIR)$(mandir)/man1/docbook2odf.1
	install -Dp -m0644 bindings/desktop/docbook2odf.desktop $(DESTDIR)/$(datadir)/applications/docbook2odf.desktop
	install -dp -m0755 $(DESTDIR)$(datadir)/docbook2odf/
	cp -auvx xsl/ tests/ $(DESTDIR)$(datadir)/docbook2odf/

uninstall:
	rm $(bindir)/docbook2odf
	rm $(mandir)/man1/docbook2odf.1
	rm $(datadir)/applications/docbook2odf.desktop
	rm -rf $(datadir)/docbook2odf/

check:
	$(MAKE) -C examples/ns check

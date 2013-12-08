# Build up a list of files to check in this directory.
DB_SOURCES=$(wildcard *.docbook)
DB_CHECKS=$(DB_SOURCES:docbook=check)
DB_ODT=$(DB_SOURCES:docbook=odt)

# Build up a list of files that we need to build and test.
NAMESPACE_XML = $(wildcard ns/*.xml)
MAPPED_XML = $(notdir $(NAMESPACE_XML))
NON_NAMESPACE_XML = $(MAPPED_XML:xml=docbook)

all: to-non-ns

check:
	$(MAKE) -C ns check

# Unfortunately, because we use the docbook-xsl-ns (and docbook-xsl)
# stylesheets for common functionality, we don't have the ability to
# do our tests in place without installing.
test: $(DB_ODT)

%.odt: %.docbook
	docbook2odf -d $*.docbook \
		--xsl-file=/usr/share/xml/docbook/stylesheet/docbook-xsl/odf \
		--params quote.fancy=1 \
		-f \
		-o $*.odt

# There are two methods of using the DocBook sheets. There is the
# namespace-aware version (ns) and then XML documents that don't use
# namespaces. As a preference, we develop using the namespace versions
# because it is more precise, but write them in a manner that lets us
# convert them to a non-namespace aware version.
to-non-ns: $(NON_NAMESPACE_XML)

%.docbook: ns/%.xml
	cat ns/$*.xml \
		| sed 's@ xmlns="http://docbook.org/ns/docbook"@@' \
		> $*.docbook

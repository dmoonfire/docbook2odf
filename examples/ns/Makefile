# Variables
RNG_SCHEMA=/usr/share/xml/docbook/schema/rng/5.0/docbook.rng
SCHEMATRON=/usr/share/xml/docbook/schema/schematron/5.0/docbook.sch

# Build up a list of files to check in this directory.
SOURCES=$(wildcard *.xml)
CHECKS=$(SOURCES:xml=check)
ODT=$(SOURCES:xml=odt)

all: check

check: $(CHECKS)

test: $(ODT)

clean:
	rm -f *~ *.odt

%.check: %.xml
	jing $(RNG_SCHEMA) $*.xml

%.odt: %.xml
	docbook2odf -d $*.xml \
		--xsl-file=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns/odf \
		--params quote.fancy=1 \
		-f \
		-o $*.odt

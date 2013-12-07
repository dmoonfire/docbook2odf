# Variables
RNG_SCHEMA=/usr/share/xml/docbook/schema/rng/5.0/docbook.rng
SCHEMATRON=/usr/share/xml/docbook/schema/schematron/5.0/docbook.sch

# Build up a list of files to check in this directory.
SOURCES=$(wildcard *.xml)
CHECKS=$(SOURCES:xml=check)

check: $(CHECKS)

%.check: %.xml
	jing $(RNG_SCHEMA) $*.xml

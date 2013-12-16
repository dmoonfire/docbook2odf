<?xml version="1.0" encoding="UTF-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <xsl:template match="d:note|d:important|d:warning|d:caution|d:tip">
	<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="d:note/d:para|d:note/d:simpara">
	<text:p text:style-name="{$style.paraNote.name}">
	  <xsl:text>Note: </xsl:text>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:important/d:para|d:important/d:simpara">
	<text:p text:style-name="{$style.paraImportant.name}">
	  <xsl:text>Important: </xsl:text>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:warning/d:para|d:warning/d:simpara">
	<text:p text:style-name="{$style.paraWarning.name}">
	  <xsl:text>Warning: </xsl:text>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:caution/d:para|d:caution/d:simpara">
	<text:p text:style-name="{$style.paraCaution.name}">
	  <xsl:text>Caution: </xsl:text>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:tip/d:para|d:tip/d:simpara">
	<text:p text:style-name="{$style.paraTip.name}">
	  <xsl:text>Tip: </xsl:text>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
-->
<xsl:stylesheet
    xmlns:d="http://docbook.org/ns/docbook"
	xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
	xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" 
	xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
	xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
	xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
	xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
	xmlns:math="http://www.w3.org/1998/Math/MathML"
	xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
	xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
	xmlns:dom="http://www.w3.org/2001/xml-events"
	xmlns:xforms="http://www.w3.org/2002/xforms"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Root Node -->
  <xsl:template match="d:chapter">
	<xsl:apply-templates select="." mode="title"/>

	<xsl:apply-templates/>
  </xsl:template>

  <!-- Title -->
  <xsl:template match="d:chapter" mode="title">
	<xsl:param name="number">
	  <xsl:apply-templates select="." mode="label.markup"/>
	</xsl:param>

	<xsl:call-template name="p-or-h">
	  <xsl:with-param name="style.name">
		<xsl:value-of select="$style.chapter.name"/>
	  </xsl:with-param>
	  <xsl:with-param name="style.level">
		<xsl:value-of select="$style.chapter.level"/>
	  </xsl:with-param>
	  <xsl:with-param name="text">
		<xsl:text>Chapter </xsl:text>
		<xsl:apply-templates select="." mode="label.markup"/>
		<xsl:text>: </xsl:text>
		<xsl:apply-templates select="." mode="title.markup"/>
	  </xsl:with-param>
	  <xsl:with-param name="referenceMark" select="concat('Chapter', $number)"/>
	</xsl:call-template>
  </xsl:template>
</xsl:stylesheet>

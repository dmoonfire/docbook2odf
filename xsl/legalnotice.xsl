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
  <xsl:template match="d:legalnotice">
	<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="d:legalnotice/d:para">
	<text:p>
	  <xsl:attribute name="text:style-name">
		<xsl:value-of select="$style.paraLegal.name"/>
		<xsl:if test="position() = 1">
		  <xsl:text>_20_Break</xsl:text>
		</xsl:if>
	  </xsl:attribute>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:copyright">
	<text:p>
	  <xsl:text>Copyright &#169; </xsl:text>
	  <xsl:value-of select="d:year"/>
	  <xsl:text> </xsl:text>
	  <xsl:value-of select="d:holder"/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:publisher">
	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="d:publishername">
	<text:p>
	  <xsl:attribute name="text:style-name">
		<xsl:value-of select="$style.paraLegal.name"/>
	  </xsl:attribute>
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>
</xsl:stylesheet>

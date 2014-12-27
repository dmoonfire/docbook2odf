<?xml version="1.0" encoding="utf-8"?>
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
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Templates -->
  <xsl:template match="d:*" mode="para-style-poetry">
	<xsl:apply-templates select="." mode="para-style-poetry-line"/>
	<xsl:apply-templates select="." mode="para-style-poetry-linegroup"/>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-poetry-line">
	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="$style.poetry.line.name"/>
	  <xsl:with-param name="display.name" select="$style.poetry.line.displayName"/>
	  <xsl:with-param name="parentStyle" select="$style.poetry.line.parentStyle"/>

	  <xsl:with-param name="page" select="$style.poetry.line.page"/>
	  <xsl:with-param name="font" select="$style.poetry.line.font"/>
	  <xsl:with-param name="size" select="$style.poetry.line.size"/>
	  <xsl:with-param name="fontStyle" select="$style.poetry.line.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.poetry.line.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.poetry.line.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.poetry.line.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.poetry.line.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.poetry.line.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.poetry.line.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.poetry.line.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.poetry.line.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.poetry.line.marginRight"/>
	</xsl:call-template>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-poetry-linegroup">
	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="$style.poetry.linegroup.name"/>
	  <xsl:with-param name="display.name" select="$style.poetry.linegroup.displayName"/>
	  <xsl:with-param name="parentStyle" select="$style.poetry.linegroup.parentStyle"/>

	  <xsl:with-param name="page" select="$style.poetry.linegroup.page"/>
	  <xsl:with-param name="font" select="$style.poetry.linegroup.font"/>
	  <xsl:with-param name="size" select="$style.poetry.linegroup.size"/>
	  <xsl:with-param name="fontStyle" select="$style.poetry.linegroup.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.poetry.linegroup.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.poetry.linegroup.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.poetry.linegroup.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.poetry.linegroup.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.poetry.linegroup.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.poetry.linegroup.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.poetry.linegroup.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.poetry.linegroup.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.poetry.linegroup.marginRight"/>
	</xsl:call-template>
  </xsl:template>
</xsl:stylesheet>

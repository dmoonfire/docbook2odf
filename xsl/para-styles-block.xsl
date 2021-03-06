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
  <xsl:template match="d:*" mode="para-style-standard">
    <style:style
		style:name="Standard"
		style:display-name="Standard"
		style:family="paragraph">
	  <style:text-properties
		  style:font-name="Times New Roman"
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-para-default">
    <style:style
		style:name="Paragraph_20_Default"
		style:display-name="Paragraph Default"
		style:family="paragraph"
		style:parent-style-name="Standard"
		>
      <style:paragraph-properties
		  fo:margin-left="0in"
		  fo:margin-right="0in"
		  fo:margin-top="0in"
		  fo:margin-bottom="0in" />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-para">
    <style:style
		style:name="Paragraph"
		style:display-name="Paragraph"
		style:family="paragraph">
      <style:paragraph-properties
		  fo:line-height="125%"
		  fo:text-indent="0.5in"
		  fo:text-align="justified"
		  />
	  <style:text-properties
		  fo:font-size="12pt"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-epigraph">
    <style:style
		style:name="Epigraph"
		style:display-name="Epigraph"
		style:family="paragraph"
		style:parent-style-name="Paragraph_20_Default"
		>
      <style:paragraph-properties
		  fo:margin-left="0.5in"
		  fo:margin-right="0.5in"
		  fo:text-align="left"
		  />
	  <style:text-properties
		  fo:font-size="9pt"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-epigraph-attribution">
    <style:style
		style:name="Epigraph_20_Attribution"
		style:display-name="Epigraph Attribution"
		style:family="paragraph"
		style:parent-style-name="Epigraph"
		>
      <style:paragraph-properties
		  fo:margin-left="1in"
		  fo:margin-right="0.5in"
		  fo:margin-bottom="0.5in"
		  fo:margin-top="12pt"
		  fo:text-align="right"
		  />
	  <style:text-properties
		  fo:font-style="italic"
		  />
    </style:style>
  </xsl:template>
</xsl:stylesheet>

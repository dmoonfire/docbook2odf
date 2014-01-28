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
  <xsl:template match="d:*" mode="para-style-contents-1">
    <style:style
		style:name="Contents_20_1"
		style:display-name="Contents 1"
		style:family="paragraph"
		style:parent-style-name="Paragraph"
		>
      <style:paragraph-properties
		  fo:line-height="150%;"
		  fo:text-indent="0in"
		  fo:text-align="left"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-contents-2">
    <style:style
		style:name="Contents_20_2"
		style:display-name="Contents 2"
		style:family="paragraph"
		style:parent-style-name="Paragraph"
		>
      <style:paragraph-properties
		  fo:margin-left="0.5in"
		  fo:line-height="150%;"
		  fo:text-indent="0in"
		  fo:text-align="left"
		  />
    </style:style>
  </xsl:template>
</xsl:stylesheet>

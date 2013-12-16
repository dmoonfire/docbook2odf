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
  <!-- Templates -->
  <xsl:template match="d:*" mode="automatic-styles">
	<style:style
		style:name="Legal_20_Notice_20_Break"
		style:family="paragraph"
		style:parent-style-name="Legal_20_Notice">
	  <style:paragraph-properties fo:break-before="page"/>
	</style:style>

	<xsl:apply-templates select="." mode="page-layout-standard"/>
	<xsl:apply-templates select="." mode="page-layout-book"/>
	<xsl:apply-templates select="." mode="page-layout-chapter"/>
  </xsl:template>

  <xsl:template match="d:*" mode="page-layout-standard">
    <style:page-layout style:name="Standard_20_Layout">
      <style:page-layout-properties
		  fo:page-width="8.5in"
		  fo:page-height="11in"
		  style:num-format="1"
		  style:print-orientation="portrait"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"
		  style:writing-mode="lr-tb"
		  style:footnote-max-height="0in">
        <style:footnote-sep
			style:width="0.0071in"
			style:distance-before-sep="0.0398in"
			style:distance-after-sep="0.0398in"
			style:line-style="solid"
			style:adjustment="left"
			style:rel-width="25%"
			style:color="#000000"/>
      </style:page-layout-properties>
      <style:header-style>
        <style:header-footer-properties
			fo:min-height="0.5in"
			fo:margin-left="0in"
			fo:margin-right="0in"
			fo:margin-bottom="0in"
			style:dynamic-spacing="false"/>
      </style:header-style>
      <style:footer-style/>
    </style:page-layout>
  </xsl:template>

  <xsl:template match="d:*" mode="page-layout-chapter">
    <style:page-layout style:name="Chapter_20_Layout">
      <style:page-layout-properties
		  fo:page-width="8.5in"
		  fo:page-height="11in"
		  style:num-format="1"
		  style:print-orientation="portrait"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"
		  style:writing-mode="lr-tb"
		  style:footnote-max-height="0in">
        <style:footnote-sep
			style:width="0.0071in"
			style:distance-before-sep="0.0398in"
			style:distance-after-sep="0.0398in"
			style:line-style="solid"
			style:adjustment="left"
			style:rel-width="25%"
			style:color="#000000"/>
      </style:page-layout-properties>
      <style:header-style>
        <style:header-footer-properties
			fo:min-height="0.5in"
			fo:margin-left="0in"
			fo:margin-right="0in"
			fo:margin-bottom="0in"
			style:dynamic-spacing="false"/>
      </style:header-style>
      <style:footer-style/>
    </style:page-layout>
  </xsl:template>

  <xsl:template match="d:*" mode="page-layout-book">
	<style:page-layout style:name="Book_20_Layout">
      <style:page-layout-properties
		  fo:page-width="8.5in"
		  fo:page-height="11in"
		  style:num-format="1"
		  style:print-orientation="portrait"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"
		  style:writing-mode="lr-tb"
		  style:footnote-max-height="0in">
        <style:footnote-sep
			style:width="0.0071in"
			style:distance-before-sep="0.0398in"
			style:distance-after-sep="0.0398in"
			style:line-style="solid"
			style:adjustment="left"
			style:rel-width="25%"
			style:color="#000000"/>
      </style:page-layout-properties>
      <style:header-style/>
      <style:footer-style/>
    </style:page-layout>
  </xsl:template>
</xsl:stylesheet>

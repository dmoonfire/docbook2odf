<?xml version="1.0" encoding="utf-8"?>
<!--

     docbook2odf - DocBook to OpenDocument XSL Transformation
     Copyright (C) 2006 Roman Fordinal
     http://open.comsultia.com/docbook2odf/

     This program is free software; you can redistribute it and/or
     modify it under the terms of the GNU General Public License
	 as published by the Free Software Foundation; either version 2
	 of the License, or (at your option) any later version.

	 This program is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 GNU General Public License for more details.

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
  <xsl:template match="d:*" mode="master-styles">
	<xsl:apply-templates select="." mode="master-style-standard"/>
	<xsl:apply-templates select="." mode="master-style-book"/>
	<xsl:apply-templates select="." mode="master-style-chapter"/>
  </xsl:template>

  <xsl:template match="d:*" mode="master-style-standard">
    <style:master-page
		style:name="Standard"
		style:page-layout-name="Standard_20_Layout">
      <style:header>
        <text:p text:style-name="Header">
          <text:tab/><text:tab/>
		  <xsl:apply-templates
			  select="/d:*/d:author|/d:*/d:info/d:author"
			  mode="header"/>
		  <xsl:apply-templates
			  select="/d:*/d:titleabbrev|/d:*/d:info/d:titleabbrev"
			  mode="header"/>
          <text:page-number text:select-page="current">0</text:page-number>
		</text:p>
      </style:header>
	</style:master-page>
  </xsl:template>

  <xsl:template match="d:*" mode="master-style-book">
    <style:master-page
		style:name="Book_20_Page"
		style:display-name="Book Page"
		style:page-layout-name="Book_20_Layout"
		style:next-style-name="Standard"/>
  </xsl:template>

  <xsl:template match="d:*" mode="master-style-chapter">
	<style:master-page
		style:name="Chapter_20_Page"
		style:display-name="Chapter Page"
		style:page-layout-name="Chapter_20_Layout"
		style:next-style-name="Standard">
      <style:header>
        <text:p text:style-name="Header">
          <text:tab/><text:tab/>
		  <xsl:apply-templates
			  select="/d:*/d:author|/d:*/d:info/d:author"
			  mode="header"/>
		  <xsl:apply-templates
			  select="/d:*/d:titleabbrev|/d:*/d:info/d:titleabbrev"
			  mode="header"/>
          <text:page-number text:select-page="current">0</text:page-number>
		</text:p>
      </style:header>
	</style:master-page>
  </xsl:template>

  <!-- Elements -->
  <xsl:template match="d:author" mode="header">
	<xsl:apply-templates select="d:personname/d:surname" mode="header"/>
  </xsl:template>

  <xsl:template match="d:surname" mode="header">
	<xsl:apply-templates/>
	<xsl:text> / </xsl:text>
  </xsl:template>

  <xsl:template match="d:titleabbrev" mode="header">
	<xsl:apply-templates/>
	<xsl:text> / </xsl:text>
  </xsl:template>
</xsl:stylesheet>

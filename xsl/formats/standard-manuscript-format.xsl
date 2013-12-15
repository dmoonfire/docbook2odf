<?xml version="1.0" encoding="UTF-8"?>
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
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Parameters. These have to be before the imports because otherwise the params will be picked up by the imports instead of our settings. -->
  <xsl:param name="generate.toc">
appendix  title
article/appendix  nop
article   title
book      title
chapter   title
part      title
preface   title
qandadiv  nop
qandaset  nop
reference title
sect1     nop
sect2     nop
sect3     nop
sect4     nop
sect5     nop
section   nop
set       title
  </xsl:param>

  <!-- Includes -->
  <xsl:include href="../docbook.xsl"/>

  <!-- SMF uses 12pt Times New Roman, double-spaced, half-inch indent. -->
  <xsl:template match="d:*" mode="text-style-para">
    <style:style
		style:name="Paragraph"
		style:display-name="Paragraph"
		style:family="paragraph">
      <style:paragraph-properties
		  fo:line-height="200%"
		  fo:text-indent="0.5in"
		  fo:text-align="left" />
	  <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <!-- We need to include a page break with book so we can remove the header from the first page. We also use indenting to move the title down to "near the center" of the page. -->
  <xsl:template match="d:*" mode="text-style-custom">
	<style:style
		style:name="Contact"
		style:display-name="Contact"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text">
      <style:paragraph-properties fo:text-align="left">
		<style:tab-stops>
  		  <style:tab-stop style:position="6.5in" style:type="right"/>
		</style:tab-stops>
	  </style:paragraph-properties>
	</style:style>

	<style:style
		style:name="Contact_20_First"
		style:display-name="Contact First"
		style:family="paragraph"
		style:parent-style-name="Contact"
		style:class="text"
		style:master-page-name="Book_20_Page"
		>
      <style:paragraph-properties
		  fo:break-before="page"
		  />
	</style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-book">
	<style:style
		style:name="Book_20_Title"
		style:display-name="Book Title"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		>
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:text-align="center"
		  fo:margin-top="2.5in"
		  fo:margin-bottom="0.25in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-size="100%"/>
	</style:style>

	<style:style
		style:name="Author"
		style:display-name="Author"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		>
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:text-align="center"
		  fo:margin-top="0"
		  fo:margin-bottom="0.25in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-size="100%"/>
	</style:style>
  </xsl:template>

  <!-- We don't use hard page breaks at all. -->
  <xsl:template match="d:*" mode="text-style-heading">
    <style:style
		style:name="Heading_20_Default"
		style:display-name="Heading Default"
		style:family="paragraph"
		style:parent-style-name="Standard">
      <style:paragraph-properties
		  fo:keep-with-next="always"
		  fo:line-height="200%"
		  text:number-lines="true"
		  text:line-number="0"/>
	  <style:text-properties
		  fo:font-weight="normal"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-1">
    <style:style
		style:name="Heading_20_1"
		style:display-name="Heading 1"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  fo:margin-top="0.75in"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-2">
    <style:style
		style:name="Heading_20_2"
		style:display-name="Heading 2"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="2"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-3">
    <style:style
		style:name="Heading_20_3"
		style:display-name="Heading 3"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="3"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <!-- We can't find an example of how epigraphs are formatted in SMF, so we went with indenting them 2in from the left but keeping the rest of the font normal. -->
  <xsl:template match="d:*" mode="text-style-epigraph">
    <style:style
		style:name="Epigraph"
		style:display-name="Epigraph"
		style:family="paragraph"
		style:parent-style-name="Paragraph_20_Default"
		>
      <style:paragraph-properties
		  fo:margin-left="1in"
		  fo:line-height="200%"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-epigraph-attribution">
    <style:style
		style:name="Epigraph_20_Attribution"
		style:display-name="Epigraph Attribution"
		style:family="paragraph"
		style:parent-style-name="Epigraph"
		>
    </style:style>
  </xsl:template>

  <!-- The covers should have the submitters information. -->
  <xsl:template match="d:book" mode="title">
	<xsl:apply-templates select="d:info/d:author" mode="title"/>
	<xsl:apply-templates select="." mode="title-text"/>

	<xsl:apply-templates select="d:info/d:author" mode="title-text"/>
  </xsl:template>

  <xsl:template match="d:author" mode="title-text">
	<text:p text:style-name="Author">
	  <xsl:text>by </xsl:text>
	  <xsl:apply-templates select="d:personname" mode="title"/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:author" mode="title">
	<!-- Insert the person/legal name first. -->
	<text:p text:style-name="Contact_20_First">
	  <xsl:if test="d:address/d:personname">
		<xsl:apply-templates
			select="d:address/d:personname" mode="title"/>
	  </xsl:if>
	  <xsl:if test="not(d:address/d:personname)">
		<xsl:apply-templates select="d:personname" mode="title"/>
	  </xsl:if>
	  <text:tab/>
	  <!-- This will insert the estimated number of words. -->
	  <xsl:text>function:words:(100)</xsl:text>
	</text:p>

	<!-- Apply the rest of the templates. -->
	<xsl:apply-templates select="d:address" mode="title"/>
	<xsl:apply-templates select="d:email" mode="title"/>
  </xsl:template>

  <xsl:template match="d:personname" mode="title">
	<xsl:value-of select="d:firstname"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="d:surname"/>
  </xsl:template>

  <xsl:template match="d:address" mode="title">
	<xsl:apply-templates select="d:street" mode="title"/>
	<xsl:apply-templates select="d:pob" mode="title"/>

	<xsl:if test="d:city|d:state|d:postcode">
	  <text:p text:style-name="Contact">
		<xsl:apply-templates select="d:city" mode="title"/>
		<xsl:apply-templates select="d:state" mode="title"/>
		<xsl:apply-templates select="d:postcode" mode="title"/>
	  </text:p>
	</xsl:if>
  </xsl:template>

  <xsl:template match="d:street|d:email|d:pob" mode="title">
	<text:p text:style-name="Contact">
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <xsl:template match="d:city" mode="title">
	<xsl:apply-templates/>
	<xsl:text>, </xsl:text>
  </xsl:template>

  <xsl:template match="d:state" mode="title">
	<xsl:apply-templates/>
	<xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="d:postcode" mode="title">
	<xsl:apply-templates/>
  </xsl:template>

  <!-- There are a few elements of DocBook we want to avoid in general. -->
  <xsl:template match="d:legalnotice"/>
</xsl:stylesheet>

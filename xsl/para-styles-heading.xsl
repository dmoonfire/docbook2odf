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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Templates -->
  <xsl:template match="d:*" mode="para-style-heading">
    <style:style
		style:name="Heading_20_Default"
		style:display-name="Heading Default"
		style:family="paragraph"
		style:parent-style-name="Standard">
      <style:paragraph-properties
		  fo:keep-with-next="always"
		  text:number-lines="true"
		  text:line-number="0"/>
	  <style:text-properties fo:font-weight="bold"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-1">
    <style:style
		style:name="Heading_20_1"
		style:display-name="Heading 1"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text"
		style:master-page-name="Chapter_20_Page">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:break-before="page"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.5in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="200%"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-2">
    <style:style
		style:name="Heading_20_2"
		style:display-name="Heading 2"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.125in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="180%"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-3">
    <style:style
		style:name="Heading_20_3"
		style:display-name="Heading 3"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.125in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="160%"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-4">
    <style:style
		style:name="Heading_20_4"
		style:display-name="Heading 4"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.125in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="140%"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-5">
    <style:style
		style:name="Heading_20_5"
		style:display-name="Heading 5"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:break-before="page"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.5in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="120%"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-heading-6">
    <style:style
		style:name="Heading_20_6"
		style:display-name="Heading 6"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:break-before="page"
		  fo:margin-top="0.125in"
		  fo:margin-bottom="0.5in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties fo:font-size="100%"/>
    </style:style>
  </xsl:template>
</xsl:stylesheet>

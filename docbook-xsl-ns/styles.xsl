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
  <xsl:template match="d:*" mode="default-styles">
    <style:default-style style:family="paragraph">
      <style:paragraph-properties
		  fo:text-align="start"
		  style:justify-single-word="false"
		  style:text-autospace="ideograph-alpha"
		  style:punctuation-wrap="hanging"
		  style:line-break="strict"
		  style:writing-mode="page"/>
	  <style:text-properties
		  fo:color="#000000"
		  style:font-name="Arial"
		  fo:font-size="11pt"
		  fo:language="en"
		  fo:country="US"
		  style:font-name-asian="DejaVu Sans"
		  style:font-size-asian="12pt"
		  style:language-asian="en"
		  style:country-asian="US"
		  style:font-name-complex="Tahoma" style:font-size-complex="12pt" 
		  style:language-complex="en"
		  style:country-complex="US"/>
    </style:default-style>
  </xsl:template>

  <xsl:template match="d:*" mode="styles">
    <style:style style:name="Standard" style:family="paragraph" style:class="text"/>
    <style:style style:name="Paragraph_20_Default" style:display-name="Paragraph Default" style:family="paragraph">
      <style:paragraph-properties fo:margin="100%" fo:margin-left="0in" fo:margin-right="0in" fo:margin-top="0in" fo:margin-bottom="0in" fo:line-height="200%" fo:text-indent="0.25in" style:auto-text-indent="false"/><style:text-properties style:font-name="Courier New" fo:font-size="12pt"/>
    </style:style>
    <style:style style:name="Paragraph" style:family="paragraph" style:parent-style-name="Paragraph_20_Default"/>
    <style:style style:name="Paragraph_20_Padding" style:display-name="Paragraph Padding" style:family="paragraph" style:parent-style-name="Paragraph_20_Default">
      <style:paragraph-properties fo:margin-top="0in" fo:margin-bottom="0in"/>
    </style:style>
  </xsl:template>
</xsl:stylesheet>

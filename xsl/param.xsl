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
	version="1.0"
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
	office:class="text"
	office:version="1.0">
	
	
<xsl:param name="style.font-color">#000000</xsl:param>
<xsl:param name="style.font-name">Arial</xsl:param>
<xsl:param name="style.font-size.default">11pt</xsl:param>
<xsl:param name="style.font-size.presentation.para">28pt</xsl:param>
<xsl:param name="style.font-name.bold">Arial</xsl:param> <!-- or Arial Black -->
<xsl:param name="toc">no</xsl:param> <!-- generating TOC -->
	
<xsl:param name="para.padding">0.20cm</xsl:param>


<!-- Headings -->

<xsl:attribute-set name="heading.style-properties">
	<xsl:attribute name="style:family">paragraph</xsl:attribute>
	<xsl:attribute name="style:class">text</xsl:attribute>
	<xsl:attribute name="style:list-style-name">listH</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading-small.style-properties">
	<xsl:attribute name="style:family">paragraph</xsl:attribute>
	<xsl:attribute name="style:class">text</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.paragraph-properties">
	<xsl:attribute name="style:shadow">none</xsl:attribute>
	<xsl:attribute name="text:number-lines">true</xsl:attribute>
	<xsl:attribute name="text:line-number">1</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.text-properties">
	<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
	<xsl:attribute name="style:font-name"><xsl:value-of select="$style.font-name.bold"/></xsl:attribute>
	<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="heading.chapter.paragraph-properties">
	<xsl:attribute name="fo:break-before">page</xsl:attribute>
	<xsl:attribute name="fo:padding-top">0.2cm</xsl:attribute>
	<xsl:attribute name="fo:border-top">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.chapter.text-properties">
	<xsl:attribute name="fo:font-size">200%</xsl:attribute>
</xsl:attribute-set>


</xsl:stylesheet>


















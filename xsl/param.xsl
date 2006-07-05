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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:office="http://openoffice.org/2000/office"
	xmlns:style="http://openoffice.org/2000/style"
	xmlns:text="http://openoffice.org/2000/text"
	xmlns:table="http://openoffice.org/2000/table"
	xmlns:draw="http://openoffice.org/2000/drawing"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:meta="http://openoffice.org/2000/meta"
	xmlns:number="http://openoffice.org/2000/datastyle"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:chart="http://openoffice.org/2000/chart"
	xmlns:dr3d="http://openoffice.org/2000/dr3d"
	xmlns:math="http://www.w3.org/1998/Math/MathML"
	xmlns:form="http://openoffice.org/2000/form"
	xmlns:script="http://openoffice.org/2000/script"
	xmlns:config="http://openoffice.org/2001/config"
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


<xsl:attribute-set name="heading.level-1.paragraph-properties">
	<xsl:attribute name="fo:break-before">page</xsl:attribute>
	<xsl:attribute name="fo:padding-top">0.2cm</xsl:attribute>
	<xsl:attribute name="fo:border-top">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.level-1.text-properties">
	<xsl:attribute name="fo:font-size">200%</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.level-2.paragraph-properties">
	<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.level-2.text-properties">
	<xsl:attribute name="fo:font-size">175%</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.level-3.paragraph-properties">
	<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.level-3.text-properties">
	<xsl:attribute name="fo:font-size">150%</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.level-4.paragraph-properties">
	<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.level-4.text-properties">
	<xsl:attribute name="fo:font-size">125%</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="heading.level-s.paragraph-properties">
	<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="heading.level-s.text-properties">
	<xsl:attribute name="fo:font-size">100%</xsl:attribute>
</xsl:attribute-set>












</xsl:stylesheet>


















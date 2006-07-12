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



<xsl:template match="article">
	<!-- TODO: suport for article class "http://www.docbook.org/tdg/en/html-ng/article.html" -->
	<xsl:element name="office:text">
		
		<office:forms form:automatic-focus="false" form:apply-design-mode="false"/>
		<text:sequence-decls>
			<text:sequence-decl
				text:display-outline-level="0"
				text:name="Illustration"/>
			<text:sequence-decl
				text:display-outline-level="0"
				text:name="Table"/>
			<text:sequence-decl
				text:display-outline-level="0"
				text:name="Text"/>
			<text:sequence-decl
				text:display-outline-level="0"
				text:name="Drawing"/>
		</text:sequence-decls>
		
		<xsl:call-template name="CI.office-text"/>
		
		<xsl:apply-templates/>
		
	</xsl:element>
	
</xsl:template>



<xsl:template match="/article/title">
	<xsl:element name="text:p"/>
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">line</xsl:attribute>
	</xsl:element>
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-title1</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>

<xsl:template match="title" mode="articleinfo">
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-title1</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>

<xsl:template match="/article/subtitle">
	<xsl:element name="text:p"/>
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-title2</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>

<xsl:template match="subtitle" mode="articleinfo">
	<xsl:element name="text:p"/>
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-title2</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>


<xsl:template match="articleinfo">
	<xsl:element name="text:section">
		<xsl:attribute name="text:style-name">sect-articleinfo</xsl:attribute>
		<xsl:attribute name="text:name">articleinfo</xsl:attribute>
		<xsl:apply-templates mode="articleinfo" />
	</xsl:element>
</xsl:template>

<!-- others -->
<!--
<xsl:template match="*">
	<text:p text:style-name="para-element"><xsl:value-of select="node()"/></text:p>
</xsl:template>
-->


</xsl:stylesheet>
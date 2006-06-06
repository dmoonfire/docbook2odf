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
	xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
	office:class="text"
	office:version="1.0">
	

<xsl:template name="document-styles.automatic-styles">
	
	<xsl:if test="/slides">
		
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">drawing-page1</xsl:attribute>
			<xsl:attribute name="style:family">drawing-page</xsl:attribute>
			<xsl:element name="style:drawing-page-properties">
				<xsl:attribute name="draw:background-size">border</xsl:attribute>
				<xsl:attribute name="draw:fill">none</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">gr-footer</xsl:attribute>
			<xsl:attribute name="style:family">graphic</xsl:attribute>
			<xsl:element name="style:graphic-properties">
				<xsl:attribute name="draw:stroke">none</xsl:attribute>
				<xsl:attribute name="draw:fill">solid</xsl:attribute>
				<xsl:attribute name="draw:fill-color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="draw:textarea-horizontal-align">left</xsl:attribute>
				<xsl:attribute name="draw:textarea-vertical-align">middle</xsl:attribute>
				<xsl:attribute name="draw:auto-grow-height">false</xsl:attribute>
				<xsl:attribute name="fo:wrap-option">wrap</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">gr-thumbnail</xsl:attribute>
			<xsl:attribute name="style:family">graphic</xsl:attribute>
			<xsl:element name="style:graphic-properties">
				<xsl:attribute name="draw:stroke">none</xsl:attribute>
				<xsl:attribute name="draw:fill">none</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">gr-header</xsl:attribute>
			<xsl:attribute name="style:family">graphic</xsl:attribute>
			<xsl:element name="style:graphic-properties">
				<xsl:attribute name="draw:stroke">none</xsl:attribute>
				<xsl:attribute name="draw:fill">solid</xsl:attribute>
				<xsl:attribute name="draw:fill-color"><xsl:value-of select="$CI.style.color.bg"/></xsl:attribute>
				<xsl:attribute name="draw:textarea-horizontal-align">left</xsl:attribute>
				<xsl:attribute name="draw:textarea-vertical-align">middle</xsl:attribute>
				<xsl:attribute name="draw:auto-grow-height">false</xsl:attribute>
				<xsl:attribute name="fo:wrap-option">wrap</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	</xsl:if>
	
</xsl:template>


</xsl:stylesheet>
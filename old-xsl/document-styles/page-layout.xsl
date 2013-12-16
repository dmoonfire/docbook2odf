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
	
<xsl:template name="document-styles.page-layout">
	<!-- included to all document types -->
	<!-- ISO STANDARDIZED A4,A3,...B4,... -->
	
<!-- A4 -->
	<style:page-layout
		style:name="A4">
		<style:page-layout-properties>
			<xsl:attribute name="fo:page-width"><xsl:value-of select="$layout.A4.width"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="fo:page-height"><xsl:value-of select="$layout.A4.height"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$layout.A4.margin-top"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-bottom"><xsl:value-of select="$layout.A4.margin-bottom"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-left"><xsl:value-of select="$layout.A4.margin-left"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-right"><xsl:value-of select="$layout.A4.margin-right"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			<xsl:attribute name="style:num-format">1</xsl:attribute>
			<xsl:attribute name="style:print-orientation">portrait</xsl:attribute>
			<xsl:attribute name="style:writing-mode">lr-tb</xsl:attribute>
			<xsl:attribute name="style:footnote-max-height">0cm</xsl:attribute>
		</style:page-layout-properties>
		<style:header-style>
			<style:header-footer-properties>
				<xsl:attribute name="fo:min-height"><xsl:value-of select="$layout.A4.header.min-height"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-top"><xsl:value-of select="$layout.A4.header.margin-top"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-bottom"><xsl:value-of select="$layout.A4.header.margin-bottom"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-left"><xsl:value-of select="$layout.A4.header.margin-left"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-right"><xsl:value-of select="$layout.A4.header.margin-right"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
			</style:header-footer-properties>
		</style:header-style>
		<style:footer-style>
			<style:header-footer-properties>
				<xsl:attribute name="fo:min-height"><xsl:value-of select="$layout.A4.footer.min-height"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-top"><xsl:value-of select="$layout.A4.footer.margin-top"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-bottom"><xsl:value-of select="$layout.A4.footer.margin-bottom"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-left"><xsl:value-of select="$layout.A4.footer.margin-left"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:margin-right"><xsl:value-of select="$layout.A4.footer.margin-right"/><xsl:value-of select="$layout.A4.units"/></xsl:attribute>
				<xsl:attribute name="fo:border-top"><xsl:value-of select="$layout.A4.footer.border-top"/></xsl:attribute>
			</style:header-footer-properties>
		</style:footer-style>
	</style:page-layout>
	
<!-- A5 -->
	<style:page-layout
		style:name="A5">
		<style:page-layout-properties>
			<xsl:attribute name="fo:page-width"><xsl:value-of select="$layout.A5.width"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="fo:page-height"><xsl:value-of select="$layout.A5.height"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$layout.A5.margin-top"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-bottom"><xsl:value-of select="$layout.A5.margin-bottom"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-left"><xsl:value-of select="$layout.A5.margin-left"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="fo:margin-right"><xsl:value-of select="$layout.A5.margin-right"/><xsl:value-of select="$layout.A5.units"/></xsl:attribute>
			<xsl:attribute name="style:num-format">1</xsl:attribute>
			<xsl:attribute name="style:print-orientation">portrait</xsl:attribute>
			<xsl:attribute name="style:writing-mode">lr-tb</xsl:attribute>
			<xsl:attribute name="style:footnote-max-height">0cm</xsl:attribute>
		</style:page-layout-properties>
		<style:footer-style>
			<style:header-footer-properties>
				<xsl:attribute name="fo:min-height">1.5cm</xsl:attribute>
				<xsl:attribute name="fo:margin-left">0cm</xsl:attribute>
				<xsl:attribute name="fo:margin-right">0cm</xsl:attribute>
				<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
				<xsl:attribute name="fo:border-top">0.002cm solid #000000</xsl:attribute>
				<xsl:attribute name="fo:border-bottom">none</xsl:attribute>
				<xsl:attribute name="fo:border-left">none</xsl:attribute>
				<xsl:attribute name="fo:border-right">none</xsl:attribute>
				<xsl:attribute name="fo:padding">0cm</xsl:attribute>
				<xsl:attribute name="style:shadow">none</xsl:attribute>
				<xsl:attribute name="style:dynamic-spacing">false</xsl:attribute>
			</style:header-footer-properties>
		</style:footer-style>
	</style:page-layout>
	
<!-- presentation - Screen -->
	
	<!--
	<xsl:element name="style:page-layout">
		<xsl:attribute name="style:name">screen</xsl:attribute>
		<xsl:element name="style:page-layout-properties">
			<xsl:attribute name="fo:margin-top">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-left">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-right">0cm</xsl:attribute>
			<xsl:attribute name="fo:page-width">10cm</xsl:attribute>
			<xsl:attribute name="fo:page-height">20cm</xsl:attribute>
			<xsl:attribute name="style:print-orientation">landscape</xsl:attribute>
		</xsl:element>
	</xsl:element>
	-->
	
	<xsl:element name="style:page-layout">
		<xsl:attribute name="style:name">screen</xsl:attribute>
		<xsl:element name="style:page-layout-properties">
			<xsl:attribute name="fo:margin-top">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-left">0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-right">0cm</xsl:attribute>
			<xsl:attribute name="fo:page-width">29.701cm</xsl:attribute>
			<xsl:attribute name="fo:page-height">20.989cm</xsl:attribute>
			<xsl:attribute name="style:print-orientation">landscape</xsl:attribute>
		</xsl:element>
	</xsl:element>
	
</xsl:template>



</xsl:stylesheet>
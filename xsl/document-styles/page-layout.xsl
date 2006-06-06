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
	
<xsl:template name="document-styles.page-layout">
	<!-- included to all document types -->
	<!-- ISO STANDARDIZED A4,A3,...B4,... -->
	
<!-- A4 -->
	<xsl:element name="style:page-layout">
		<xsl:attribute name="style:name">A4</xsl:attribute>
		<xsl:element name="style:page-layout-properties">
			<xsl:attribute name="fo:page-width">21cm</xsl:attribute>
			<xsl:attribute name="fo:page-height">29.7cm</xsl:attribute>
			<xsl:attribute name="style:num-format">1</xsl:attribute>
			<xsl:attribute name="style:print-orientation">portrait</xsl:attribute>
			<xsl:attribute name="fo:margin-top">0.97cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.61cm</xsl:attribute>
			<xsl:attribute name="fo:margin-left">1.75cm</xsl:attribute>
			<xsl:attribute name="fo:margin-right">2.00cm</xsl:attribute>
			<xsl:attribute name="style:writing-mode">lr-tb</xsl:attribute>
			<xsl:attribute name="style:footnote-max-height">0cm</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:footer-style">
			<xsl:element name="style:header-footer-properties">
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
			</xsl:element>
		</xsl:element>
	</xsl:element>
	
<!-- A5 -->
	<xsl:element name="style:page-layout">
		<xsl:attribute name="style:name">A5</xsl:attribute>
		<xsl:element name="style:page-layout-properties">
			<xsl:attribute name="fo:page-width">14.8cm</xsl:attribute>
			<xsl:attribute name="fo:page-height">21.0cm</xsl:attribute>
			<xsl:attribute name="style:num-format">1</xsl:attribute>
			<xsl:attribute name="style:print-orientation">portrait</xsl:attribute>
			<xsl:attribute name="fo:margin-top">0.97cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.61cm</xsl:attribute>
			<xsl:attribute name="fo:margin-left">1.75cm</xsl:attribute>
			<xsl:attribute name="fo:margin-right">2.00cm</xsl:attribute>
			<xsl:attribute name="style:writing-mode">lr-tb</xsl:attribute>
			<xsl:attribute name="style:footnote-max-height">0cm</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:footer-style">
			<xsl:element name="style:header-footer-properties">
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
			</xsl:element>
		</xsl:element>
	</xsl:element>
	
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
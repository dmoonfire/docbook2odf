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
	

<xsl:template name="document-styles.master-styles">
	<xsl:choose>
		<xsl:when test="/book|/article|/chapter|/part|/section">
			<xsl:element name="style:master-page">
				<xsl:attribute name="style:name">Standard</xsl:attribute>
				<xsl:attribute name="style:page-layout-name"><xsl:value-of select="$page.text-layout"/></xsl:attribute>
				<xsl:attribute name="style:next-style-name">Others</xsl:attribute>
					<!-- corporate identity -->
					<xsl:call-template name="CI.pagedefault.header"/>
					<xsl:call-template name="CI.pagedefault.footer"/>
			</xsl:element>
			<xsl:element name="style:master-page">
				<xsl:attribute name="style:name">Others</xsl:attribute>
				<xsl:attribute name="style:page-layout-name"><xsl:value-of select="$page.text-layout"/></xsl:attribute>
				<xsl:attribute name="style:next-style-name">Others</xsl:attribute>
					<!-- corporate identity -->
					<xsl:call-template name="CI.pagenext.header"/>
					<xsl:call-template name="CI.pagenext.footer"/>
			</xsl:element>
		</xsl:when>
		
		<xsl:when test="/slides">
			
			<!-- The element <draw:layer-set> may be contained in the master styles -->
			<!-- of graphical applications. It defines a set of layers. Layers      -->
			<!-- group drawing objects. Drawing objects may be assigned to these    -->
			<!-- layers with the help of their draw:layer-name attribute.           -->
			<xsl:element name="draw:layer-set">
				<xsl:element name="draw:layer">
					<xsl:attribute name="draw:name">layout</xsl:attribute>
				</xsl:element>
				<xsl:element name="draw:layer">
					<xsl:attribute name="draw:name">background</xsl:attribute>
				</xsl:element>
				<xsl:element name="draw:layer">
					<xsl:attribute name="draw:name">backgroundobjects</xsl:attribute>
				</xsl:element>
				<xsl:element name="draw:layer">
					<xsl:attribute name="draw:name">controls</xsl:attribute>
				</xsl:element>
				<xsl:element name="draw:layer">
					<xsl:attribute name="draw:name">measurelines</xsl:attribute>
				</xsl:element>
			</xsl:element>
			<!-- For applications that support printing handout pages, this element  -->
			<!-- is a template for automatically generating the handout pages. The   -->
			<!-- element <style:handout-master> can contain any types of shapes. The -->
			<!-- most useful shape is the <draw:page-thumbnail>, which is replaced   -->
			<!-- by actual pages from the document. The <style:handout-master>       -->
			<!-- element is contained in the <office:master-styles> element. The     -->
			<!-- <office:master-styles> must not contain more than one               -->
			<!-- <style:handout-master> element.                                     -->
			<!--
			<style:handout-master
				presentation:presentation-page-layout-name="..."
				style:page-layout-name="..."
				draw:style-name="...">
			</style:handout-master>
			-->
			<xsl:element name="style:master-page">
				<xsl:attribute name="style:name">Title</xsl:attribute>
				<xsl:attribute name="style:page-layout-name">screen</xsl:attribute>
				<xsl:attribute name="draw:style-name">drawing-page1</xsl:attribute>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-header</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">6.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">2cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-footer</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">1.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">19.5cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:call-template name="CI.presentation.titlepage"/>
			</xsl:element>
			<xsl:element name="style:master-page">
				<xsl:attribute name="style:name">Titlegroup</xsl:attribute>
				<xsl:attribute name="style:page-layout-name">screen</xsl:attribute>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-header</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">7.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">3cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-footer</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">1.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">19.5cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:call-template name="CI.presentation.titlegroup"/>
			</xsl:element>
			<xsl:element name="style:master-page">
				<xsl:attribute name="style:name">Foil</xsl:attribute>
				<xsl:attribute name="style:page-layout-name">screen</xsl:attribute>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-header</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">5.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">0cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:element name="draw:rect">
						<xsl:attribute name="draw:style-name">gr-footer</xsl:attribute>
						<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
						<xsl:attribute name="svg:width">29.701cm</xsl:attribute>
						<xsl:attribute name="svg:height">1.5cm</xsl:attribute>
						<xsl:attribute name="svg:x">0cm</xsl:attribute>
						<xsl:attribute name="svg:y">19.5cm</xsl:attribute>
						<xsl:element name="text:p"/>
					</xsl:element>
					<xsl:call-template name="CI.presentation.foil"/>
			</xsl:element>
		</xsl:when>
	</xsl:choose>
</xsl:template>


</xsl:stylesheet>
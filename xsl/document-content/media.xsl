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



<xsl:template match="mediaobject">
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-default</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>


<xsl:template match="imageobject">
	
	<!-- @align                                                  -->
	<!-- @contentwidth                                           -->
	<!-- @contentheight                                          -->
	<!-- @fileref                                                -->
	<!-- @format                                                 -->
	<!-- @scale                                                  -->
	<!-- @scalefit                                               -->
	<!-- @valign                                                 -->
	<!-- @width                                                  -->
	<!-- @depth                                                  -->
	
	<xsl:element name="draw:frame">
		<xsl:if test="parent::inlinemediaobject">
			<xsl:attribute name="draw:style-name">imageobject-inline</xsl:attribute>
		</xsl:if>
		<xsl:if test="parent::mediaobject">
			<xsl:attribute name="draw:style-name">imageobject</xsl:attribute>
		</xsl:if>
		<xsl:attribute name="text:anchor-type">paragraph</xsl:attribute>
		<xsl:attribute name="draw:name">imageobject-<xsl:value-of select="generate-id()"/></xsl:attribute>
		
		<!--<xsl:attribute name="style:rel-width">50%</xsl:attribute>-->
		<!--<xsl:attribute name="style:rel-height">100%</xsl:attribute>-->
		
		<xsl:choose>
			<xsl:when test="imagedata/@width|imagedata/@height">
				<!-- hmmmm.... -->
			</xsl:when>
			<xsl:otherwise>
				<!-- shit, in OpenDocument must be svg:width and height defined :(( -->
				<!-- but I have no data!!!                                          -->
				<!-- I love you Image::Magick!                                      -->
				<xsl:attribute name="svg:width">function:getimage-width:(<xsl:value-of select="imagedata/@fileref"/>)</xsl:attribute>
				<xsl:attribute name="svg:height">function:getimage-height:(<xsl:value-of select="imagedata/@fileref"/>)</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:attribute name="svg:y"><xsl:value-of select="$para.padding"/></xsl:attribute>
		
		<xsl:attribute name="draw:z-index">1</xsl:attribute>
		<xsl:element name="draw:image">
			<xsl:attribute name="xlink:href"><xsl:value-of select="imagedata/@fileref"/></xsl:attribute>
			<xsl:attribute name="xlink:type">simple</xsl:attribute>
			<xsl:attribute name="xlink:type">embed</xsl:attribute>
			<xsl:attribute name="xlink:actuate">onLoad</xsl:attribute>
		</xsl:element>
		
	</xsl:element>
	
</xsl:template>



</xsl:stylesheet>
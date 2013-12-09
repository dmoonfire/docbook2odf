<?xml version="1.0" encoding="UTF-8"?>
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
	exclude-result-prefixes="d"
	version="1.0">
  <xsl:template match="d:mediaobject">
	<!-- With ODF, we have to have the image inside a paragraph tag. -->
	<xsl:choose>
	  <xsl:when test="parent::d:para or parent::node()/parent::d:para">
		<xsl:apply-templates/>
	  </xsl:when>
	  <xsl:otherwise>
		<text:p text:style-name="Paragraph">
		  <xsl:apply-templates/>
		</text:p>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>

  <xsl:template match="d:imageobject">
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
	
	<draw:frame>
	  <xsl:if test="parent::d:inlinemediaobject">
		<xsl:attribute name="draw:style-name">imageobject-inline</xsl:attribute>
	  </xsl:if>
	  <xsl:if test="parent::d:mediaobject">
		<xsl:attribute name="draw:style-name">imageobject</xsl:attribute>
	  </xsl:if>
	  <xsl:attribute name="text:anchor-type">paragraph</xsl:attribute>
	  <xsl:attribute name="draw:name">
		<xsl:text>imageobject-</xsl:text>
		<xsl:value-of select="generate-id()"/>
	  </xsl:attribute>

	  <xsl:choose>
		<xsl:when test="parent::d:para or parent::node()/parent::d:para">
		  <xsl:attribute name="text:anchor-type">as-char</xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:attribute name="text:anchor-type">char</xsl:attribute>
		</xsl:otherwise>
	  </xsl:choose>

	  <!--<xsl:attribute name="style:rel-width">50%</xsl:attribute>-->
	  <!--<xsl:attribute name="style:rel-height">100%</xsl:attribute>-->
	  
	  <!-- The svg:width and svg:height are required, but we don't have the ability to resolve those from inside XSLT. So, we put a placeholder in the variables and then the `docbook2odf` will postprocess them with the correct data. -->
	  <xsl:choose>
		<xsl:when test="d:imagedata/@width">
		  <xsl:attribute name="svg:width">
			<xsl:value-of select="d:imagedata/@width"/>
		  </xsl:attribute>
		</xsl:when>
		<xsl:when test="d:imagedata/@height">
		  <xsl:attribute name="svg:width">
			<xsl:text>function:getimage-width-ratio:(</xsl:text>
			<xsl:value-of select="d:imagedata/@fileref"/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="d:imagedata/@height"/>
			<xsl:text>)</xsl:text>
		  </xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:attribute name="svg:width">
			<xsl:text>function:getimage-width:(</xsl:text>
			<xsl:value-of select="d:imagedata/@fileref"/>
			<xsl:text>)</xsl:text>
		  </xsl:attribute>
		</xsl:otherwise>
	  </xsl:choose>
	  <xsl:choose>
		<xsl:when test="d:imagedata/@height">
		  <xsl:attribute name="svg:height">
			<xsl:value-of select="d:imagedata/@height"/>
		  </xsl:attribute>
		</xsl:when>
		<xsl:when test="d:imagedata/@width">
		  <xsl:attribute name="svg:height">
			<xsl:text>function:getimage-height-ratio:(</xsl:text>
			<xsl:value-of select="d:imagedata/@fileref"/>
			<xsl:text>,</xsl:text>
			<xsl:value-of select="d:imagedata/@width"/>
			<xsl:text>)</xsl:text>
		  </xsl:attribute>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:attribute name="svg:height">
			<xsl:text>function:getimage-height:(</xsl:text>
			<xsl:value-of select="d:imagedata/@fileref"/>
			<xsl:text>)</xsl:text>
		  </xsl:attribute>
		</xsl:otherwise>
	  </xsl:choose>
	  
	  <xsl:attribute name="svg:y">
		<xsl:value-of select="$style.para.marginTop"/>
	  </xsl:attribute>
	  
	  <xsl:attribute name="draw:z-index">1</xsl:attribute>
	  <draw:image
		  xlink:type="embed"
		  xlink:actuate="onLoad">
		<xsl:attribute name="xlink:href">
		  <xsl:value-of select="d:imagedata/@fileref"/>
		</xsl:attribute>
	  </draw:image>
	</draw:frame>
  </xsl:template>

  <xsl:template match="screenshot">
	<xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>

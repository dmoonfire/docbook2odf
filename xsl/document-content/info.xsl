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


<xsl:template match="bookinfo|chapterinfo">
	
	<xsl:element name="table:table">
		<xsl:attribute name="table:style-name">table-info</xsl:attribute>
		<xsl:element name="table:table-column">
			<xsl:attribute name="table:style-name">table-info.column-A</xsl:attribute>
		</xsl:element>
		<xsl:element name="table:table-column">
			<xsl:attribute name="table:style-name">table-info.column-B</xsl:attribute>
		</xsl:element>
		
		<xsl:apply-templates/>
		
	</xsl:element>
	
</xsl:template>


<xsl:template match="bookinfo/*|chapterinfo/*">
	
	<xsl:variable name="name" select="name()"/>
	
	<xsl:element name="table:table-row">
		<xsl:element name="table:table-cell">
			<xsl:attribute name="office:value-type">string</xsl:attribute>
			<xsl:attribute name="table:style-name">table-info.cell-H</xsl:attribute>
			<xsl:attribute name="table:number-columns-spanned">2</xsl:attribute>
			<xsl:element name="text:h">
				<xsl:attribute name="text:style-name">Headings-para</xsl:attribute>
				<xsl:value-of select="name()"/>:
			</xsl:element>
		</xsl:element>
	</xsl:element>
	
	<table:table-row>
		<xsl:comment>empty cell (only used for padding content)</xsl:comment>
		<table:table-cell
			office:value-type="sting"
			table:style-name="table-info.cell-A">
			<text:p/>
		</table:table-cell>
		<table:table-cell
			office:value-type="sting"
			table:style-name="table-info.cell-A">
			<xsl:choose>
				<!-- when element has no childs -->
				<xsl:when test="count(*)=0">
					<text:p text:style-name="para-padding">
						<!-- can be continue formatted as inline element -->
						<xsl:apply-templates/>
					</text:p>
				</xsl:when>
				<!-- when element can be formatted by default (contains paragraphs, etc...) -->
				<xsl:when test="$name='abstract' or $name='legalnotice' or $name='authorblurb'">
					<xsl:apply-templates/>
				</xsl:when>
				<!-- when element must be formatted special -->
				<xsl:otherwise>
					<xsl:apply-templates select="." mode="info"/>
				</xsl:otherwise>
			</xsl:choose>
		</table:table-cell>
	</table:table-row>
</xsl:template>


<xsl:template match="authorgroup" mode="info">
	<xsl:apply-templates mode="info"/>
</xsl:template>


<xsl:template match="corpauthor" mode="info">
	<text:p text:style-name="para-padding">
		<text:span text:style-name="text-bold">
			<xsl:apply-templates/>
		</text:span>
	</text:p>
</xsl:template>


<xsl:template match="author" mode="info">
	<text:p text:style-name="para-padding">
	
		<!-- name of author -->
		<xsl:if test="firstname">
			<xsl:value-of select="firstname"/><xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="othername">
			<xsl:value-of select="othername"/><xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="surname"/>
		
		<!-- email contact -->
		<xsl:if test="email">
			<xsl:text> (</xsl:text>
				<xsl:apply-templates select="email"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		
	</text:p>
</xsl:template>



</xsl:stylesheet>
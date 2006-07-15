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


<xsl:template match="table">
	<xsl:choose>
		<xsl:when test="tgroup">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<!-- this is HTML table -->
			
			<xsl:if test="caption">
				<xsl:element name="text:h">
					<xsl:attribute name="text:style-name">Headings-small</xsl:attribute>
					<xsl:value-of select="caption"/>
				</xsl:element>
			</xsl:if>
			
			<xsl:element name="table:table">
				<!--<xsl:attribute name="table:name"></xsl:attribute>-->
				<!--<xsl:attribute name="table:style-name"></xsl:attribute>-->
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="table/title">
	<xsl:element name="text:h">
		<xsl:attribute name="text:style-name">Headings-small</xsl:attribute>
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>


<xsl:template match="table/caption"/>


<xsl:template match="tgroup">
	<!-- tgroup is the real table -->
	<xsl:element name="table:table">
		<!--<xsl:attribute name="table:name"></xsl:attribute>-->
		<xsl:attribute name="table:style-name">table-default</xsl:attribute>
		
		<xsl:element name="table:table-column">
			<xsl:attribute name="table:number-columns-repeated">
				<xsl:value-of select="@cols"/>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:apply-templates/>
		
		<xsl:if test="tfoot">
			<xsl:call-template name="tfoot"/>
		</xsl:if>
		
	</xsl:element>
</xsl:template>


<xsl:template match="thead">
	<xsl:element name="table:table-header-rows">
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>


<xsl:template match="tfoot"/>


<xsl:template name="tfoot">
	
</xsl:template>


<xsl:template match="tbody">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="row">
	<xsl:element name="table:table-row">
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>


<xsl:template match="tr">
	<xsl:choose>
		<!-- this is header -->
		<xsl:when test="th">
			<xsl:element name="table:table-header-rows">
				<xsl:element name="table:table-row">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:when>
		<xsl:otherwise>
			<xsl:element name="table:table-row">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="entry">
	<xsl:element name="table:table-cell">
		<xsl:attribute name="office:value-type">string</xsl:attribute>
		<xsl:attribute name="table:style-name">table-default.cell-A</xsl:attribute>
		<!-- spanning by namest and nameend -->
		<xsl:if test="@namest">
			<!-- find collumn number from <docbook:colspec> -->
		</xsl:if>
		<xsl:choose>
			<!-- this element containts more sub-elements (paragraphs, eg...) -->
			<xsl:when test="*">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="text:p">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:element>
</xsl:template>


<xsl:template match="td">
	<xsl:element name="table:table-cell">
		<!-- spanning by namest and nameend -->
		<xsl:if test="@colspan>1">
			
		</xsl:if>
		<xsl:attribute name="office:value-type">string</xsl:attribute>
		<xsl:choose>
			<!-- this element containts more sub-elements (paragraphs, eg...) -->
			<xsl:when test="*">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="text:p">
					<xsl:value-of select="."/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:element>
</xsl:template>


</xsl:stylesheet>
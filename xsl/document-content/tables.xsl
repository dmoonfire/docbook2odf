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
				<xsl:variable name="number">
					<xsl:call-template name="table.number"/>
				</xsl:variable>
				<text:h text:style-name="Heading-small">
					<xsl:text>Table </xsl:text><xsl:value-of select="$number"/><xsl:text>. </xsl:text><xsl:value-of select="caption"/>
				</text:h>
			</xsl:if>
			<table:table
				table:style-name="table-default">
				<!--<xsl:attribute name="table:name"></xsl:attribute>-->
				<xsl:apply-templates/>
			</table:table>
			
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="table/title">
	<xsl:variable name="number">
		<xsl:call-template name="table.number"/>
	</xsl:variable>
	<text:h text:style-name="Heading-small">
		<xsl:text>Table </xsl:text><xsl:value-of select="$number"/><xsl:text>. </xsl:text><xsl:apply-templates/>
	</text:h>
</xsl:template>


<xsl:template match="table/caption"/>


<xsl:template match="tgroup">
	<!-- tgroup is the real table -->
	<table:table
		table:style-name="table-default">
		<!--<xsl:attribute name="table:name"></xsl:attribute>-->
		
		<table:table-column>
			<xsl:attribute name="table:number-columns-repeated">
				<xsl:value-of select="@cols"/>
			</xsl:attribute>
		</table:table-column>
		
		<xsl:apply-templates/>
		
		<xsl:if test="tfoot">
			<xsl:apply-templates select="tfoot" mode="tfoot" />
		</xsl:if>
		
	</table:table>
</xsl:template>


<xsl:template match="thead">
	<table:table-header-rows>
		<xsl:apply-templates/>
	</table:table-header-rows>
</xsl:template>


<xsl:template match="tfoot"/>


<xsl:template match="tfoot" mode="tfoot">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="tbody">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="row">
	<table:table-row>
		<xsl:apply-templates/>
	</table:table-row>
</xsl:template>


<xsl:template match="tr">
	<xsl:choose>
		<!-- this is header -->
		<xsl:when test="th">
			<table:table-header-rows>
				<table:table-row>
					<xsl:apply-templates/>
				</table:table-row>
			</table:table-header-rows>
		</xsl:when>
		<xsl:otherwise>
			<table:table-row>
				<xsl:apply-templates/>
			</table:table-row>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- entries -->

<xsl:template match="entry">
	
	<xsl:variable name="position" select="position() div 2"/>
	<xsl:variable name="last" select="(last()-1) div 2"/>
	<xsl:variable name="parent-position" select="((count(../preceding-sibling::node())-1) div 2) + 1"/>
	<xsl:variable name="parent-last" select="count(../../*)"/>
	
	<xsl:comment>position=<xsl:value-of select="$position"/></xsl:comment>
	<xsl:comment>last=<xsl:value-of select="$last"/></xsl:comment>
	<xsl:comment>parent-position=<xsl:value-of select="$parent-position"/></xsl:comment>
	<xsl:comment>parent-last=<xsl:value-of select="$parent-last"/></xsl:comment>
	
	<table:table-cell
		office:value-type="string">
		
		<xsl:attribute name="table:style-name">
			<xsl:text>table-default.cell-</xsl:text>
			<!-- prefix -->
			<xsl:if test="parent::row/parent::thead">
				<xsl:text>H-</xsl:text>
			</xsl:if>
			<xsl:if test="parent::row/parent::tfoot">
				<xsl:text>F-</xsl:text>
			</xsl:if>
			<!-- postfix defined by cell position -->
			<!--
				________
				|A1|B1|C1|
				|A2|B2|C2|
				|A3|B3|C3|
				^^^^^^^^
			-->
			<xsl:choose>
			
				<!-- A3 -->
				<xsl:when test="$position = 1 and $parent-position = $parent-last">
					<xsl:text>A3</xsl:text>
				</xsl:when>
				<!-- C3 -->
				<xsl:when test="$position=$last and $parent-position = $parent-last">
					<xsl:text>C3</xsl:text>
				</xsl:when>
				<!-- B3 -->
				<xsl:when test="$parent-position = $parent-last">
					<xsl:text>B3</xsl:text>
				</xsl:when>
			
				<!-- A1 -->
				<xsl:when test="$position = 1 and $parent-position = 1">
					<xsl:text>A1</xsl:text>
				</xsl:when>
				<!-- C1 -->
				<xsl:when test="$position=$last and $parent-position = 1">
					<xsl:text>C1</xsl:text>
				</xsl:when>
				<!-- B1 -->
				<xsl:when test="$parent-position = 1">
					<xsl:text>B1</xsl:text>
				</xsl:when>
				
				<!-- A2 -->
				<xsl:when test="$position = 1">
					<xsl:text>A2</xsl:text>
				</xsl:when>
				<!-- C2 -->
				<xsl:when test="$position=$last">
					<xsl:text>C2</xsl:text>
				</xsl:when>
				
				<!-- all other cells -->
				<xsl:otherwise>
					<xsl:text>B2</xsl:text>
				</xsl:otherwise>
				
			</xsl:choose>
			
		</xsl:attribute>
		
		<!-- spanning by namest and nameend -->
		<xsl:if test="@namest">
			<!-- find collumn number from <colspec> -->
		</xsl:if>
		<xsl:choose>
			<!-- this element containts more sub-elements (paragraphs, eg...) -->
			<xsl:when test="child::para">
				<xsl:comment>child::paragraph</xsl:comment>
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="*">
				<xsl:comment>child::*</xsl:comment>
				<text:p
					text:style-name="Standard">
					<xsl:apply-templates/>
				</text:p>
			</xsl:when>
			<xsl:otherwise>
				<xsl:comment>child::otherwise</xsl:comment>
				<text:p
					text:style-name="Standard">
					<xsl:value-of select="."/>
				</text:p>
			</xsl:otherwise>
		</xsl:choose>
	</table:table-cell>
</xsl:template>


<xsl:template match="td">
	<table:table-cell
		office:value-type="string"
		table:style-name="table-default.cell-B2">
		<!-- spanning by namest and nameend -->
		<xsl:if test="@colspan>1">
			
		</xsl:if>
		<xsl:choose>
			<!-- this element containts more sub-elements (paragraphs, eg...) -->
			<xsl:when test="*">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<text:p
					text:style-name="Standard">
					<xsl:value-of select="."/>
				</text:p>
			</xsl:otherwise>
		</xsl:choose>
	</table:table-cell>
</xsl:template>


</xsl:stylesheet>

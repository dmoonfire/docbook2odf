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


<xsl:template match="/bibliography">
	
	<xsl:element name="office:text">
		
		<xsl:call-template name="CI.office-text"/>
		
		<xsl:call-template name="bibliography"/>
		
	</xsl:element>
	
</xsl:template>


<xsl:template name="bibliography" match="bibliography">
	<!--
		when this document is only bibliography, render bibliography title as
		title of document. when bibliography is only part of document, render
		bibliography as only one chapter of document
		-->
		
	<xsl:comment>Bibliography</xsl:comment>
	
	<xsl:choose>
		<!-- this document is bibliography -->
		<xsl:when test="/bibliography">
			<text:p text:style-name="title-bibliography">
				<xsl:text>Bibliography</xsl:text>
			</text:p>
			<text:h
				text:outline-level="1"
				text:style-name="Heading1">
				<xsl:value-of select="title|bibliographyinfo/title"/>
			</text:h>
		</xsl:when>
		<!-- bibliography is in second level -->
		<xsl:when test="parent::chapter">
			<text:h
				text:outline-level="1"
				text:style-name="Heading2">
				<xsl:value-of select="title|bibliographyinfo/title"/>
			</text:h>
		</xsl:when>
		<!-- bibliography in entire document -->
		<xsl:otherwise>
			<text:p
				text:style-name="Heading-small">
				<xsl:value-of select="title|bibliographyinfo/title"/>
			</text:p>
		</xsl:otherwise>
	</xsl:choose>
	
	<xsl:apply-templates/>
	
</xsl:template>


<xsl:template match="bibliography/title" />
<xsl:template match="bibliodiv/title" />

<xsl:template match="bibliodiv">
	
	<!-- compute level of section -->
	<xsl:variable name="level">
		<xsl:call-template name="section.level"/>
	</xsl:variable>
	
	<text:h>
		<xsl:attribute name="text:outline-level">
			<xsl:value-of select="$level"/>
		</xsl:attribute>
		<xsl:attribute name="text:style-name"><xsl:text>Heading</xsl:text>
			<xsl:if test="$level &lt; 5">
				<xsl:value-of select="$level"/>
			</xsl:if>
			<xsl:if test="$level &gt; 4"><xsl:text>s</xsl:text></xsl:if>
		</xsl:attribute>
		<xsl:value-of select="child::title"/>
	</text:h>
	
	<xsl:apply-templates/>
	
</xsl:template>




<xsl:template match="biblioentry">
	
	<table:table
		table:style-name="table-info">
		<table:table-column
			table:style-name="table-biblio.column-A"/>
		<table:table-column
			table:style-name="table-biblio.column-B"/>
		
		<table:table-row>
			<table:table-cell
				office:value-type="string"
				table:style-name="table-default.cell-H4"
				table:number-columns-spanned="2">
				<text:p
					text:style-name="para-title">
					<xsl:value-of select="title|abbrev|isbn|issn"/>
				</text:p>
			</table:table-cell>
		</table:table-row>
		
		<xsl:apply-templates/>
		
		<table:table-row>
			<table:table-cell
				office:value-type="string"
				table:style-name="table-default.cell-F6"
				table:number-columns-spanned="2">
				<text:p/>
			</table:table-cell>
		</table:table-row>
		
	</table:table>
	
</xsl:template>



<xsl:template match="biblioentry/*">
	
	<xsl:variable name="name" select="name()"/>
	
	<table:table-row>
		<xsl:comment>empty cell (only used for padding content)</xsl:comment>
		<table:table-cell
			office:value-type="string"
			table:style-name="table-default.cell-A5">
			<text:p text:style-name="para">
				<text:span text:style-name="text-bold">
					<xsl:value-of select="name()"/><xsl:text>:</xsl:text>
				</text:span>
			</text:p>
		</table:table-cell>
		<table:table-cell
			office:value-type="sting"
			table:style-name="table-default.cell-C5">
			<xsl:choose>
				<!-- when element has no childs -->
				<xsl:when test="count(*)=0">
					<text:p text:style-name="para">
						<!-- can be continue formatted as inline element -->
						<xsl:apply-templates/>
					</text:p>
				</xsl:when>
				<!--
					when element can be formatted by default, because all childs
					is creating paragraph elements
				-->
				<xsl:when test="
					$name='abstract' or
					$name='legalnotice' or
					$name='authorblurb' or
					$name='printhistory'">
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



<xsl:template match="bibliomixed">
	
	<xsl:apply-templates/>
	
</xsl:template>


</xsl:stylesheet>
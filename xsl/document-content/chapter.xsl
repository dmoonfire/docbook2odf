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
	xmlns:docbook="http://docbook.org/ns/docbook"
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


<xsl:template match="/chapter">
	
	<xsl:element name="office:text">
		
		<xsl:call-template name="CI.office-text"/>
		
		<xsl:call-template name="chapter"/>
		
	</xsl:element>
	
</xsl:template>


<xsl:template name="chapter" match="chapter">
	
	
	<xsl:choose>
		<!-- chapter as document -->
		<xsl:when test="/chapter">
			<text:p
				text:style-name="Title_20_Chapter">
				<xsl:value-of select="title|info/title"/>
			</text:p>
		</xsl:when>
		<!-- chapter in book -->
		<xsl:otherwise>
		  <!--
			<text:p text:style-name="Title_20_Chapter">
				<xsl:text>Chapter</xsl:text>
			</text:p>
		  -->
			<text:h
				text:outline-level="1"
				text:style-name="Heading_20_1">
				<xsl:value-of select="title|info/title"/>
			</text:h>
		</xsl:otherwise>
	</xsl:choose>
	
	<!--
	<text:p text:style-name="Title_20_Chapter">
		<xsl:text>Chapter</xsl:text>
	</text:p>
	<text:h
		text:outline-level="1"
		text:style-name="Heading_20_1">
		<xsl:value-of select="title|chapterinfo/title"/>
	</text:h>
	-->
	
	<xsl:apply-templates/>
	
</xsl:template>


<xsl:template match="chapter/title"/>


<xsl:template name="chapter.subtitle" match="chapter/subtitle">
	<text:p
		text:style-name="para-title2">
		<xsl:apply-templates/>
	</text:p>
</xsl:template>


</xsl:stylesheet>

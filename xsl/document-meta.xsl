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
	xmlns:office="http://openoffice.org/2000/office"
	xmlns:meta="http://openoffice.org/2000/meta"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	office:version="1.0">
	
<xsl:template name="document-meta">
	
	<xsl:element name="office:meta">
		
		<xsl:element name="dc:title">
			<xsl:value-of select="/article/articleinfo/title"/>
		</xsl:element>
		
		<xsl:element name="dc:subject">
			<xsl:value-of select="/article/articleinfo/subtitle"/>
		</xsl:element>
		
		<xsl:element name="dc:description">
			<xsl:value-of select="/article/articleinfo/description"/>
		</xsl:element>
		
		<xsl:element name="dc:date">
			<xsl:value-of select="article/articleinfo/pubdate"/>
		</xsl:element>
		
		<xsl:element name="dc:language">
			<xsl:value-of select="article/@lang"/>
		</xsl:element>
		
		<xsl:element name="meta:generator">
			<xsl:text>docbook2odf generator (http://open.comsultia.com/docbook2odf/)</xsl:text>
		</xsl:element>
		
	</xsl:element>
	
</xsl:template>
	
</xsl:stylesheet>
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
		
		<dc:title><xsl:value-of select="/article/articleinfo/title"/></dc:title>
		<dc:subject><xsl:value-of select="/article/articleinfo/subtitle"/></dc:subject>
		<dc:description><xsl:value-of select="/article/articleinfo/description"/></dc:description>
		<dc:date><xsl:value-of select="article/articleinfo/pubdate"/></dc:date>
		<dc:language><xsl:value-of select="article/@lang"/></dc:language>
		
		<meta:generator>WebCom Docbook2OpenDocument generator</meta:generator>
		<meta:creation-date>2002-07-15T12:38:53</meta:creation-date>
		<!-- ??? --><meta:editing-cycles>21</meta:editing-cycles>
		<!-- ??? --><meta:editing-duration>P1DT0H11M54S</meta:editing-duration>
		<!-- ??? --><meta:user-defined meta:name="Info 1"/>
		<!-- ??? --><meta:user-defined meta:name="Info 2"/>
		<!-- ??? --><meta:user-defined meta:name="Info 3"/>
		<!-- ??? --><meta:user-defined meta:name="Info 4"/>
		<!-- ??? --><meta:document-statistic
							meta:table-count="1"
							meta:image-count="0"
							meta:object-count="0"
							meta:page-count="1"
							meta:paragraph-count="42"
							meta:word-count="144"
							meta:character-count="820"/>
			
	</xsl:element>
	
</xsl:template>
	
</xsl:stylesheet>
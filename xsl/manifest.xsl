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
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0">
	
<xsl:template name="manifest">
	
	<xsl:element name="manifest:manifest">
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text>application/vnd.oasis.opendocument.text</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>/</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text>application/vnd.sun.xml.ui.configuration</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>Configurations2/</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text></xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>Pictures/</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text>text/xml</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>content.xml</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text>text/xml</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>styles.xml</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
		<xsl:element name="manifest:file-entry">
			<xsl:attribute name="manifest:media-type">
				<xsl:text>text/xml</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="manifest:full-path">
				<xsl:text>meta.xml</xsl:text>
			</xsl:attribute>
		</xsl:element>
		
	</xsl:element>
	
</xsl:template>
	
</xsl:stylesheet>
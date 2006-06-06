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
	
	<manifest:manifest
		xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0">
		<!--xsl:attribute name="xmlns:manifest" value="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"/-->
		<manifest:file-entry manifest:media-type="application/vnd.oasis.opendocument.text" manifest:full-path="/"/>
		<manifest:file-entry manifest:media-type="application/vnd.sun.xml.ui.configuration" manifest:full-path="Configurations2/"/>
		<!--<manifest:file-entry manifest:media-type="image/png" manifest:full-path="Pictures/10000201000002400000011FD512DF00.png"/>-->
		<!--<manifest:file-entry manifest:media-type="image/png" manifest:full-path="Pictures/1000000000000106000001F6CF9AC99E.png"/>-->
		<!--<manifest:file-entry manifest:media-type="image/png" manifest:full-path="Pictures/10000201000000D400000028B4A7B34C.png"/>-->
		<!--<manifest:file-entry manifest:media-type="image/png" manifest:full-path="Pictures/100002010000024000000078B1928324.png"/>-->
		<!--<manifest:file-entry manifest:media-type="image/png" manifest:full-path="Pictures/100000000000029E000003474B092315.png"/>-->
		<manifest:file-entry manifest:media-type="" manifest:full-path="Pictures/"/>
		<manifest:file-entry manifest:media-type="text/xml" manifest:full-path="content.xml"/>
		<manifest:file-entry manifest:media-type="text/xml" manifest:full-path="styles.xml"/>
		<manifest:file-entry manifest:media-type="text/xml" manifest:full-path="meta.xml"/>
		<!--<manifest:file-entry manifest:media-type="text/xml" manifest:full-path="settings.xml"/>-->
	</manifest:manifest>
	
</xsl:template>
	
</xsl:stylesheet>
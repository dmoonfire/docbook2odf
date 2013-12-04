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
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	version="1.0">
  <!-- Parameters -->
  <xsl:param name="part" select="content" />

  <!-- Output Settings -->
  <xsl:decimal-format name="staff" digit="D" />
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

  <!--
	  Parses the generated document (via `docbook.xsl`) and splits it out
	  into its component parts.
  -->
  <xsl:template match="/">
	<xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="office:document">
	<xsl:choose>
	  <xsl:when test="$part = 'meta'">
		<xsl:copy-of select="/office:document/office:document-meta" />
	  </xsl:when>
	  <xsl:when test="$part = 'content'">
		<xsl:copy-of select="/office:document/office:document-content" />
	  </xsl:when>
	  <xsl:when test="$part = 'styles'">
		<xsl:copy-of select="/office:document/office:document-styles" />
	  </xsl:when>
	  <xsl:when test="$part = 'manifest'">
		<xsl:copy-of select="/office:document/manifest:manifest" />
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:copy-of select="/office:document/office:document-content" />
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
</xsl:stylesheet>

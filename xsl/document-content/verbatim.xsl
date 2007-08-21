<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY RE "&#10;">
<!ENTITY nbsp "&#160;">
<!ENTITY nbsp2 "&#130;">
]>
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


<xsl:template match="screen|programlisting|synopsis">
	
	<xsl:variable name="lines">
		<xsl:call-template name="verbatim.line">
			<xsl:with-param name="content" select="string(.)"/>
			<xsl:with-param name="style" select="local-name()"/>
		</xsl:call-template>
	</xsl:variable>
	
	<text:p/>
	<xsl:copy-of select="$lines"/>
	
</xsl:template>


<xsl:template match="literallayout">
	<text:p>
		<xsl:attribute name="text:style-name">para-literallayout</xsl:attribute>
		<xsl:apply-templates/>
	</text:p>
</xsl:template>


<xsl:template match="command">
	
	<xsl:choose>
		<xsl:when test="parent::para">
			<text:span text:style-name="text-command">
				<xsl:apply-templates/>
			</text:span>
		</xsl:when>
		<xsl:otherwise>
			<text:para>
				<xsl:apply-templates/>
			</text:para>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<xsl:template match="keycap">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template name="verbatim.line">
	<xsl:param name="content"/>
	<xsl:param name="style"/>
	<xsl:param name="count" select="1"/>
	
		<xsl:choose>
			<xsl:when test="contains($content, '&#10;')">
				<text:p>
					<xsl:attribute name="text:style-name">
						<xsl:text>para-</xsl:text><xsl:value-of select="$style"/>
					</xsl:attribute>
					<xsl:value-of select="substring-before($content, '&#10;')"/>
				</text:p>
				<xsl:call-template name="verbatim.line">
					<xsl:with-param name="content" select="translate(substring-after($content, '&#10;'),' ','&nbsp2;')"/>
					<xsl:with-param name="style" select="$style"/>
					<xsl:with-param name="count" select="$count + 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<text:p>
					<xsl:attribute name="text:style-name">para-<xsl:value-of select="$style"/></xsl:attribute>
					<xsl:value-of select="translate(string($content),' ','&nbsp2;')"/>
				</text:p>
			</xsl:otherwise>
		</xsl:choose>
	
</xsl:template>








</xsl:stylesheet>
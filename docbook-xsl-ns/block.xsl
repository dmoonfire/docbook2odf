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
    xmlns:d="http://docbook.org/ns/docbook"
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
	exclude-result-prefixes="d"
	version="1.0">
  <!--
	  This is the generic version for inserting a paragraph or a heading,
	  based on settings.
  -->
  <xsl:template name="p-or-h">
	<xsl:param name="style.name"/>
	<xsl:param name="style.level"/>
	<xsl:param name="text"/>
	<xsl:param name="referenceMark"/>
	<xsl:param name="referenceRef"/>

	<xsl:if test="$style.level &gt; 0">
	  <text:h>
		<xsl:attribute name="text:outline-level">
	      <xsl:value-of select="$style.level"/>
		</xsl:attribute>
		<xsl:attribute name="text:style-name">
		  <xsl:value-of select="$style.name" />
		</xsl:attribute>
		
		<xsl:if test="$referenceMark != ''">
		  <text:reference-mark-start text:name="{$referenceMark}"/>
		</xsl:if>

		<xsl:choose>
		  <xsl:when test="$referenceRef != ''">
			<text:reference-ref
				text:reference-format="text"
				text:ref-name="{$referenceRef}">
			  <xsl:value-of select="normalize-space($text)"/>
			</text:reference-ref>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="normalize-space($text)"/>
		  </xsl:otherwise>
		</xsl:choose>

		<xsl:if test="$referenceMark != ''">
		  <text:reference-mark-end text:name="{$referenceMark}"/>
		</xsl:if>
	  </text:h>
	</xsl:if>
	<xsl:if test="not($style.level &gt; 0)">
	  <text:p>
		<xsl:attribute name="text:style-name">
		  <xsl:value-of select="$style.name" />
		</xsl:attribute>
		
		<xsl:if test="$referenceMark != ''">
		  <text:reference-mark-start text:name="{$referenceMark}"/>
		</xsl:if>

		<xsl:choose>
		  <xsl:when test="$referenceRef != ''">
			<text:reference-ref
				text:reference-format="text"
				text:ref-name="{$referenceRef}">
			  <xsl:value-of select="normalize-space($text)"/>
			</text:reference-ref>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="normalize-space($text)"/>
		  </xsl:otherwise>
		</xsl:choose>

		<xsl:if test="$referenceMark != ''">
		  <text:reference-mark-end text:name="{$referenceMark}"/>
		</xsl:if>
	  </text:p>
	</xsl:if>
  </xsl:template>

  <!-- Paragraphs -->
  <xsl:template match="d:para|d:simpara">
	<text:p text:style-name="{$style.name.para}">
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>

  <!-- Epigraphs -->
  <xsl:template match="d:epigraph">
	<xsl:apply-templates select="d:para|d:simpara|d:formalpara|d:literallayout"/>

	<xsl:if test="d:attribution">
	  <!-- We use the em-dash because of Chicago Style. -->
	  <xsl:call-template name="p-or-h">
		<xsl:with-param name="style.name">
		  <xsl:value-of select="$style.name.epigraphAttribution"/>
		</xsl:with-param>
		<xsl:with-param name="style.level">
		  <xsl:value-of select="$style.level.epigraphAttribution"/>
		</xsl:with-param>
		<xsl:with-param name="text">
		  <xsl:text>&#x2014; </xsl:text>
		  <xsl:value-of select="d:attribution"/>
		</xsl:with-param>
	  </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="d:epigraph/d:para|d:epigraph/d:simpara">
	<xsl:call-template name="p-or-h">
	  <xsl:with-param name="style.name">
		<xsl:value-of select="$style.name.epigraph"/>
	  </xsl:with-param>
	  <xsl:with-param name="style.level">
		<xsl:value-of select="$style.level.epigraph"/>
	  </xsl:with-param>
	  <xsl:with-param name="text">
		<xsl:apply-templates />
	  </xsl:with-param>
	</xsl:call-template>
  </xsl:template>
</xsl:stylesheet>

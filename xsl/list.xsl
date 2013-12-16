<?xml version="1.0" encoding="utf-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
-->
<xsl:stylesheet
	version="1.0"
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
	office:class="text"
	office:version="1.0"
	exclude-result-prefixes="d">
  <!-- Tasks -->
  <xsl:template match="d:task">
	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="d:task/d:title">
	<text:p
		text:style-name="Heading_20_Small">
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>
  
  <xsl:template match="d:taskprerequisites">
	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="d:procedure">
	<!-- Apply everything but the list items. -->
	<xsl:apply-templates/>
	
	<!-- Create a list with the items. -->
	<text:list text:style-name="List_20_1">
      <xsl:apply-templates mode="list"/>
	</text:list>
  </xsl:template>

  <!-- Itemized Lists -->
  <xsl:template match="d:itemizedlist">
	<!-- apply all, only not listitem -->
	<xsl:apply-templates/>
	
	<text:list text:style-name="List_20_1">
      <!-- apply only listitem -->
      <xsl:apply-templates mode="list"/>
	</text:list>
  </xsl:template>
  
  <!-- Ordered lists -->
  <xsl:template match="d:orderedlist">
	<!-- Apply the template for everything but the list items themselves. -->
	<xsl:apply-templates/>
	
	<!-- Create the list with the items inside it. -->
	<text:list text:style-name="Numbering_20_1">
      <!-- Set up if we are resuming the item numbers or not. -->
      <xsl:attribute name="text:continue-numbering">
		<xsl:choose>
		  <xsl:when test="@continuation='continues'">true</xsl:when>
		  <xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
      </xsl:attribute>
	  
      <!-- Add in the individual list items. -->
      <xsl:apply-templates mode="list" />
	</text:list>
  </xsl:template>

  <!-- Titles -->
  <xsl:template match="d:itemizedlist/d:title|d:orderedlist/d:title|d:variablelist/d:title">
	<text:p
		text:style-name="Heading_20_Small">
	  <xsl:value-of select="."/>
	</text:p>
  </xsl:template>
  
  <!-- List Items and Steps -->
  <xsl:template match="d:listitem|d:step"/>
  <xsl:template match="d:listitem|d:step" mode="list">
	<text:list-item>
	  <xsl:apply-templates/>
	</text:list-item>
  </xsl:template>
  <!-- all other content in list -->
  <xsl:template match="*" mode="list"/>
  
  <xsl:template match="d:variablelist">
	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="d:varlistentry">
	<xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="d:varlistentry/d:term">
	<text:p text:style-name="Paragraph_20_Term">
	  <xsl:apply-templates/>
	</text:p>
  </xsl:template>
  
  <xsl:template match="d:varlistentry/d:listitem">
	<xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>

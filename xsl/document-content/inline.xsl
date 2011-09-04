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


<xsl:template match="docbook:quote">
  <text:span>
    <xsl:choose>
      <xsl:when test="$quote.fancy = 1">
	<xsl:text>&#x201c;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:apply-templates/>

    <xsl:choose>
      <xsl:when test="$quote.fancy = 1">
	<xsl:text>&#x201d;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </text:span>
</xsl:template>


<xsl:template match="docbook:email">
	<text:a xlink:type="simple">
		<xsl:attribute name="xlink:href">
			<xsl:text>mailto:</xsl:text><xsl:value-of select="."/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</text:a>
</xsl:template>


<xsl:template match="docbook:uri">
	<text:a xlink:type="simple">
		<xsl:attribute name="xlink:href"><xsl:value-of select="."/></xsl:attribute>
		<xsl:apply-templates/>
	</text:a>
</xsl:template>


<xsl:template match="docbook:ulink">
	<text:a xlink:type="simple">
		<xsl:attribute name="xlink:href"><xsl:value-of select="@url"/></xsl:attribute>
		<xsl:apply-templates/>
	</text:a>
</xsl:template>


<xsl:template match="docbook:emphasis">
	<text:span>
		<xsl:attribute name="text:style-name">
			<xsl:choose>
				<xsl:when test="@role='strong'">Text_20_Strong</xsl:when>
				<xsl:when test="@role='bold'">Text_20_Bold</xsl:when>
				<xsl:when test="@role='underline'">Text_20_Underline</xsl:when>
				<xsl:when test="@role='strikethrough'">Text_20_Strikethrough</xsl:when>
				<xsl:otherwise>Text_20_Italic</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:apply-templates/>
	</text:span>
</xsl:template>


<xsl:template match="docbook:superscript">
	<text:span>
		<xsl:attribute name="text:style-name">text-super</xsl:attribute>
		<xsl:apply-templates/>
	</text:span>
</xsl:template>


<xsl:template match="docbook:subscript">
	<text:span>
		<xsl:attribute name="text:style-name">text-sub</xsl:attribute>
		<xsl:apply-templates/>
	</text:span>
</xsl:template>



<xsl:template name="credit" match="docbook:author|docbook:editor|docbook:othercredit">
	<!-- name of author/editor -->
	
	<xsl:comment>credit</xsl:comment>
	
	<xsl:if test="docbook:firstname">
		<xsl:comment>firstname</xsl:comment>
		<xsl:value-of select="firstname"/><xsl:text> </xsl:text>
	</xsl:if>
	<xsl:if test="docbook:othername">
		<xsl:comment>othername</xsl:comment>
		<xsl:value-of select="othername"/><xsl:text> </xsl:text>
	</xsl:if>
	<xsl:comment>surname</xsl:comment>
	<xsl:value-of select="docbook:surname"/>
	
	<!-- email contact -->
	<xsl:if test="docbook:email">
		<xsl:text> (</xsl:text>
			<xsl:comment>email</xsl:comment>
			<xsl:apply-templates select="docbook:email"/>
		<xsl:text>)</xsl:text>
	</xsl:if>
</xsl:template>



<xsl:template name="copyright" match="docbook:copyright">
	<!-- name of author/editor -->
	<xsl:comment>copyright</xsl:comment>
		<xsl:text>(C)</xsl:text>
		<xsl:apply-templates/>
	<xsl:comment>/copyright</xsl:comment>
</xsl:template>



<!-- Don't style -->


<xsl:template match="
	docbook:year|
	docbook:holder|
	docbook:publishername
	">
	<xsl:comment><xsl:value-of select="local-name()"/></xsl:comment>
	<text:span><xsl:apply-templates/></text:span>
	<xsl:comment>/<xsl:value-of select="local-name()"/></xsl:comment>
</xsl:template>

</xsl:stylesheet>
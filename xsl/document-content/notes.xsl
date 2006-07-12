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


<xsl:template match="speakernotes"/>


<xsl:template name="speakernotes.render">
	
	<!--
			<xsl:if test="slidesinfo">
				<xsl:variable name="page.number" select="1"/>
			</xsl:if>
			<xsl:if test="parent::foilgroup">
				<xsl:variable name="page.number" select="count(../preceding-sibling::node())+1"/>
			</xsl:if>
			<xsl:if test="parent::foil">
				<xsl:variable name="page.number" select="count(../preceding-sibling::node())+count(preceding-sibling::node())+1"/>
			</xsl:if>
	-->
			
			<presentation:notes
				draw:style-name="drawing-page-default"
				presentation:placeholder="true">
				<office:forms form:automatic-focus="false" form:apply-design-mode="false"/>
				
				<xsl:element name="draw:page-thumbnail">
					<xsl:attribute name="draw:style-name">gr-thumbnail</xsl:attribute>
					<xsl:attribute name="draw:layer">layout</xsl:attribute>
					<xsl:attribute name="svg:width">14cm</xsl:attribute>
					<xsl:attribute name="svg:height">9.9cm</xsl:attribute>
					<xsl:attribute name="svg:x">3.07cm</xsl:attribute>
					<xsl:attribute name="svg:y">2.257cm</xsl:attribute>
					<xsl:attribute name="draw:page-number">
						<xsl:choose>
							<xsl:when test="name()='slidesinfo'">
								<xsl:value-of select="1"/>
							</xsl:when>
							<xsl:when test="name()='foilgroup'">
								<xsl:value-of select="count(preceding-sibling::node()/foil)+count(preceding-sibling::node())+1"/>
							</xsl:when>
							<xsl:when test="name()='foil'">
								<xsl:value-of select="count(../preceding-sibling::node()/foil)+count(../preceding-sibling::node())+count(preceding-sibling::node())+1"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:element>
				
				<!--<draw:frame presentation:style-name="pr1" draw:text-style-name="P1" draw:layer="layout" svg:width="16.79cm" svg:height="13.365cm" svg:x="2.098cm" svg:y="14.107cm" presentation:class="notes">-->
				<!--count(preceding-sibling::node()) = 0-->
				<xsl:element name="draw:frame">
					<xsl:attribute name="presentation:style-name">pr-speakernotes</xsl:attribute>
					<xsl:attribute name="draw:layer">layout</xsl:attribute>
					<xsl:attribute name="svg:width">16.79cm</xsl:attribute>
					<xsl:attribute name="svg:height">14.12cm</xsl:attribute>
					<xsl:attribute name="svg:x">2.21cm</xsl:attribute>
					<xsl:attribute name="svg:y">12.88cm</xsl:attribute>
					<xsl:element name="draw:text-box">
						
						<xsl:element name="text:p">
							<xsl:attribute name="text:style-name">para-title2</xsl:attribute>
							<xsl:value-of select="title"/>
						</xsl:element>
						<xsl:apply-templates select="speakernotes/*" mode="notes" />
						
					</xsl:element>
				</xsl:element>
				
				
			</presentation:notes>
	
</xsl:template>



</xsl:stylesheet>
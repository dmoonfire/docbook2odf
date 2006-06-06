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
	xmlns:office="http://openoffice.org/2000/office"
	xmlns:style="http://openoffice.org/2000/style"
	xmlns:text="http://openoffice.org/2000/text"
	xmlns:table="http://openoffice.org/2000/table"
	xmlns:draw="http://openoffice.org/2000/drawing"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:meta="http://openoffice.org/2000/meta"
	xmlns:number="http://openoffice.org/2000/datastyle"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:chart="http://openoffice.org/2000/chart"
	xmlns:dr3d="http://openoffice.org/2000/dr3d"
	xmlns:math="http://www.w3.org/1998/Math/MathML"
	xmlns:form="http://openoffice.org/2000/form"
	xmlns:script="http://openoffice.org/2000/script"
	xmlns:config="http://openoffice.org/2001/config"
	office:class="text"
	office:version="1.0">


<xsl:template match="screen">
	
	<xsl:element name="text:p">
		<xsl:attribute name="text:style-name">para-verbatim</xsl:attribute>
		<!--<fo:block white-space-collapse="false" white-space-treatment="preserve">
			<xsl:apply-templates/>
		</fo:block>-->
		
		<xsl:apply-templates/>
		
<!--		
		<draw:rect
			text:anchor-type="paragraph"
			draw:z-index="0"
			draw:style-name="box-verbatim"
			draw:text-style-name="para-verbatim"
			svg:width="15cm"
			svg:height="5cm">
			<text:p text:style-name="Standard"><xsl:apply-templates/></text:p>
		</draw:rect>
-->
		<!--
		<draw:text-box>
			<text:p text:style-name="Standard"><xsl:apply-templates/></text:p>
		</draw:text-box>
		-->
		
	</xsl:element>
<!--
	<fo:block wrap-option='no-wrap'
			text-align="start"
			white-space-collapse='false'
			white-space-treatment='preserve'
			linefeed-treatment='preserve'
			xsl:use-attribute-sets="monospace.verbatim.properties shade.verbatim.style"
  			space-before="0.5cm">
		<xsl:apply-templates/>
	</fo:block>
-->
</xsl:template>












</xsl:stylesheet>
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
	xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
	office:class="text"
	office:version="1.0">

<!--<xsl:variable name="page.number" select="0"/>-->

<xsl:template match="slides">
	
	<xsl:element name="office:presentation">
		
		<!--
		<presentation:footer-decl presentation:name="ftr1">© webcom, s.r.o.</presentation:footer-decl>
		<presentation:date-time-decl presentation:name="dtd1" presentation:source="current-date" style:data-style-name="D3"/>
		-->
		
		
		<xsl:apply-templates/>
		
		<!--
		<draw:page
			draw:name="page1"
			draw:style-name="dp1"
			draw:master-page-name="Východzie"
			presentation:presentation-page-layout-name="AL1T0">
			
			<office:forms form:automatic-focus="false" form:apply-design-mode="false"/>
			
			<draw:frame
				presentation:style-name="pr1"
				draw:layer="layout"
				svg:width="25.199cm"
				svg:height="3.256cm"
				svg:x="1.4cm"
				svg:y="0.962cm"
				presentation:class="title" presentation:placeholder="true">
				<draw:text-box/>
			</draw:frame>
			
			<draw:frame
				presentation:style-name="pr2"
				draw:layer="layout"
				svg:width="25.199cm"
				svg:height="13.609cm"
				svg:x="1.4cm"
				svg:y="5.039cm"
				presentation:class="subtitle" 
				presentation:placeholder="true">
				<draw:text-box/>
			</draw:frame>
			
			<presentation:notes draw:style-name="dp2">
				<draw:page-thumbnail
					draw:style-name="gr1"
					draw:layer="layout"
					svg:width="14.848cm"
					svg:height="11.136cm"
					svg:x="3.07cm"
					svg:y="2.257cm"
					draw:page-number="1"
					presentation:class="page"/>
				<draw:frame
					presentation:style-name="pr3"
					draw:text-style-name="P1"
					draw:layer="layout"
					svg:width="16.79cm"
					svg:height="13.365cm"
					svg:x="2.098cm"
					svg:y="14.107cm"
					presentation:class="notes"
					presentation:placeholder="true">
					<draw:text-box/>
				</draw:frame>	
			</presentation:notes>
			
		</draw:page>
		-->
		
		
	</xsl:element>
	
</xsl:template>


<xsl:template match="slidesinfo">
	<!-- TITLE PAGE -->
	
	<!--<xsl:variable name="page.number" select="{$page.number}+1"/>-->
	
	
	<xsl:element name="draw:page">
		<!-- The draw:name attribute specifies the name of a drawing page. -->
		<!-- This attribute is optional; if it is used, the name must be   -->
		<!-- unique. If it is not used, the application may generate a     -->
		<!-- unique name.                                                  -->
		<xsl:attribute name="draw:name">Titlepage</xsl:attribute>
		<!-- Each drawing page must have one master page assigned to it.   -->
		<!-- The master page:                                              -->
		<!-- - Defines properties such as the size and borders of the      -->
		<!--   drawing page                                                -->
		<!-- - Serves as a container for shapes that are used as a common  -->
		<!--   background                                                  -->
		<!-- The draw:master-page-name attribute specifies the name of the -->
		<!-- master page assigned to the drawing page. This attribute is   -->
		<!-- required.                                                     -->
		<xsl:attribute name="draw:master-page-name">Title</xsl:attribute>
		<!-- If the drawing page was created using a presentation page     -->
		<!-- layout, the attribute                                         -->
		<!-- presentation:presentation-page-layout-name links to the       -->
		<!-- corresponding <style:presentation-page-layout> element.       -->
		<!-- See section 14.15 for information on the presentation page    -->
		<!-- layout element. This attribute is optional.                   -->
	<!-- <xsl:attribute name="presentation:presentation-page-layout-name">AL1T0</xsl:attribute>-->
		<!-- The attribute draw:style-name assigns an additional formatting-->
		<!-- attributes to a drawing page by assigning a drawing page style-->
		<!-- This attribute is optional. The fixed family for page styles  -->
		<!-- is drawing-page.                                              -->
		<!-- For pages inside a presentation document, attributes from     -->
		<!-- Presentation Page Attributes can also be used.                -->
		<xsl:attribute name="draw:style-name">drawing-page-default</xsl:attribute>
		
		
		<xsl:element name="draw:frame">
			<xsl:attribute name="presentation:style-name">pr-default</xsl:attribute>
			<xsl:attribute name="draw:layer">backgroundobjects</xsl:attribute>
			<xsl:attribute name="svg:width">5cm</xsl:attribute>
			<xsl:attribute name="svg:height">1.5cm</xsl:attribute>
			<xsl:attribute name="svg:x">0.5cm</xsl:attribute>
			<xsl:attribute name="svg:y">19.5cm</xsl:attribute>
			<xsl:element name="draw:text-box">
				<xsl:element name="text:p">
					<xsl:attribute name="text:style-name">para-footer</xsl:attribute>
						<text:date style:data-style-name="date-default" text:date-value="2006-05-05"/>
						<!--
						<text:date
							style:data-style-name="N37"
							text:date-value="2006-02-15T21:23:46.99"
							text:fixed="true">
							15.02.06
						</text:date>
						-->
						<!--
						<text:date style:data-style-name="D8" text:date-value="2006-02-15" text:fixed="true">Streda, februára 15. 2006</text:date>
						-->
						
						
				</xsl:element>
			</xsl:element>
			
		</xsl:element>
		
		
		<draw:frame
			presentation:style-name="pr-title"
			draw:layer="layout"
			svg:width="23cm"
			svg:height="5cm"
			svg:x="2.1cm"
			svg:y="2.74cm">
			<draw:text-box>
				<text:p text:style-name="para-title1"><xsl:value-of select="title"/></text:p>
			</draw:text-box>
		</draw:frame>
		
		
		
		<xsl:if test="abstract">
			<draw:frame
				presentation:style-name="pr-default"
				draw:layer="layout"
				svg:width="23cm"
				svg:height="9.5cm"
				svg:x="2.1cm"
				svg:y="9cm">
				<draw:text-box>
					<xsl:for-each select="abstract/para">
						<text:p text:style-name="para-abstract"><xsl:value-of select="."/></text:p>
					</xsl:for-each>
				</draw:text-box>
			</draw:frame>
		</xsl:if>
		
		<xsl:call-template name="speakernotes.render"/>
		
	</xsl:element>
</xsl:template>








<xsl:template match="foilgroup">
	<!-- FOILGROUP -->
	<!--<xsl:variable name="page.number" select="{$page.number}+1"/>-->
	
	<xsl:element name="draw:page">
		<xsl:attribute name="draw:master-page-name">Titlegroup</xsl:attribute>
		<xsl:attribute name="draw:style-name">drawing-page-default</xsl:attribute>
		
		
		<draw:frame
			presentation:style-name="pr-title-foilgroup"
			draw:layer="layout"
			svg:width="23cm"
			svg:height="5.5cm"
			svg:x="3.0cm"
			svg:y="4.0cm">
			<draw:text-box>
				<text:p text:style-name="para-title1">
					<xsl:value-of select="title"/>
				</text:p>
			</draw:text-box>
		</draw:frame>
		
		<xsl:call-template name="speakernotes.render"/>
		
	</xsl:element>
	
	<xsl:apply-templates/>
	
</xsl:template>


<xsl:template match="foil">
	<!-- FOIL -->
	<!--<xsl:variable name="page.number"><xsl:value-of select="$page.number+1"/></xsl:variable>-->
	
	<xsl:element name="draw:page">
		<xsl:attribute name="draw:master-page-name">Foil</xsl:attribute>
		<xsl:attribute name="draw:style-name">drawing-page-default</xsl:attribute>
		
		<draw:frame
			presentation:style-name="pr-title-foil"
			draw:layer="layout"
			svg:width="25.199cm"
			svg:height="4.5cm"
			svg:x="1.4cm"
			svg:y="0.9cm">
			<draw:text-box>
				<text:p text:style-name="para-title1">
					<text:span text:style-name="text-italic">
						<xsl:value-of select="title"/>
					</text:span>
				</text:p>
			</draw:text-box>
		</draw:frame>
		
		
		<xsl:element name="draw:frame">
			<xsl:attribute name="presentation:style-name">pr-foil</xsl:attribute>
			<xsl:attribute name="draw:layer">layout</xsl:attribute>
			<xsl:attribute name="svg:width">26.5cm</xsl:attribute>
			<xsl:attribute name="svg:height">12.5cm</xsl:attribute>
			<xsl:attribute name="svg:x">2.0cm</xsl:attribute>
			<xsl:attribute name="svg:y">6.0cm</xsl:attribute>
			<xsl:element name="draw:text-box">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:element>
		
		
		<xsl:call-template name="speakernotes.render"/>
		
		
	</xsl:element>
	
</xsl:template>


<xsl:template match="foil/title"/>



</xsl:stylesheet>
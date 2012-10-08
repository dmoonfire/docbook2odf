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
	




<xsl:template name="document-styles.office-styles">
	
	<xsl:call-template name="document-styles.office-styles.graphic"/>
	<xsl:call-template name="document-styles.office-styles.paragraph"/>
	<xsl:call-template name="document-styles.office-styles.heading"/>
	<xsl:call-template name="document-styles.office-styles.title"/>
	<xsl:call-template name="document-styles.office-styles.text"/>
	
<!-- default table styles -->
	<style:default-style style:family="table">
		<style:table-properties table:border-model="separating"/>
	</style:default-style>
	
	<style:default-style style:family="table-row">
		<style:table-row-properties fo:keep-together="auto"/>
	</style:default-style>
	
	<!-- The element <style:presentation-page-layout> is a container for -->
	<!-- placeholders, which define a set of empty presentation objects, -->
	<!-- for example, a title or outline. These placeholders are used as -->
	<!-- templates for creating new presentation objects and to mark the -->
	<!-- size and position of an object if the presentation page layout  -->
	<!-- of a drawing page is changed.                                   -->
	<!-- *************************************************************** -->
	<!-- Also not important for automatic creation of presentation       -->

	<!--
	<style:presentation-page-layout style:name="AL0T26">
		<presentation:placeholder presentation:object="handout" svg:x="2.058cm" svg:y="1.743cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="10.962cm" svg:y="1.743cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="19.866cm" svg:y="1.743cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="2.058cm" svg:y="3.612cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="10.962cm" svg:y="3.612cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="19.866cm" svg:y="3.612cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="2.058cm" svg:y="5.481cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="10.962cm" svg:y="5.481cm" svg:width="6.104cm" svg:height="-0.233cm"/>
		<presentation:placeholder presentation:object="handout" svg:x="19.866cm" svg:y="5.481cm" svg:width="6.104cm" svg:height="-0.233cm"/>
	</style:presentation-page-layout>
	<style:presentation-page-layout style:name="AL1T0">
		<presentation:placeholder presentation:object="title" svg:x="2.058cm" svg:y="1.743cm" svg:width="23.912cm" svg:height="3.507cm"/>
		<presentation:placeholder presentation:object="subtitle" svg:x="2.058cm" svg:y="5.838cm" svg:width="23.912cm" svg:height="13.23cm"/>
	</style:presentation-page-layout>
	-->
	
	
<!-- numbering1 -->
		<style:style
			style:name="numbering1"
			style:display-name="Number Symbols"
			style:family="text">
			<style:text-properties
				fo:font-weight="bold">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="style:font-name">
					<xsl:value-of select="$style.font-name.bold"/>
				</xsl:attribute>
			</style:text-properties>
		</style:style>
		
<!-- bullet1 -->
		<style:style style:name="bullet1"
			style:display-name="Bullet Symbols"
			style:family="text">
			<style:text-properties
				fo:font-weight="bold">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="style:font-name">
					<xsl:value-of select="$style.font-name.bold"/>
				</xsl:attribute>
			</style:text-properties>
		</style:style>
		
<!-- dash-ultrafine -->
		<draw:stroke-dash
			draw:name="dash-ultrafine"
			draw:display-name="Ultrafine Dashed"
			draw:style="rect"
			draw:dots1="1"
			draw:dots1-length="0.051cm"
			draw:dots2="1"
			draw:dots2-length="0.051cm"
			draw:distance="0.051cm"/>
			
			
		<style:style
			style:name="Index"
			style:family="paragraph"
			style:parent-style-name="Standard"
			style:class="index">
			<style:paragraph-properties
				text:number-lines="false"
				text:line-number="0"/>
		</style:style>
		
<!--
		<style:style
			style:name="page"
			style:family="paragraph"
			style:class="text">
			<style:paragraph-properties
				fo:break-before="page">
				<xsl:attribute name="fo:border-top">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:paragraph-properties>
		</style:style>
-->
<!--
		<style:style
			style:name="Heading-TOC"
			style:display-name="Contents Heading"
			style:family="paragraph"
			style:parent-style-name="Title"
			style:class="index">
			<style:paragraph-properties
				fo:break-before="page"
				fo:margin-left="0cm"
				fo:margin-right="0cm"
				fo:text-indent="0cm"
				style:auto-text-indent="false"
				text:number-lines="true"
				text:line-number="1">
			</style:paragraph-properties>
			<style:text-properties
				xsl:use-attribute-sets="heading.text-properties"
				fo:font-size="200%"/>
		</style:style>
-->
		
<!-- SECTION AND CHAPTER HEADINGS -->
		
		
		
		<text:list-style
			style:name="listH"
			style:display-name="List Headings">
			<text:list-level-style-number
				text:level="1"
				text:style-name="numbering1"
				style:num-suffix="."
				style:num-format="1">
				<style:list-level-properties
					text:min-label-distance="0.3cm"/>
			</text:list-level-style-number>
			<text:list-level-style-number
				text:level="2"
				text:style-name="numbering1"
				style:num-suffix="."
				style:num-format="1"
				text:display-levels="2">
				<style:list-level-properties 
					text:min-label-distance="0.3cm"/>
			</text:list-level-style-number>
			<text:list-level-style-number
				text:level="3"
				text:style-name="numbering1"
				style:num-suffix="."
				style:num-format="1"
				text:display-levels="3">
				<style:list-level-properties 
					text:min-label-distance="0.3cm"/>
			</text:list-level-style-number>
			<text:list-level-style-number
				text:level="4"
				text:style-name="numbering1"
				style:num-suffix="."
				style:num-format="1"
				text:display-levels="4">
				<style:list-level-properties 
					text:min-label-distance="0.3cm"/>
			</text:list-level-style-number>
		</text:list-style>
		
		<!-- tomuto este nerozumiem -->
			
		<text:notes-configuration
			text:note-class="footnote"
			style:num-format="1"
			text:start-value="0"
			text:footnotes-position="page"
			text:start-numbering-at="document"/>
		<text:notes-configuration
			text:note-class="endnote"
			style:num-format="i"
			text:start-value="0"/>
		<text:linenumbering-configuration
			text:number-lines="false"
			text:offset="0.499cm"
			style:num-format="1"
			text:number-position="left"
			text:increment="5"/>
		
		<xsl:if test="/slides">
		
		</xsl:if>
		
	<xsl:call-template name="CI.document-styles.office-styles"/>
	
</xsl:template>


<xsl:template name="document-styles.office-styles.graphic">

	<style:default-style
		style:family="graphic">
		<style:graphic-properties
			draw:shadow-offset-x="0.3cm"
			draw:shadow-offset-y="0.3cm"
			draw:start-line-spacing-horizontal="0.283cm"
			draw:start-line-spacing-vertical="0.283cm"
			draw:end-line-spacing-horizontal="0.283cm"
			draw:end-line-spacing-vertical="0.283cm"
			style:flow-with-text="true"/>
		<style:paragraph-properties
			style:text-autospace="ideograph-alpha"
			style:line-break="strict"
			style:writing-mode="lr-tb" style:font-independent-line-spacing="false">
			<style:tab-stops/>
		</style:paragraph-properties>
		<style:text-properties
			fo:color="#000000"
			style:font-name="F"
			fo:font-size="11pt"
			fo:language="sk"
			fo:country="SK"
			style:font-name-asian="F"
			style:font-size-asian="12pt"
			style:language-asian="en"
			style:country-asian="US"
			style:font-name-complex="F"
			style:font-size-complex="12pt"
			style:language-complex="en"
			style:country-complex="US"/>
	</style:default-style>
	
	<style:style
		style:name="Graphics"
		style:family="graphic">
		<style:graphic-properties
			text:anchor-type="paragraph"
			svg:x="0cm"
			svg:y="0cm"
			style:wrap="dynamic"
			style:number-wrapped-paragraphs="no-limit"
			style:wrap-contour="false"
			style:vertical-pos="top"
			style:vertical-rel="paragraph"
			style:horizontal-pos="center"
			style:horizontal-rel="paragraph"/>
	</style:style>

</xsl:template>


<xsl:template name="document-styles.office-styles.paragraph">
	
<!-- STANDARD -->
	<style:default-style
		style:family="paragraph">
		<style:paragraph-properties
			style:text-autospace="ideograph-alpha"
			style:punctuation-wrap="hanging"
			style:line-break="strict"
			style:writing-mode="page">
			<xsl:attribute name="fo:text-align"><xsl:value-of select="$para.text-align"/></xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.default"/></xsl:attribute>
			<xsl:attribute name="fo:color"><xsl:value-of select="$style.font-color"/></xsl:attribute>
			<xsl:attribute name="style:font-name"><xsl:value-of select="$style.font-name"/></xsl:attribute>
		</style:text-properties>
	</style:default-style>
	
<!-- PARENT STYLES -->
	
	<style:style
		style:name="Standard"
		style:family="paragraph"
		style:display-name="Paragraph Default">
		<style:paragraph-properties/>
		<style:text-properties/>
	</style:style>
	
	<style:style
		style:name="Verbatim"
		style:family="paragraph"
		style:display-name="Paragraph Verbatim">
		<style:paragraph-properties
			fo:text-indent="0.3cm"
			fo:background-color="#E0E0E0"
			style:shadow="none">
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="10pt"
			style:font-name="Courier"/>
	</style:style>
	
	
<!-- END-USER STYLES -->
	
	<style:style
		style:name="Paragraph"
		style:display-name="Paragraph"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties/>
		<style:text-properties>
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</style:text-properties>
	</style:style>
	
<!-- para-padding -->
	<style:style
		style:name="Paragraph_20_Padding"
		style:display-name="Paragraph Padding"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</style:text-properties>
	</style:style>
	
<!-- para-padding-odd -->
	<style:style
		style:name="Paragraph_20_Padding_20_Odd"
		style:display-name="Paragraph Padding Odd"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
			<xsl:attribute name="fo:margin-left"><xsl:value-of select="$para.padding.odd.left"/></xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</style:text-properties>
	</style:style>
	
<!-- <docbook:screen> -->
	<style:style
		style:name="para-screen"
		style:display-name="Paragraph Screen"
		style:family="paragraph"
		style:parent-style-name="Verbatim"
		style:next-style-name="para-screen">
		<style:paragraph-properties
			fo:padding-top="0.20cm"
			fo:padding-bottom="0.20cm"
			fo:border-top="0.002cm solid #000000"
			fo:border-bottom="0.002cm solid #000000"/>
		<style:text-properties
			style:font-name="Lucida Console"/>
	</style:style>
	
<!-- <docbook:programlisting> -->
	<style:style
		style:name="para-programlisting"
		style:display-name="Paragraph Programlisting"
		style:family="paragraph"
		style:parent-style-name="Verbatim"
		style:next-style-name="para-programlisting">
		<style:paragraph-properties
			fo:padding-top="0.20cm"
			fo:padding-bottom="0.20cm"
			fo:border-left="0.2cm solid #000000"/>
		<style:text-properties/>
	</style:style>
	
<!-- <docbook:synopsis> -->
	<style:style
		style:name="para-synopsis"
		style:display-name="Paragraph Synopsis"
		style:family="paragraph"
		style:parent-style-name="Verbatim"
		style:next-style-name="para-synopsis">
		<style:paragraph-properties
			fo:padding-top="0.20cm"
			fo:padding-bottom="0.20cm"
			fo:background-color=""
			fo:border-left="0.2cm solid #000000"/>
		<style:text-properties/>
	</style:style>
	
<!-- justify -->
	<style:style
		style:name="para-justify"
		style:display-name="Paragraph Justify"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:text-align="justify"
			style:text-autospace="ideograph-alpha"
			style:punctuation-wrap="hanging"
			style:line-break="strict"
			style:writing-mode="page"/>
	</style:style>
		
	<style:style
		style:name="Paragraph_20_BlockQuote"
		style:display-name="Paragraph BlockQuote"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:margin-left="1.2cm"
			fo:margin-right="0cm"
			fo:text-indent="0cm"
			style:auto-text-indent="false"
			fo:padding-left="0.15cm"
			fo:padding-right="0.049cm"
			fo:padding-top="0.049cm"
			fo:padding-bottom="0.049cm"
			fo:border-left="0.176cm solid #999999"
			fo:border-right="none"
			fo:border-top="none"
			fo:border-bottom="none"
			style:shadow="none"
			fo:margin-bottom="0.3cm"/>
		<style:text-properties
			fo:font-style="italic"/>
	</style:style>
	
	<style:style
		style:name="Paragraph_20_Epigraph"
		style:display-name="Paragraph Epigraph"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:margin-left="1.2cm"
			fo:margin-right="0cm"
			fo:text-indent="0cm"
			style:auto-text-indent="false"
			fo:padding-left="0.15cm"
			fo:padding-right="0.049cm"
			fo:padding-top="0.049cm"
			fo:padding-bottom="0.049cm"
			fo:border-left="0.176cm solid #999999"
			fo:border-right="none"
			fo:border-top="none"
			fo:border-bottom="none"
			style:shadow="none"
			fo:margin-bottom="0.3cm"/>
		<style:text-properties
			fo:font-style="italic"/>
	</style:style>
	
	<style:style
		style:name="Paragraph_20_Attribution"
		style:display-name="Paragraph Attribution"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:margin-left="1.2cm"
			fo:margin-right="0cm"
			fo:text-indent="0cm"
			style:auto-text-indent="false"
			fo:padding-left="0.15cm"
			fo:padding-right="0.049cm"
			fo:padding-top="0.049cm"
			fo:padding-bottom="0.049cm"
			fo:border-left="0.176cm solid #999999"
			fo:border-right="none"
			fo:border-top="none"
			fo:border-bottom="none"
			style:shadow="none"
			fo:margin-bottom="0.3cm"/>
		<style:text-properties
			fo:font-style="italic"/>
	</style:style>

<!-- para-term -->
	<style:style
		style:name="Paragraph_20_Term"
		style:display-name="Paragraph Term"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:keep-with-next="always">
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties
			fo:font-weight="bold"/>
	</style:style>
	
<!-- para-sidebar -->
	<style:style
		style:name="para-sidebar"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			
		/>
		<style:text-properties/>
	</style:style>
	
</xsl:template>


<xsl:template name="document-styles.office-styles.heading">
	
<!-- PARENT STYLES -->
	
	<style:style
		style:name="Heading"
		style:parent-style-name="Standard"
		style:family="paragraph">
		<style:paragraph-properties
			style:shadow="none"
			fo:keep-with-next="always"
			text:number-lines="true"/>
		<style:text-properties
			fo:font-weight="bold">
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$CI.style.color"/>
			</xsl:attribute>
			<xsl:attribute name="style:font-name">
				<xsl:value-of select="$style.font-name.bold"/>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
<!-- END-USER STYLES -->
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="Heading"
		style:class="text"
		style:next-style-name="Paragraph"
		style:name="Heading_20_1"
		style:display-name="Heading 1"
		style:list-style-name="listH"
		style:default-outline-level="1">
		<style:paragraph-properties
			text:line-number="1">
			<xsl:attribute name="fo:margin-top">0.6cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:if test="/chapter">
				<xsl:attribute name="fo:break-before">page</xsl:attribute>
			</xsl:if>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size">
				<xsl:choose>
					<xsl:when test="/article">140%</xsl:when>
					<xsl:when test="/chapter">175%</xsl:when>
					<xsl:otherwise>200%</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="Heading"
		style:class="text"
		style:name="Heading_20_2"
		style:display-name="Heading 2"
		style:default-outline-level="2">
		<style:paragraph-properties
			text:line-number="2">
			<xsl:attribute name="fo:margin-top">
				<xsl:choose>
					<xsl:when test="/article">1.3cm</xsl:when>
					<xsl:when test="/chapter">1.1cm</xsl:when>
					<xsl:otherwise>0.6cm</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:if test="/book">
				<xsl:attribute name="fo:break-before">page</xsl:attribute>
			</xsl:if>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size">
				<xsl:choose>
					<xsl:when test="/article">120%</xsl:when>
					<xsl:when test="/chapter">140%</xsl:when>
					<xsl:otherwise>175%</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="heading"
		style:class="text"
		style:name="Heading3"
		style:list-style-name="listH"
		style:display-name="Heading 3"
		style:default-outline-level="3">
		<style:paragraph-properties
			text:line-number="3">
			<xsl:choose>
				<xsl:when test="/book">
					<xsl:attribute name="fo:margin-top">1.2cm</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="fo:margin-top">0.6cm</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size">
				<xsl:choose>
					<xsl:when test="/article|/chapter">110%</xsl:when>
					<xsl:otherwise>150%</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="heading"
		style:class="text"
		style:name="Heading4"
		style:list-style-name="listH"
		style:display-name="Heading 4"
		style:default-outline-level="4">
		<style:paragraph-properties
			text:line-number="4">
			<xsl:attribute name="fo:margin-top">0.6cm</xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size">
				<xsl:choose>
					<xsl:when test="/article|/chapter">100%</xsl:when>
					<xsl:otherwise>125%</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="heading"
		style:class="text"
		style:name="Headings"
		style:list-style-name="listH"
		style:display-name="Headings"
		style:default-outline-level="5">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties>
			<xsl:attribute name="fo:font-size">
				<xsl:choose>
					<xsl:when test="/article|/chapter">100%</xsl:when>
					<xsl:otherwise>100%</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	
<!-- OTHER HEADINGS -->
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="heading"
		style:class="text"
		style:name="Heading_20_Small"
		style:display-name="Heading Small">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="100%">
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$CI.style.color.sub"/>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="heading"
		style:class="text"
		style:name="Paragraph_20_Heading"
		style:display-name="Paragraph Heading">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top">0.35cm</xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties
			fo:font-weight="bold"
			fo:font-size="100%">
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$CI.style.color.sub"/>
			</xsl:attribute>
			<xsl:attribute name="style:font-name">
				<xsl:value-of select="$style.font-name.bold"/>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	<style:style
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		style:name="para-title"
		style:display-name="Paragraph Title">
		<style:paragraph-properties>
			<xsl:attribute name="fo:margin-top">0.35cm</xsl:attribute>
		</style:paragraph-properties>
		<style:text-properties
			fo:font-weight="bold"
			fo:font-size="100%">
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$CI.style.color"/>
			</xsl:attribute>
			<xsl:attribute name="style:font-name">
				<xsl:value-of select="$style.font-name.bold"/>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
	
</xsl:template>


<xsl:template name="document-styles.office-styles.title">
	
<!-- PARENT STYLES -->
	
	<style:style
		style:name="Title_20_Default"
		style:family="paragraph"
		style:display-name="Title Default">
		<style:paragraph-properties
			style:shadow="none"/>
		<style:text-properties
			fo:font-weight="bold">
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$CI.style.color"/>
			</xsl:attribute>
			<xsl:attribute name="style:font-name">
				<xsl:value-of select="$style.font-name.bold"/>
			</xsl:attribute>
		</style:text-properties>
	</style:style>
	
<!-- END-USER STYLES -->
	
	<!-- title-book -->
	<style:style
		style:name="Title_20_Book"
		style:family="paragraph"
		style:parent-style-name="Title_20_Default"
		style:next-style-name="para-padding"
		style:display-name="Title Book">
		<style:paragraph-properties
			fo:padding-top="0.6cm">
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="300%">
		</style:text-properties>
	</style:style>
		
	<!-- title-chapter -->
	<style:style
		style:name="Title_20_Chapter"
		style:family="paragraph"
		style:parent-style-name="title"
		style:next-style-name="Paragraph_20_Padding"
		style:display-name="Title Chapter">
		<style:paragraph-properties
			fo:padding-top="0.6cm"
			fo:break-before="page">
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="300%">
		</style:text-properties>
	</style:style>
		
	<!-- title-article -->
	<style:style
		style:name="Title_20_Article"
		style:family="paragraph"
		style:parent-style-name="title"
		style:next-style-name="para-padding"
		style:display-name="Title Article">
		<style:paragraph-properties
			fo:padding-top="0.6cm">
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="160%">
		</style:text-properties>
	</style:style>
	
	<!-- title-bibliography -->
	<style:style
		style:name="title-bibliography"
		style:family="paragraph"
		style:parent-style-name="title"
		style:next-style-name="para-padding"
		style:display-name="Title Bibliography">
		<style:paragraph-properties
			fo:padding-top="0.6cm">
		</style:paragraph-properties>
		<style:text-properties
			fo:font-size="300%">
		</style:text-properties>
	</style:style>
	
</xsl:template>





<xsl:template name="document-styles.office-styles.text">

<!-- strong -->
	<style:style
		style:name="Text_20_Strong"
		style:display-name="Text Strong"
		style:family="text">
		<style:text-properties
			fo:font-weight="bold"
			fo:font-style="italic"/>
	</style:style>
	
<!-- bold -->
	<style:style
		style:name="Text_20_Bold"
		style:display-name="Text Bold"
		style:family="text">
		<style:text-properties
			fo:font-weight="bold"/>
	</style:style>
	
<!-- italic -->
	<style:style
		style:name="Text_20_Italic"
		style:display-name="Text Italic"
		style:family="text">
		<style:text-properties
			fo:font-style="italic"/>
	</style:style>
	
<!-- underline -->
	<style:style
		style:name="Text_20_Underline"
		style:display-name="Text Underline"
		style:family="text">
		<style:text-properties
			style:text-underline-color="#000000"
			style:text-underline-mode="continuous"
			style:text-underline-type="single"/>
	</style:style>
	
<!-- strikethrough -->
	<style:style
		style:name="Text_20_Strikethrough"
		style:display-name="Text Strikethrough"
		style:family="text">
		<style:text-properties
			style:text-line-through-style="solid"/>
	</style:style>
	
<!-- highlight -->
	<style:style
		style:name="Text_20_Highlight"
		style:display-name="Text Highlight"
		style:family="text">
		<style:text-properties
			fo:background-color="#ffff00"/>
	</style:style>
	
<!-- monospace -->
	<style:style
		style:name="Text_20_Monospace"
		style:display-name="Text Monospace"
		style:family="text">
		<style:text-properties
			fo:font-family="Courier"/>
	</style:style>
	
<!-- superscript -->
	<style:style
		style:name="Text_20_Super"
		style:display-name="Text Superscript"
		style:family="text">
		<style:text-properties style:text-position="super 58%" />
	</style:style>
	
<!-- subscript -->
	<style:style
		style:name="Text_20_Sub"
		style:display-name="Text Subscript"
		style:family="text">
		<style:text-properties style:text-position="sub 58%" />
	</style:style>
	
<!-- command -->
	<style:style
		style:name="Text_20_Command"
		style:display-name="Text Command"
		style:family="text">
		<style:text-properties
			fo:font-family="Courier"
			fo:font-weight="bold"
			fo:background-color="#f0f0f0"/>
	</style:style>
	
</xsl:template>

</xsl:stylesheet>
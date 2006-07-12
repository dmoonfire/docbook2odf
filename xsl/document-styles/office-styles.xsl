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
	
<!-- paragraph Standard -->
	<xsl:element name="style:default-style">
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:name">Standard</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<xsl:attribute name="fo:text-align">left</xsl:attribute>
			<xsl:attribute name="style:text-autospace">ideograph-alpha</xsl:attribute>
			<xsl:attribute name="style:punctuation-wrap">hanging</xsl:attribute>
			<xsl:attribute name="style:line-break">strict</xsl:attribute>
			<xsl:attribute name="style:writing-mode">page</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:attribute name="fo:font-size">
				<xsl:value-of select="$style.font-size.default"/>
			</xsl:attribute>
			<xsl:attribute name="fo:color">
				<xsl:value-of select="$style.font-color"/>
			</xsl:attribute>
			<xsl:attribute name="style:font-name">
				<xsl:value-of select="$style.font-name"/>
			</xsl:attribute>
		</xsl:element>
	</xsl:element>
	
<!-- paragraph line -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:name">line</xsl:attribute>
		<xsl:attribute name="style:class">text</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<xsl:attribute name="fo:border-top">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
		</xsl:element>
	</xsl:element>
	
	
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
		
<!-- SECTION HEADINGS -->
		<xsl:element name="style:style"
			use-attribute-sets="heading.style-properties">
			<xsl:attribute name="style:name">Heading1</xsl:attribute>
			<xsl:attribute name="style:display-name">Heading 1</xsl:attribute>
			<xsl:attribute name="style:default-outline-level">1</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-1.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-1.text-properties"/>
		</xsl:element>
		<xsl:element name="style:style"
			use-attribute-sets="heading.style-properties">
			<xsl:attribute name="style:name">Heading2</xsl:attribute>
			<xsl:attribute name="style:display-name">Heading 2</xsl:attribute>
			<xsl:attribute name="style:default-outline-level">2</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-2.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-2.text-properties"/>
		</xsl:element>
		<xsl:element name="style:style"
			use-attribute-sets="heading.style-properties">
			<xsl:attribute name="style:name">Heading3</xsl:attribute>
			<xsl:attribute name="style:display-name">Heading 3</xsl:attribute>
			<xsl:attribute name="style:default-outline-level">3</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-3.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-3.text-properties"/>
		</xsl:element>
		<xsl:element name="style:style"
			use-attribute-sets="heading.style-properties">
			<xsl:attribute name="style:name">Heading4</xsl:attribute>
			<xsl:attribute name="style:display-name">Heading 4</xsl:attribute>
			<xsl:attribute name="style:default-outline-level">4</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-4.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-4.text-properties"/>
		</xsl:element>
		<xsl:element name="style:style"
			use-attribute-sets="heading.style-properties">
			<xsl:attribute name="style:name">Headings</xsl:attribute>
			<xsl:attribute name="style:display-name">Headings</xsl:attribute>
			<xsl:attribute name="style:default-outline-level">5</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-s.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-s.text-properties"/>
		</xsl:element>
		
		<xsl:element name="style:style"
			use-attribute-sets="heading-small.style-properties">
			<xsl:attribute name="style:name">Headings-small</xsl:attribute>
			<xsl:attribute name="style:display-name">Small Headings</xsl:attribute>
			<xsl:element name="style:paragraph-properties"
				use-attribute-sets="heading.paragraph-properties heading.level-s.paragraph-properties"/>
			<xsl:element name="style:text-properties"
				use-attribute-sets="heading.text-properties heading.level-s.text-properties"/>
		</xsl:element>
		
		
		<text:list-style style:name="listH">
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
			
			
		<!--	
		<style:style
			style:name="Footer"
			style:family="paragraph"
			style:parent-style-name="Standard"
			style:class="extra">
			<style:paragraph-properties
				text:number-lines="false"
				text:line-number="0">
			<style:tab-stops>
				<style:tab-stop
					style:position="8.498cm"
					style:type="center"/>
				<style:tab-stop
					style:position="16.999cm" 
					style:type="right"/>
				</style:tab-stops>
			</style:paragraph-properties>
		</style:style>
		-->
		
		
		
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
	
	
	
</xsl:template>




</xsl:stylesheet>
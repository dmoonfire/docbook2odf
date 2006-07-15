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
	


<xsl:template name="document-content.automatic-styles.paragraph">
	
<!-- para-padding -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">para-padding</xsl:attribute>
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<!--<xsl:attribute name="fo:text-align">justify</xsl:attribute>-->
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:element>
	
<!-- para-list-padding -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">para-list-padding</xsl:attribute>
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<!--<xsl:attribute name="fo:text-align">justify</xsl:attribute>-->
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:attribute name="text:enable-numbering">true</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:element>
	
<!-- para-list-begin -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">para-list-begin</xsl:attribute>
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
		<xsl:attribute name="style:list-style-name">list1</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<!--<xsl:attribute name="fo:text-align">justify</xsl:attribute>-->
			<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:attribute name="text:enable-numbering">true</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:element>
	
<!-- para-list-compact -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">para-list-compact</xsl:attribute>
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
		<xsl:attribute name="style:list-style-name">list1</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<!--<xsl:attribute name="fo:text-align">justify</xsl:attribute>-->
			<xsl:attribute name="fo:margin-top">0.0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:attribute name="text:enable-numbering">true</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:if test="/slides">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_para"/></xsl:attribute>
				<xsl:attribute name="fo:font-size"><xsl:value-of select="$style.font-size.presentation.para"/></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:element>
	
<!-- para-element (for not supported elements) -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">para-element</xsl:attribute>
		<xsl:attribute name="style:family">paragraph</xsl:attribute>
		<xsl:element name="style:paragraph-properties">
			<xsl:attribute name="fo:margin-top">0.0cm</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
		</xsl:element>
		<xsl:element name="style:text-properties">
			<xsl:attribute name="fo:color">#FFFFFF</xsl:attribute>
			<xsl:attribute name="fo:background-color">#AEAEAE</xsl:attribute>
			<xsl:attribute name="fo:font-size">10pt</xsl:attribute>
			<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			<xsl:attribute name="fo:font-weight">normal</xsl:attribute>
		</xsl:element>
	</xsl:element>
	
	<xsl:if test="/article">
	
	<!-- para-title1 (for /article/title) -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title1</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.4cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">28pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	<!-- para-title2 (for /article/subtitle) -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title2</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">20pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
			</xsl:element>
		</xsl:element>
	
	</xsl:if>
	<xsl:if test="/slides">
	
	
	<!-- para-title1 (for /slides/*/title) -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title1</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">40pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<!--<xsl:attribute name="fo:font-weight">bold</xsl:attribute>-->
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title2</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">20pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<!--<xsl:attribute name="fo:font-weight">bold</xsl:attribute>-->
			</xsl:element>
		</xsl:element>
		
	<!-- para-abstract (for /slides/) -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-abstract</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.2cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_abstract"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">25pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<!--<xsl:attribute name="fo:font-weight">bold</xsl:attribute>-->
			</xsl:element>
		</xsl:element>
	
	<!-- para-footer -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-footer</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:color">#FFFFFF</xsl:attribute>
				<xsl:attribute name="fo:font-size">14pt</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	<!-- para-notes -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-notes</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top"><xsl:value-of select="$para.padding"/></xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color-presentation_abstract"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">12pt</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	</xsl:if>
	
	<style:style
		style:name="para-justify"
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
		style:name="para-blockquote"
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
	
	<!-- problem with whitespaces :( -->
	<style:style
		style:name="para-verbatim"
		style:family="paragraph"
		style:parent-style-name="Standard">
		<style:paragraph-properties
			fo:background-color="#E0E0E0"
			fo:margin-top="0.1cm"
			fo:margin-bottom="0.2cm"
			fo:padding-left="0.1cm"
			fo:padding-top="0.1cm"
			fo:padding-bottom="0.1cm"
			fo:border-left="none"
			fo:border-right="none"
			fo:border-top="0.02cm solid #999999"
			fo:border-bottom="0.02cm solid #999999"
			/>
		<style:text-properties
			fo:font-size="10pt"
			style:font-name="Lucidasans"/>
	</style:style>
	
</xsl:template>




<xsl:template name="document-content.automatic-styles.text">
	
	
<!-- bold -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">text-bold</xsl:attribute>
		<xsl:attribute name="style:family">text</xsl:attribute>
		<xsl:element name="style:text-properties">
			<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
		</xsl:element>
	</xsl:element>
	
<!-- monospace -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">text-monospace</xsl:attribute>
		<xsl:attribute name="style:family">text</xsl:attribute>
		<xsl:element name="style:text-properties">
			<xsl:attribute name="fo:font-family">Courier</xsl:attribute>
			<!--<xsl:attribute name="fo:background-color">#FFFF00</xsl:attribute>-->
		</xsl:element>
	</xsl:element>
	
	<style:style
		style:name="text-highlight"
		style:family="text">
		<style:text-properties
			fo:background-color="#ffff00"/>
	</style:style>
	
	<style:style
		style:name="text-email"
		style:family="text">
		<style:text-properties
			fo:color="#0000ff"/>
	</style:style>
	
	<style:style
		style:name="text-italic"
		style:family="text">
		<style:text-properties
			fo:font-style="italic"/>
	</style:style>
	
<!-- SLIDES -->
	<xsl:if test="/slides">
	
	
	</xsl:if>
	
	
</xsl:template>


<xsl:template name="document-content.automatic-styles.list">
	<!-- lists -->
	
	
	<text:list-style style:name="list-default">
		<text:list-level-style-bullet
			text:level="1"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-width="0.5cm"/>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="style:font-name">StarSymbol</xsl:attribute>
				<xsl:attribute name="fo:font-size">200%</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</xsl:element>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="2"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="1.0cm"
				text:min-label-width="0.5cm"/>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="style:font-name">StarSymbol</xsl:attribute>
				<xsl:attribute name="fo:font-size">200%</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</xsl:element>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="3"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="1.5cm"
				text:min-label-width="0.5cm"/>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="style:font-name">StarSymbol</xsl:attribute>
				<xsl:attribute name="fo:font-size">200%</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</xsl:element>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="4"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="2.0cm"
				text:min-label-width="0.5cm"/>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="style:font-name">StarSymbol</xsl:attribute>
				<xsl:attribute name="fo:font-size">200%</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</xsl:element>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="5"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="2.5cm"
				text:min-label-width="0.5cm"/>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="style:font-name">StarSymbol</xsl:attribute>
				<xsl:attribute name="fo:font-size">200%</xsl:attribute>
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</xsl:element>
		</text:list-level-style-bullet>
	</text:list-style>
	
	
	<text:list-style style:name="list-arabic">
		<text:list-level-style-number
			text:level="1"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-distance="0.3cm"/>
			<style:text-properties
				style:use-window-font-color="true"
				fo:font-size="100%"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="2"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="3"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="4"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="5"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
	</text:list-style>
	
	<text:list-style style:name="list-loweralpha">
		<text:list-level-style-number
			text:level="1"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="2"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="3"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="4"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="5"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
	</text:list-style>
	
	
	<text:list-style style:name="list-lowerroman">
		<text:list-level-style-number
			text:level="1"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="2"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="3"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="4"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="5"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
	</text:list-style>
	
	
	<text:list-style style:name="list-upperalpha">
		<text:list-level-style-number
			text:level="1"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="2"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="3"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="4"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="5"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
	</text:list-style>
	
	<text:list-style style:name="list-upperroman">
		<text:list-level-style-number
			text:level="1"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I">
			<style:list-level-properties
				text:space-before="0.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="2"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="3"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="1.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="4"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.0cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
		<text:list-level-style-number
			text:level="5"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="2.5cm"
				text:min-label-distance="0.3cm"/>
		</text:list-level-style-number>
	</text:list-style>
	
	
	
	
</xsl:template>




<xsl:template name="document-content.automatic-styles.graphic">


<!-- graphic imageobject -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">imageobject</xsl:attribute>
		<xsl:attribute name="style:family">graphic</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Graphics</xsl:attribute>
		<xsl:element name="style:graphic-properties">
			<xsl:attribute name="style:run-through">foreground</xsl:attribute>
			<xsl:attribute name="style:wrap">none</xsl:attribute>
			<xsl:attribute name="style:vertical-pos">from-top</xsl:attribute>
			<xsl:attribute name="style:vertical-rel">paragraph</xsl:attribute>
			<xsl:attribute name="style:horizontal-pos">center</xsl:attribute>
			<xsl:attribute name="style:horizontal-rel">paragraph</xsl:attribute>
			<xsl:attribute name="fo:background-color">transparent</xsl:attribute>
			<xsl:attribute name="fo:border">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
			<!--fo:padding="0.049cm" fo:border="0.002cm solid #000000"-->
			<xsl:attribute name="style:background-transparency">100%</xsl:attribute>
			<xsl:attribute name="style:shadow">none</xsl:attribute>
			<xsl:attribute name="style:mirror">none</xsl:attribute>
			<xsl:attribute name="fo:clip">rect(0cm 0cm 0cm 0cm)</xsl:attribute>
			<xsl:attribute name="draw:luminance">0%</xsl:attribute>
			<xsl:attribute name="draw:contrast">0%</xsl:attribute>
			<xsl:attribute name="draw:red">0%</xsl:attribute>
			<xsl:attribute name="draw:green">0%</xsl:attribute>
			<xsl:attribute name="draw:blue">0%</xsl:attribute>
			<xsl:attribute name="draw:gamma">100%</xsl:attribute>
			<xsl:attribute name="draw:color-inversion">false</xsl:attribute>
			<xsl:attribute name="draw:image-opacity">100%</xsl:attribute>
			<xsl:attribute name="draw:color-mode">standard</xsl:attribute>
			<xsl:element name="style:background-image"/>
		</xsl:element>
	</xsl:element>

<!-- graphic imageobject-inline -->
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">imageobject-inline</xsl:attribute>
		<xsl:attribute name="style:family">graphic</xsl:attribute>
		<xsl:attribute name="style:parent-style-name">Graphics</xsl:attribute>
		<xsl:element name="style:graphic-properties">
			<xsl:attribute name="style:vertical-pos">from-top</xsl:attribute>
			<xsl:attribute name="style:vertical-rel">paragraph</xsl:attribute>
			<xsl:attribute name="style:horizontal-pos">left</xsl:attribute>
			<xsl:attribute name="style:horizontal-rel">paragraph</xsl:attribute>
			<xsl:attribute name="fo:background-color">transparent</xsl:attribute>
			<xsl:attribute name="fo:border">0.002cm solid <xsl:value-of select="$CI.style.color"/></xsl:attribute>
			<xsl:attribute name="style:background-transparency">100%</xsl:attribute>
			<xsl:attribute name="style:shadow">none</xsl:attribute>
			<xsl:attribute name="style:mirror">none</xsl:attribute>
			<xsl:attribute name="fo:clip">rect(0cm 0cm 0cm 0cm)</xsl:attribute>
			<xsl:attribute name="draw:luminance">0%</xsl:attribute>
			<xsl:attribute name="draw:contrast">0%</xsl:attribute>
			<xsl:attribute name="draw:red">0%</xsl:attribute>
			<xsl:attribute name="draw:green">0%</xsl:attribute>
			<xsl:attribute name="draw:blue">0%</xsl:attribute>
			<xsl:attribute name="draw:gamma">100%</xsl:attribute>
			<xsl:attribute name="draw:color-inversion">false</xsl:attribute>
			<xsl:attribute name="draw:image-opacity">100%</xsl:attribute>
			<xsl:attribute name="draw:color-mode">standard</xsl:attribute>
			<xsl:element name="style:background-image"/>
		</xsl:element>
	</xsl:element>
	
	
	<xsl:if test="/slides">

		
	</xsl:if>
	
</xsl:template>



<xsl:template name="document-content.automatic-styles.drawing-page">
	
	<xsl:element name="style:style">
		<xsl:attribute name="style:name">drawing-page-default</xsl:attribute>
		<xsl:attribute name="style:family">drawing-page</xsl:attribute>
		<xsl:element name="style:drawing-page-properties">
			<xsl:attribute name="draw:background-size">border</xsl:attribute>
			<xsl:attribute name="draw:fill">solid</xsl:attribute>
			<xsl:attribute name="draw:fill-color"><xsl:value-of select="$CI.style.color2"/></xsl:attribute>
			<xsl:attribute name="presentation:background-visible">true</xsl:attribute>
			<xsl:attribute name="presentation:background-objects-visible">true</xsl:attribute>
			<xsl:attribute name="presentation:display-footer">true</xsl:attribute>
			<xsl:attribute name="presentation:display-page-number">true</xsl:attribute>
			<xsl:attribute name="presentation:display-date-time">true</xsl:attribute>
		</xsl:element>
	</xsl:element>
	
</xsl:template>



<xsl:template name="document-content.automatic-styles.presentation">

	<style:style
		style:name="pr-default"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="none"
			draw:textarea-horizontal-align="left"
			draw:textarea-vertical-align="middle"
			fo:wrap-option="no-wrap"/>
	</style:style>
	
	<style:style
		style:name="pr-title"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="none"
			draw:fill-color="#500000"
			draw:textarea-horizontal-align="left"
			draw:textarea-vertical-align="bottom"
			fo:padding-top="0.15cm"
			fo:padding-bottom="0.15cm"
			fo:padding-left="0.25cm"
			fo:padding-right="0.25cm"
			fo:wrap-option="no-wrap"/>
	</style:style>
	
	<style:style
		style:name="pr-title-foilgroup"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="none"
			draw:fill-color="#500000"
			draw:textarea-horizontal-align="center"
			draw:textarea-vertical-align="bottom"
			fo:padding-top="0.15cm"
			fo:padding-bottom="0.15cm"
			fo:padding-left="0.25cm"
			fo:padding-right="0.25cm"
			fo:wrap-option="no-wrap"/>
	</style:style>
	
	<style:style
		style:name="pr-title-foil"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="none"
			draw:fill-color="#500000"
			draw:textarea-horizontal-align="left"
			draw:textarea-vertical-align="bottom"
			fo:padding-top="0.15cm"
			fo:padding-bottom="0.15cm"
			fo:padding-left="0.25cm"
			fo:padding-right="0.25cm"
			fo:wrap-option="no-wrap"/>
	</style:style>
	
	<style:style
		style:name="pr-foil"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="none"
			draw:textarea-horizontal-align="left"
			draw:textarea-vertical-align="top"
			fo:wrap-option="no-wrap"/>
	</style:style>
	
	<style:style
		style:name="pr-speakernotes"
		style:family="presentation">
		<style:graphic-properties
			draw:stroke="none"
			draw:fill="solid"
			draw:fill-color="#F0F0F0"
			draw:textarea-horizontal-align="left"
			draw:textarea-vertical-align="top"
			
			
			draw:auto-grow-height="true"
			fo:min-height="13.37cm"
			
			
			fo:wrap-option="no-wrap"/>
	</style:style>
	
</xsl:template>


<xsl:template name="document-content.automatic-styles.date">
	<!-- not functional -->
	<number:date-style style:name="date-default"><number:day number:style="long"/><number:text>-</number:text><number:month number:style="long"/><number:text>.</number:text><number:year/></number:date-style>
	
	<!--
	<number:date-style style:name="D8"><number:day-of-week number:style="long"/><number:text>, </number:text><number:day/><number:text>. </number:text><number:month number:style="long" number:textual="true"/><number:text> </number:text><number:year number:style="long"/></number:date-style>
	
	<number:date-style style:name="N37" number:automatic-order="true"><number:day number:style="long"/><number:text>.</number:text><number:month number:style="long"/><number:text>.</number:text><number:year/></number:date-style>
	-->
	
	
</xsl:template>


<xsl:template name="document-content.automatic-styles.section">

	<xsl:element name="style:style">
		<xsl:attribute name="style:name">sect-TOC</xsl:attribute>
		<xsl:attribute name="style:family">section</xsl:attribute>
		<xsl:element name="style:section-properties">
			<xsl:attribute name="fo:background-color">red</xsl:attribute>
			<xsl:attribute name="text:dont-balance-text-columns">false</xsl:attribute>
			<xsl:attribute name="style:editable">false</xsl:attribute>
			<xsl:element name="style:columns">
				<xsl:attribute name="fo:column-count">0</xsl:attribute>
				<xsl:attribute name="fo:column-gap">0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:background-image"/>
		</xsl:element>
	</xsl:element>
	
</xsl:template>


<xsl:template name="document-content.automatic-styles.table">
	<style:style style:name="table-default" style:family="table">
		<style:table-properties
			table:align="margins"
			style:shadow="none"/>
	</style:style>
		
	<style:style style:name="Tabuľka1.A" style:family="table-column">
		<style:table-column-properties
			style:column-width="8.625cm"
			style:rel-column-width="32767*"/>
	</style:style>
	
	<style:style style:name="table-default.cell-A" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border="0.002cm solid #000000">
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<style:style style:name="Tabuľka1.B1" style:family="table-cell">
		<style:table-cell-properties
			fo:background-color="#000080"
			fo:padding="0.097cm"
			fo:border="0.002cm solid #000000">
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	
	
	<style:style style:name="table-info" style:family="table">
		<style:table-properties
			fo:margin-top="1.5cm"
			table:align="margins"
			style:shadow="none"/>
	</style:style>
	
	<style:style style:name="table-info.column-A" style:family="table-column">
		<style:table-column-properties
			style:column-width="3cm"
			style:rel-column-width="100*"/>
	</style:style>
	
	<style:style style:name="table-info.column-B" style:family="table-column">
		<style:table-column-properties
			style:rel-column-width="900*"/>
	</style:style>
	
	<style:style style:name="table-info.cell-H" style:family="table-cell">
		<style:table-cell-properties>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<style:style style:name="table-info.cell-A" style:family="table-cell">
		<style:table-cell-properties>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
</xsl:template>

</xsl:stylesheet>






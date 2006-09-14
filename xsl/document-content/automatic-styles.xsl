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
	
	<xsl:if test="/article|/book">
	
	<!-- para-title1 -->
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
		
	<!-- para-title2 -->
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
		
	<!-- para-title3 -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title3</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">14pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	<!-- para-title4 -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title4</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.5cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">12pt</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
				<xsl:attribute name="fo:font-weight">bold</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
	<!-- para-title -->
		<xsl:element name="style:style">
			<xsl:attribute name="style:name">para-title</xsl:attribute>
			<xsl:attribute name="style:family">paragraph</xsl:attribute>
			<xsl:attribute name="style:parent-style-name">Standard</xsl:attribute>
			<xsl:element name="style:paragraph-properties">
				<xsl:attribute name="fo:margin-top">0.2cm</xsl:attribute>
				<xsl:attribute name="fo:margin-bottom">0.0cm</xsl:attribute>
			</xsl:element>
			<xsl:element name="style:text-properties">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
				<xsl:attribute name="fo:font-size">11pt</xsl:attribute>
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
	
</xsl:template>




<xsl:template name="document-content.automatic-styles.text">
	
	
	
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
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="2"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="1.0cm"
				text:min-label-width="0.5cm"/>
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="3"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="1.5cm"
				text:min-label-width="0.5cm"/>
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="4"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="2.0cm"
				text:min-label-width="0.5cm"/>
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="5"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="2.5cm"
				text:min-label-width="0.5cm"/>
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
		</text:list-level-style-bullet>
		<text:list-level-style-bullet
			text:level="6"
			text:style-name="bullet1"
			style:num-suffix=" "
			text:bullet-char="•">
			<style:list-level-properties
				text:space-before="3.cm"
				text:min-label-width="0.5cm"/>
			<style:text-properties
				style:font-name="StarSymbol"
				fo:font-size="200%">
				<xsl:attribute name="fo:color"><xsl:value-of select="$CI.style.color"/></xsl:attribute>
			</style:text-properties>
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
		<text:list-level-style-number
			text:level="6"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="1"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="3.0cm"
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
		<text:list-level-style-number
			text:level="6"
			text:style-name="numbering1"
			style:num-suffix=")"
			style:num-format="a"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="3.0cm"
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
		<text:list-level-style-number
			text:level="6"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="i"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="3.0cm"
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
		<text:list-level-style-number
			text:level="6"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="A"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="3.0cm"
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
		<text:list-level-style-number
			text:level="6"
			text:style-name="numbering1"
			style:num-suffix="."
			style:num-format="I"
			text:display-levels="1">
			<style:list-level-properties 
				text:space-before="3.0cm"
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
	
<!--
	 ________
	|A1|B1|C1|
	|A2|B2|C2|
	|A3|B3|C3|
	 ^^^^^^^^
-->
	
	<!-- 1 -->
	
	<!-- A1 -->
	<style:style style:name="table-default.cell-A1" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="1pt solid #000000"
			fo:border-top="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- B1 -->
	<style:style style:name="table-default.cell-B1" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- C1 -->
	<style:style style:name="table-default.cell-C1" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="1pt solid #000000"
			fo:border-right="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- 2 -->
	
	<!-- A2 -->
	<style:style style:name="table-default.cell-A2" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="1pt solid #000000"
			fo:border-top="0.5pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- B2 -->
	<style:style style:name="table-default.cell-B2" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="0.5pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- C2 -->
	<style:style style:name="table-default.cell-C2" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-right="1pt solid #000000"
			fo:border-top="0.5pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	
	<!-- 3 -->
	
	<!-- A3 -->
	<style:style style:name="table-default.cell-A3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="1pt solid #000000"
			fo:border-top="0.5pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- B3 -->
	<style:style style:name="table-default.cell-B3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="0.5pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- C3 -->
	<style:style style:name="table-default.cell-C3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="0.5pt solid #000000"
			fo:border-right="1pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<!--<xsl:attribute name="fo:background-color">#500000</xsl:attribute>-->
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	
	<!-- H -->
	
	<!-- H-A3 -->
	<style:style style:name="table-default.cell-H-A3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="1pt solid #000000"
			fo:border-top="1pt solid #000000"
			fo:border-bottom="0pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- H-B3 -->
	<style:style style:name="table-default.cell-H-B3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="1pt solid #000000"
			fo:border-bottom="0pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- H-C3 -->
	<style:style style:name="table-default.cell-H-C3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="1pt solid #000000"
			fo:border-right="1pt solid #000000"
			fo:border-bottom="0pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	
	<!-- F -->
	
	<!-- F-A3 -->
	<style:style style:name="table-default.cell-F-A3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="1pt solid #000000"
			fo:border-top="0pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- F-B3 -->
	<style:style style:name="table-default.cell-F-B3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="0pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	<!-- F-C3 -->
	<style:style style:name="table-default.cell-F-C3" style:family="table-cell">
		<style:table-cell-properties
			fo:padding="0.097cm"
			fo:border-left="0.5pt solid #000000"
			fo:border-top="0pt solid #000000"
			fo:border-right="1pt solid #000000"
			fo:border-bottom="1pt solid #000000">
			<xsl:attribute name="fo:background-color">#A0A0A0</xsl:attribute>
			<style:background-image/>
		</style:table-cell-properties>
	</style:style>
	
	
	<style:style style:name="table-info" style:family="table">
		<style:table-properties
			fo:margin-top="0.5cm"
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






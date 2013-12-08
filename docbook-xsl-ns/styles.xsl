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
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Templates -->
  <xsl:template match="d:*" mode="default-styles">
    <style:default-style style:family="paragraph">
      <style:paragraph-properties
		  fo:text-align="start"
		  style:justify-single-word="false"
		  style:text-autospace="ideograph-alpha"
		  style:punctuation-wrap="hanging"
		  style:line-break="strict"
		  style:writing-mode="page"/>
	  <style:text-properties
		  fo:color="#000000"
		  style:font-name="Arial"
		  fo:font-size="11pt"
		  fo:language="en"
		  fo:country="US"
		  style:font-name-asian="DejaVu Sans"
		  style:font-size-asian="12pt"
		  style:language-asian="en"
		  style:country-asian="US"
		  style:font-name-complex="Tahoma"
		  style:font-size-complex="12pt" 
		  style:language-complex="en"
		  style:country-complex="US"/>
    </style:default-style>

    <style:style
		style:name="Standard"
		style:family="paragraph"
		style:class="text"/>

    <style:style
		style:name="Paragraph_20_Default"
		style:display-name="Paragraph Default"
		style:family="paragraph">
      <style:paragraph-properties
		  fo:margin="100%"
		  fo:margin-left="0in"
		  fo:margin-right="0in"
		  fo:margin-top="0in"
		  fo:margin-bottom="0in" />
	  <style:text-properties
		  style:font-name="Courier New"
		  fo:font-size="12pt"/>
    </style:style>

    <style:style
		style:name="Heading_20_Default"
		style:display-name="Heading Default"
		style:family="paragraph">
      <style:paragraph-properties
		  fo:keep-with-next="always"
		  text:number-lines="true"
		  text:line-number="0"/>
	  <style:text-properties
		  style:font-name="{$style.font.heading}"
		  fo:font-size="{$style.size.heading}"
		  fo:font-weight="{$style.fontWeight.heading}"/>
    </style:style>
  </xsl:template>

  <xsl:template name="paragraph-style">
	<xsl:param name="name"/>
	<xsl:param name="parent.name">Paragraph_20_Default</xsl:param>
	<xsl:param name="display.name"/>

	<xsl:param name="page"/>
	<xsl:param name="font"/>
	<xsl:param name="size"/>
	<xsl:param name="fontStyle"/>
	<xsl:param name="fontWeight"/>
	<xsl:param name="lineHeight"/>
	<xsl:param name="textAlign"/>
	<xsl:param name="textIndent"/>
	<xsl:param name="breakBefore"/>

	<xsl:param name="marginTop"/>
	<xsl:param name="marginBottom"/>
	<xsl:param name="marginLeft"/>
	<xsl:param name="marginRight"/>

	<style:style
		style:name="{$name}"
		style:display-name="{$display.name}"
		style:family="paragraph"
		style:parent-style-name="{$parent.name}"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
	  <xsl:if test="$page != ''">
		<xsl:attribute name="style:master-page-name">
		  <xsl:value-of select="$page"/>
		</xsl:attribute>
	  </xsl:if>
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1">
		<xsl:if test="$breakBefore != ''">
		  <xsl:attribute name="fo:break-before">
			<xsl:value-of select="$breakBefore"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$lineHeight != ''">
		  <xsl:attribute name="fo:line-height">
			<xsl:value-of select="$lineHeight"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$textIndent != ''">
		  <xsl:attribute name="fo:text-indent">
			<xsl:value-of select="$textIndent"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$textAlign != ''">
		  <xsl:attribute name="fo:text-align">
			<xsl:value-of select="$textAlign"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$marginTop != ''">
		  <xsl:attribute name="fo:margin-top">
			<xsl:value-of select="$marginTop"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$marginBottom != ''">
		  <xsl:attribute name="fo:margin-bottom">
			<xsl:value-of select="$marginBottom"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$marginLeft != ''">
		  <xsl:attribute name="fo:margin-left">
			<xsl:value-of select="$marginLeft"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$marginRight != ''">
		  <xsl:attribute name="fo:margin-right">
			<xsl:value-of select="$marginRight"/>
		  </xsl:attribute>
		</xsl:if>
	  </style:paragraph-properties>

	  <style:text-properties>
		<xsl:if test="$font != ''">
		  <xsl:attribute name="style:font-name">
			<xsl:value-of select="$font"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$size != ''">
		  <xsl:attribute name="fo:font-size">
			<xsl:value-of select="$size"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$fontStyle != ''">
		  <xsl:attribute name="fo:font-style">
			<xsl:value-of select="$fontStyle"/>
		  </xsl:attribute>
		</xsl:if>
		<xsl:if test="$fontWeight != ''">
		  <xsl:attribute name="fo:font-weight">
			<xsl:value-of select="$fontWeight"/>
		  </xsl:attribute>
		</xsl:if>
	  </style:text-properties>
	</style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="styles">
	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_1'"/>
	  <xsl:with-param name="display.name" select="'Heading 1'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading1"/>
	  <xsl:with-param name="font" select="$style.font.heading1"/>
	  <xsl:with-param name="size" select="$style.size.heading1"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading1"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading1"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading1"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading1"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading1"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading1"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading1"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading1"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading1"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading1"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_2'"/>
	  <xsl:with-param name="display.name" select="'Heading 2'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading2"/>
	  <xsl:with-param name="font" select="$style.font.heading2"/>
	  <xsl:with-param name="size" select="$style.size.heading2"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading2"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading2"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading2"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading2"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading2"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading2"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading2"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading2"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading2"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading2"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_3'"/>
	  <xsl:with-param name="display.name" select="'Heading 3'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading3"/>
	  <xsl:with-param name="font" select="$style.font.heading3"/>
	  <xsl:with-param name="size" select="$style.size.heading3"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading3"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading3"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading3"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading3"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading3"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading3"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading3"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading3"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading3"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading3"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_4'"/>
	  <xsl:with-param name="display.name" select="'Heading 4'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading4"/>
	  <xsl:with-param name="font" select="$style.font.heading4"/>
	  <xsl:with-param name="size" select="$style.size.heading4"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading4"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading4"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading4"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading4"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading4"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading4"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading4"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading4"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading4"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading4"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_5'"/>
	  <xsl:with-param name="display.name" select="'Heading 5'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading5"/>
	  <xsl:with-param name="font" select="$style.font.heading5"/>
	  <xsl:with-param name="size" select="$style.size.heading5"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading5"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading5"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading5"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading5"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading5"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading5"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading5"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading5"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading5"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading5"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Heading_20_6'"/>
	  <xsl:with-param name="display.name" select="'Heading 6'"/>
	  <xsl:with-param name="parent.name" select="'Heading_20_Default'"/>

	  <xsl:with-param name="page" select="$style.page.heading6"/>
	  <xsl:with-param name="font" select="$style.font.heading6"/>
	  <xsl:with-param name="size" select="$style.size.heading6"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.heading6"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.heading6"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.heading6"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.heading6"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.heading6"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.heading6"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.heading6"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.heading6"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.heading6"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.heading6"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Paragraph'"/>
	  <xsl:with-param name="display.name" select="'Paragraph'"/>

	  <xsl:with-param name="page" select="$style.page.para"/>
	  <xsl:with-param name="font" select="$style.font.para"/>
	  <xsl:with-param name="size" select="$style.size.para"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.para"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.para"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.para"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.para"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.para"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.para"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.para"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.para"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.para"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.para"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Book_20_Title'"/>
	  <xsl:with-param name="display.name" select="'Book Title'"/>
	
	  <xsl:with-param name="page" select="$style.page.book"/>
	  <xsl:with-param name="font" select="$style.font.book"/>
	  <xsl:with-param name="size" select="$style.size.book"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.book"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.book"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.book"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.book"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.book"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.book"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.book"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.book"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.book"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.book"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Epigraph'"/>
	  <xsl:with-param name="display.name" select="'Epigraph'"/>
	
	  <xsl:with-param name="page" select="$style.page.epigraph"/>
	  <xsl:with-param name="font" select="$style.font.epigraph"/>
	  <xsl:with-param name="size" select="$style.size.epigraph"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.epigraph"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.epigraph"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.epigraph"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.epigraph"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.epigraph"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.epigraph"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.epigraph"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.epigraph"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.epigraph"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.epigraph"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Epigraph_20_Attribution'"/>
	  <xsl:with-param name="display.name" select="'Epigraph Attribution'"/>
	
	  <xsl:with-param name="page" select="$style.page.epigraphAttribution"/>
	  <xsl:with-param name="font" select="$style.font.epigraphAttribution"/>
	  <xsl:with-param name="size" select="$style.size.epigraphAttribution"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.epigraphAttribution"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.epigraphAttribution"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.epigraphAttribution"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.epigraphAttribution"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.epigraphAttribution"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.epigraphAttribution"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.epigraphAttribution"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.epigraphAttribution"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.epigraphAttribution"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.epigraphAttribution"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Contents_20_1'"/>
	  <xsl:with-param name="display.name" select="'Contents 1'"/>
	
	  <xsl:with-param name="page" select="$style.page.contents1"/>
	  <xsl:with-param name="font" select="$style.font.contents1"/>
	  <xsl:with-param name="size" select="$style.size.contents1"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.contents1"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.contents1"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.contents1"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.contents1"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.contents1"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.contents1"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.contents1"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.contents1"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.contents1"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.contents1"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Article_20_Title'"/>
	  <xsl:with-param name="display.name" select="'Article Title'"/>
	
	  <xsl:with-param name="page" select="$style.page.article"/>
	  <xsl:with-param name="font" select="$style.font.article"/>
	  <xsl:with-param name="size" select="$style.size.article"/>
	  <xsl:with-param name="fontStyle" select="$style.fontStyle.article"/>
	  <xsl:with-param name="fontWeight" select="$style.fontWeight.article"/>
	  <xsl:with-param name="lineHeight" select="$style.lineHeight.article"/>
	  <xsl:with-param name="textAlign" select="$style.textAlign.article"/>
	  <xsl:with-param name="textIndent" select="$style.textIndent.article"/>
	  <xsl:with-param name="breakBefore" select="$style.breakBefore.article"/>

	  <xsl:with-param name="marginTop" select="$style.marginTop.article"/>
	  <xsl:with-param name="marginBottom" select="$style.marginBottom.article"/>
	  <xsl:with-param name="marginLeft" select="$style.marginLeft.article"/>
	  <xsl:with-param name="marginRight" select="$style.marginRight.article"/>
	</xsl:call-template>
  </xsl:template>

  <xsl:template match="d:*" mode="text-styles">
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
		style:name="Text_20_Superscript"
		style:display-name="Text Superscript"
		style:family="text">
	  <style:text-properties style:text-position="super 58%" />
	</style:style>
	
	<!-- subscript -->
	<style:style
		style:name="Text_20_Subscript"
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

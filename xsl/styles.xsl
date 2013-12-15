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
  <!-- Imports -->
  <xsl:include href="text-styles-para.xsl"/>
  <xsl:include href="text-styles-page.xsl"/>
  <xsl:include href="text-styles-heading.xsl"/>

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

	<xsl:apply-templates select="." mode="text-style-standard"/>
	<xsl:apply-templates select="." mode="text-style-para-default"/>
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
	<xsl:apply-templates select="." mode="text-style-para"/>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Cover_20_Paragraph'"/>
	  <xsl:with-param name="display.name" select="'Cover Paragraph'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraCover.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraCover.page"/>
	  <xsl:with-param name="font" select="$style.paraCover.font"/>
	  <xsl:with-param name="size" select="$style.paraCover.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraCover.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraCover.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraCover.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraCover.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraCover.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraCover.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraCover.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraCover.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraCover.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraCover.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Legal_20_Notice'"/>
	  <xsl:with-param name="display.name" select="'Legal Notice'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraLegal.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraLegal.page"/>
	  <xsl:with-param name="font" select="$style.paraLegal.font"/>
	  <xsl:with-param name="size" select="$style.paraLegal.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraLegal.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraLegal.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraLegal.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraLegal.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraLegal.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraLegal.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraLegal.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraLegal.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraLegal.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraLegal.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Note'"/>
	  <xsl:with-param name="display.name" select="'Note'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraNote.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraNote.page"/>
	  <xsl:with-param name="font" select="$style.paraNote.font"/>
	  <xsl:with-param name="size" select="$style.paraNote.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraNote.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraNote.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraNote.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraNote.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraNote.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraNote.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraNote.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraNote.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraNote.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraNote.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Important'"/>
	  <xsl:with-param name="display.name" select="'Important'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraImportant.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraImportant.page"/>
	  <xsl:with-param name="font" select="$style.paraImportant.font"/>
	  <xsl:with-param name="size" select="$style.paraImportant.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraImportant.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraImportant.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraImportant.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraImportant.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraImportant.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraImportant.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraImportant.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraImportant.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraImportant.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraImportant.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Warning'"/>
	  <xsl:with-param name="display.name" select="'Warning'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraWarning.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraWarning.page"/>
	  <xsl:with-param name="font" select="$style.paraWarning.font"/>
	  <xsl:with-param name="size" select="$style.paraWarning.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraWarning.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraWarning.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraWarning.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraWarning.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraWarning.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraWarning.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraWarning.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraWarning.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraWarning.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraWarning.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Caution'"/>
	  <xsl:with-param name="display.name" select="'Caution'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraCaution.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraCaution.page"/>
	  <xsl:with-param name="font" select="$style.paraCaution.font"/>
	  <xsl:with-param name="size" select="$style.paraCaution.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraCaution.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraCaution.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraCaution.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraCaution.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraCaution.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraCaution.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraCaution.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraCaution.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraCaution.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraCaution.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Tip'"/>
	  <xsl:with-param name="display.name" select="'Tip'"/>
	  <xsl:with-param name="parentStyle" select="$style.paraTip.parentStyle"/>

	  <xsl:with-param name="page" select="$style.paraTip.page"/>
	  <xsl:with-param name="font" select="$style.paraTip.font"/>
	  <xsl:with-param name="size" select="$style.paraTip.size"/>
	  <xsl:with-param name="fontStyle" select="$style.paraTip.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.paraTip.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.paraTip.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.paraTip.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.paraTip.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.paraTip.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.paraTip.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.paraTip.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.paraTip.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.paraTip.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Contents_20_1'"/>
	  <xsl:with-param name="display.name" select="'Contents 1'"/>
	
	  <xsl:with-param name="page" select="$style.contents1.page"/>
	  <xsl:with-param name="font" select="$style.contents1.font"/>
	  <xsl:with-param name="size" select="$style.contents1.size"/>
	  <xsl:with-param name="fontStyle" select="$style.contents1.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.contents1.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.contents1.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.contents1.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.contents1.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.contents1.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.contents1.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.contents1.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.contents1.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.contents1.marginRight"/>
	</xsl:call-template>

	<xsl:call-template name="paragraph-style">
	  <xsl:with-param name="name" select="'Article_20_Title'"/>
	  <xsl:with-param name="display.name" select="'Article Title'"/>
	
	  <xsl:with-param name="page" select="$style.article.page"/>
	  <xsl:with-param name="font" select="$style.article.font"/>
	  <xsl:with-param name="size" select="$style.article.size"/>
	  <xsl:with-param name="fontStyle" select="$style.article.fontStyle"/>
	  <xsl:with-param name="fontWeight" select="$style.article.fontWeight"/>
	  <xsl:with-param name="lineHeight" select="$style.article.lineHeight"/>
	  <xsl:with-param name="textAlign" select="$style.article.textAlign"/>
	  <xsl:with-param name="textIndent" select="$style.article.textIndent"/>
	  <xsl:with-param name="breakBefore" select="$style.article.breakBefore"/>

	  <xsl:with-param name="marginTop" select="$style.article.marginTop"/>
	  <xsl:with-param name="marginBottom" select="$style.article.marginBottom"/>
	  <xsl:with-param name="marginLeft" select="$style.article.marginLeft"/>
	  <xsl:with-param name="marginRight" select="$style.article.marginRight"/>
	</xsl:call-template>

	<!-- text-styles-heading.xsl -->
	<xsl:apply-templates select="." mode="text-style-heading"/>
	<xsl:apply-templates select="." mode="text-style-heading-1"/>
	<xsl:apply-templates select="." mode="text-style-heading-2"/>
	<xsl:apply-templates select="." mode="text-style-heading-3"/>
	<xsl:apply-templates select="." mode="text-style-heading-4"/>
	<xsl:apply-templates select="." mode="text-style-heading-5"/>
	<xsl:apply-templates select="." mode="text-style-heading-6"/>

	<!-- text-styles-page.xsl -->
	<xsl:apply-templates select="." mode="text-style-header"/>
	<xsl:apply-templates select="." mode="text-style-footer"/>

	<xsl:apply-templates select="." mode="text-style-book"/>
	<xsl:apply-templates select="." mode="text-style-chapter"/>

	<!-- text-styles-para.xsl -->
	<xsl:apply-templates select="." mode="text-style-epigraph"/>
	<xsl:apply-templates select="." mode="text-style-epigraph-attribution"/>

	<!-- Include any additional styles. -->
	<xsl:apply-templates select="." mode="text-style-custom"/>
  </xsl:template>

  <!-- By default, we don't have any custom styles. -->
  <xsl:template match="d:*" mode="text-style-custom"/>

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
		  fo:font-family="Courier New"/>
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
		  fo:font-family="Courier New"
		  fo:font-weight="bold"
		  fo:background-color="#f0f0f0"/>
	</style:style>
  </xsl:template>
</xsl:stylesheet>

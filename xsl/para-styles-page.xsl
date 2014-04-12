<?xml version="1.0" encoding="utf-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Templates -->
  <xsl:template match="d:*" mode="para-style-header">
	<style:style
		style:name="Header"
		style:display-name="Header"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties fo:text-align="left">
		<style:tab-stops>
		  <style:tab-stop style:position="3.25in" style:type="center"/>
  		  <style:tab-stop style:position="6.5in" style:type="right"/>
		</style:tab-stops>
	  </style:paragraph-properties>
	</style:style>
  </xsl:template>
  
  <xsl:template match="d:*" mode="para-style-footer">
	<style:style
		style:name="Footer"
		style:display-name="Footer"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties fo:text-align="left">
		<style:tab-stops>
		  <style:tab-stop style:position="3.25in" style:type="center"/>
  		  <style:tab-stop style:position="6.5in" style:type="right"/>
		</style:tab-stops>
	  </style:paragraph-properties>
	</style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-book">
	<style:style
		style:name="Book_20_Title"
		style:display-name="Book Title"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		style:master-page-name="Book_20_Page">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:break-before="page"
		  fo:text-align="center"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-weight="bold"
		  fo:font-size="300%"/>
	</style:style>
	<style:style
		style:name="Book_20_Subtitle"
		style:display-name="Book Subtitle"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="false"
		  fo:text-align="center"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-weight="bold"
		  fo:font-size="200%"/>
	</style:style>
	<style:style
		style:name="Book_20_Author"
		style:display-name="Book Author"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text">
      <style:paragraph-properties
		  fo:text-align="center"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-weight="bold"
		  fo:font-size="300%"/>
	</style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-chapter">
	<!-- Chapters currently use Heading 1 -->
	<!--
	<style:style
		style:name="Chapter_20_Title"
		style:display-name="Chapter Title"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:list-style-name="List_20_Headings"
		style:class="text">
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text"
		style:master-page-name="Mpm1">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:break-before="page"
		  fo:text-align="center"
		  fo:margin-top="1in"
		  fo:margin-bottom="1in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"
		  fo:text-indent="0in"/>
	  <style:text-properties
		  fo:font-weight="bold"
		  fo:font-size="200%"/>
	</style:style>
	-->
  </xsl:template>
</xsl:stylesheet>

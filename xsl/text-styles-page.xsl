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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Templates -->
  <xsl:template match="d:*" mode="text-style-header">
	<style:style
		style:name="Header"
		style:display-name="Header"
		style:family="paragraph"
		style:parent-style-name="Default"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties fo:text-align="left" />
      <style:tab-stops>
		<style:tab-stop style:position="3.25in" style:type="center"/>
  		<style:tab-stop style:position="6.5in" style:type="right"/>
      </style:tab-stops>
	</style:style>
  </xsl:template>
  
  <xsl:template match="d:*" mode="text-style-footer">
	<style:style
		style:name="Footer"
		style:display-name="Footer"
		style:family="paragraph"
		style:parent-style-name="Default"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties fo:text-align="left" />
      <style:tab-stops>
		<style:tab-stop style:position="3.25in" style:type="center"/>
  		<style:tab-stop style:position="6.5in" style:type="right"/>
      </style:tab-stops>
	</style:style>
  </xsl:template>
</xsl:stylesheet>

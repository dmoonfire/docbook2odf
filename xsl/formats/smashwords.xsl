<?xml version="1.0" encoding="UTF-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
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
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Parameters. These have to be before the imports because otherwise the params will be picked up by the imports instead of our settings. --> 

  <!-- We need references rendered as hyperlinks so Smashwords can pick them up. -->
  <xsl:param name="generate.references.as.bookmarks">1</xsl:param>

  <!-- Table of Contents Levels -->
  <xsl:param name="toc.article">0</xsl:param>
  <xsl:param name="toc.book">1</xsl:param>
  <xsl:param name="toc.chapter">2</xsl:param>
  <xsl:param name="toc.appendix">1</xsl:param>

  <xsl:param name="style.chapter.level">0</xsl:param>
  <xsl:param name="style.chapter.name">Chapter Title</xsl:param> 
  <xsl:param name="style.appendix.level">0</xsl:param>
  <xsl:param name="style.appendix.name">Chapter Title</xsl:param>
  <xsl:param name="style.sect1.level">0</xsl:param>
  <xsl:param name="style.sect1.name">Section_20_Title</xsl:param>

  <xsl:param name="generate.toc">
appendix  title
article/appendix  nop
article   title
book      toc,title,figure,table,example,equation,abstract
chapter   title
part      title
preface   title
qandadiv  nop
qandaset  nop
reference title
sect1     nop
sect2     nop
sect3     nop
sect4     nop
sect5     nop
section   nop
set       title
  </xsl:param>

  <!-- Includes -->
  <xsl:include href="../docbook.xsl"/>

  <xsl:template match="d:*" mode="para-style-para">
    <style:style
		style:name="Paragraph"
		style:display-name="Paragraph"
		style:family="paragraph">
      <style:paragraph-properties
		  fo:line-height="125%"
		  fo:text-indent="0.5in"
		  fo:text-align="left"
		  />
	  <style:text-properties
		  fo:font-size="12pt"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-standard">
    <style:style
		style:name="Standard"
		style:display-name="Standard"
		style:family="paragraph">
	  <style:text-properties
		  style:font-name="Times New Roman"
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-para">
    <style:style
		style:name="Paragraph"
		style:display-name="Paragraph"
		style:family="paragraph"
		style:parent-style-name="Paragraph_20_Default"
		>
      <style:paragraph-properties
		  fo:line-height="120%"
		  fo:text-indent="0.5in"
		  fo:text-align="left" />
	  <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="para-style-custom">
    <style:style
		style:name="Chapter_20_Title"
		style:display-name="Chapter Title"
		style:family="paragraph"
		style:class="text"
		style:master-page-name="Chapter_20_Page"
		style:parent-style-name="Paragraph_20_Default">
      <style:paragraph-properties
		  text:number-lines="false"
		  fo:break-before="page"
		  fo:margin-top="0.25in"
		  fo:margin-bottom="0.25in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties
		  fo:font-weight="bold"
		  fo:font-size="24pt"/>
    </style:style>
    <style:style
		style:name="Section_20_Title"
		style:display-name="Section Title"
		style:family="paragraph"
		style:default-outline-level="2"
		style:class="text">
      <style:paragraph-properties
		  fo:margin-top="0.25in"
		  fo:margin-bottom="0.25in"
		  fo:margin-left="0in"
		  fo:margin-right="0in"/>
      <style:text-properties
		  fo:font-size="20pt"/>
    </style:style>

	<style:style
		style:name="Contact"
		style:display-name="Contact"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text">
      <style:paragraph-properties fo:text-align="left">
		<style:tab-stops>
  		  <style:tab-stop style:position="6.5in" style:type="right"/>
		</style:tab-stops>
	  </style:paragraph-properties>
	</style:style>

	<style:style
		style:name="Contact_20_First"
		style:display-name="Contact First"
		style:family="paragraph"
		style:parent-style-name="Contact"
		style:class="text"
		style:master-page-name="Book_20_Page"
		>
      <style:paragraph-properties
		  fo:break-before="page"
		  />
	</style:style>

	<style:style
		style:name="Center"
		style:display-name="Center"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		>
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:line-height="200%"
		  fo:text-align="center"
		  />
	</style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-book">
	<style:style
		style:name="Book_20_Title"
		style:display-name="Book Title"
		style:family="paragraph"
		style:parent-style-name="Standard"
		style:class="text"
		>
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"
		  fo:text-align="center"
		  fo:margin-top="2.5in"
		  fo:margin-bottom="0.25in"
		  fo:margin-left="1in"
		  fo:margin-right="1in"/>
	  <style:text-properties
		  fo:font-size="100%"/>
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
		  fo:font-size="80%"/>
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
		  fo:font-size="100%"/>
	</style:style>
  </xsl:template>

  <!-- We don't use hard page breaks at all. -->
  <xsl:template match="d:*" mode="text-style-heading">
    <style:style
		style:name="Heading_20_Default"
		style:display-name="Heading Default"
		style:family="paragraph"
		style:parent-style-name="Standard">
      <style:paragraph-properties
		  fo:keep-with-next="always"
		  fo:line-height="200%"
		  text:number-lines="true"
		  text:line-number="0"/>
	  <style:text-properties
		  fo:font-weight="normal"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-1">
    <style:style
		style:name="Heading_20_1"
		style:display-name="Heading 1"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="1"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  fo:margin-top="0.75in"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-2">
    <style:style
		style:name="Heading_20_2"
		style:display-name="Heading 2"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="2"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-heading-3">
    <style:style
		style:name="Heading_20_3"
		style:display-name="Heading 3"
		style:family="paragraph"
		style:parent-style-name="Heading_20_Default"
		style:default-outline-level="3"
		style:list-style-name="List_20_Headings"
		style:class="text">
      <style:paragraph-properties
		  text:number-lines="true"
		  text:line-number="1"/>
      <style:text-properties
		  fo:font-size="12pt"/>
    </style:style>
  </xsl:template>

  <!-- We can't find an example of how epigraphs are formatted in SMF, so we went with indenting them 2in from the left but keeping the rest of the font normal. -->
  <xsl:template match="d:*" mode="text-style-epigraph">
    <style:style
		style:name="Epigraph"
		style:display-name="Epigraph"
		style:family="paragraph"
		style:parent-style-name="Paragraph_20_Default"
		>
      <style:paragraph-properties
		  fo:margin-left="1in"
		  fo:line-height="200%"
		  />
    </style:style>
  </xsl:template>

  <xsl:template match="d:*" mode="text-style-epigraph-attribution">
    <style:style
		style:name="Epigraph_20_Attribution"
		style:display-name="Epigraph Attribution"
		style:family="paragraph"
		style:parent-style-name="Epigraph"
		>
    </style:style>
  </xsl:template>

  <!-- Master Pages -->
  <xsl:template match="d:*" mode="master-style-standard">
    <style:master-page
		style:name="Standard"
		style:page-layout-name="Standard_20_Layout">
	</style:master-page>
  </xsl:template>

  <xsl:template match="d:*" mode="master-style-chapter">
	<style:master-page
		style:name="Chapter_20_Page"
		style:display-name="Chapter Page"
		style:page-layout-name="Chapter_20_Layout"
		style:next-style-name="Standard">
	</style:master-page>
  </xsl:template>

  <!-- Matters -->
  <xsl:template match="d:book" mode="bodymatter">
	<xsl:apply-templates
		select="d:part|d:article|d:chapter"/>

	<text:p text:style-name="Center">END</text:p>
  </xsl:template>

  <!-- Breaks -->
  <xsl:template match="d:bridgehead[@otherrenderas='break']">
	<text:p text:style-name="Center"># # #</text:p>
  </xsl:template>

  <!-- Table of Contents -->
  <xsl:template match="d:appendix" mode="toc.insert">
	<xsl:param name="number">
	  <xsl:apply-templates select="." mode="label.markup"/>
	</xsl:param>

	<!-- We don't want the word "Appendix:" in the name. -->
	<xsl:call-template name="insert-toc-entry">
	  <xsl:with-param name="level" select="$toc.appendix"/>
	  <xsl:with-param name="text">
		<xsl:apply-templates select="." mode="title.markup"/>
	  </xsl:with-param>
	  <xsl:with-param name="ref" select="concat('Appendix', $number)"/>
	</xsl:call-template>

	<xsl:apply-templates mode="toc.insert"/>
  </xsl:template>

  <xsl:template match="d:appendix" mode="title">
	<xsl:param name="number">
	  <xsl:apply-templates select="." mode="label.markup"/>
	</xsl:param>

	<xsl:call-template name="p-or-h">
	  <xsl:with-param name="style.name">
		<xsl:value-of select="$style.appendix.name"/>
	  </xsl:with-param>
	  <xsl:with-param name="style.level">
		<xsl:value-of select="$style.appendix.level"/>
	  </xsl:with-param>
	  <xsl:with-param name="text">
		<xsl:apply-templates select="." mode="title.markup"/>
	  </xsl:with-param>
	  <xsl:with-param name="referenceMark" select="concat('Appendix', $number)"/>
	</xsl:call-template>
  </xsl:template>

  <!-- Assuming we aren't including the image for PDF, Smashwords recommends that cover images are not included. -->
  <xsl:template match="d:cover"/>
</xsl:stylesheet>

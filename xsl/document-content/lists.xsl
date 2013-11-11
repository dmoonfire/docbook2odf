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
	xmlns:docbook="http://docbook.org/ns/docbook"
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

<!-- ako je to so stylmi a headingmi (sorry for only slovak text)

Takze, automaticky obsah (napr. v OpenOffice.org pri ukladani do PDF) sa generuje z <text:h>,
takze vsetko co chcem mat v obsahu defaultne, ako section alebo chapter, musi mat <text:h>.

Ostatne veci ako tabulky a zoznamy musia mat title v <text:p>. Pokial tieto veci chcem do obsahu,
musim generovat obsah do dokumentu na zaklade stylov, mozem teda ziskat automaticky obsah ako zoznam
vsetkych tabuliek, alebo taskov, ci zoznamov.

Aby som bol schopny vygenerovat tieto specializovane zoznamy, potrebujem pre kazdy typ zoznamu specialny
styl headingu. Napr. pre tabulku potrebujem Heading-table, pre task potrebujem Heading-task

Taktiez je mozne pouzit znacky pre indexovanie TOC

The <text:toc-mark-start> element marks the start of a table of content index entry. The
ID specified by the text:id attribute must be unique except for the matching index mark end
element. There must be an end element to match the start element located in the same
paragraph, with the start element appearing first.


-->

<xsl:template match="task">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="task/title">
	<text:p
		text:style-name="Heading_20_Small">
		<xsl:apply-templates/>
	</text:p>
</xsl:template>

<xsl:template match="taskprerequisites">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="procedure">
  <!-- Apply everything but the list items. -->
  <xsl:apply-templates/>

  <!-- Create a list with the list items/ -->
  <text:list text:style-name="List_20_1">
    <xsl:apply-templates mode="list"/>
  </text:list>
</xsl:template>


<xsl:template match="itemizedlist">
  <!-- apply all, only not listitem -->
  <xsl:apply-templates/>
  
  <text:list text:style-name="List_20_1">
    <!-- apply only listitem -->
    <xsl:apply-templates mode="list"/>
  </text:list>
</xsl:template>


<xsl:template match="orderedlist">
  <!-- Apply the template for everything but the list items themselves. -->
  <xsl:apply-templates/>

  <!-- Create the list with the items inside it. -->
  <text:list text:style-name="Numbering_20_1">
    <!-- Add in the style name, depending on the style. --> 
    <!--
	<xsl:attribute name="text:style-name">
	<xsl:text>Numbering_20_1</xsl:text>
	<xsl:choose>
	<xsl:when test="@numeration">
	<xsl:value-of select="@numeration"/>
	</xsl:when>
	<xsl:otherwise>arabic</xsl:otherwise>
	</xsl:choose>
	</xsl:attribute>
    -->

    <!-- Set up if we are resuming the item numbers or not. -->
    <xsl:attribute name="text:continue-numbering">
      <xsl:choose>
	<xsl:when test="@continuation='continues'">true</xsl:when>
	<xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>

    <!-- Add in the individual list items. -->
    <xsl:apply-templates mode="list" />
  </text:list>
</xsl:template>


<xsl:template match="itemizedlist/title|orderedlist/title|variablelist/title">
	<text:p
		text:style-name="Heading_20_Small">
		<xsl:value-of select="."/>
	</text:p>
</xsl:template>


<!-- listitem | step -->

<xsl:template match="listitem|step"/>
<xsl:template match="listitem|step" mode="list">
	<text:list-item>
		<xsl:apply-templates/>
	</text:list-item>
</xsl:template>
<!-- all other content in list -->
<xsl:template match="*" mode="list"/>


<xsl:template match="variablelist">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="varlistentry">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="varlistentry/term">
	<text:p text:style-name="Paragraph_20_Term">
		<xsl:apply-templates/>
	</text:p>
</xsl:template>


<xsl:template match="varlistentry/listitem">
	<xsl:apply-templates/>
</xsl:template>


</xsl:stylesheet>

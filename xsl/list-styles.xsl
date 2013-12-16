<?xml version="1.0" encoding="utf-8"?>
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
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	exclude-result-prefixes="d"
	version="1.0">
  <!-- Imports -->
  <xsl:template match="d:*" mode="list-styles">
	<xsl:apply-templates select="." mode="list-style-numbering-1"/>
	<xsl:apply-templates select="." mode="list-style-list-1"/>
  </xsl:template>

  <xsl:template match="d:*" mode="list-style-numbering-1">
    <text:list-style style:name="Numbering_20_1" style:display-name="Numbering 1">
      <text:list-level-style-number text:level="1" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.1965in" fo:text-indent="-0.1965in" fo:margin-left="0.1965in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="2" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.3937in" fo:text-indent="-0.1965in" fo:margin-left="0.3937in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="3" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.5902in" fo:text-indent="-0.1965in" fo:margin-left="0.5902in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="4" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.7874in" fo:text-indent="-0.1965in" fo:margin-left="0.7874in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="5" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.9839in" fo:text-indent="-0.1965in" fo:margin-left="0.9839in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="6" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.1811in" fo:text-indent="-0.1965in" fo:margin-left="1.1811in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="7" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.378in" fo:text-indent="-0.1965in" fo:margin-left="1.378in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="8" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.5752in" fo:text-indent="-0.1965in" fo:margin-left="1.5752in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="9" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.7717in" fo:text-indent="-0.1965in" fo:margin-left="1.7717in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
      <text:list-level-style-number text:level="10" text:style-name="Numbering_20_Symbols" style:num-suffix="." style:num-format="1">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.9689in" fo:text-indent="-0.1965in" fo:margin-left="1.9689in"/>
        </style:list-level-properties>
      </text:list-level-style-number>
    </text:list-style>
  </xsl:template>

  <xsl:template match="d:*" mode="list-style-list-1">
    <text:list-style style:name="List_20_1" style:display-name="List 1">
      <text:list-level-style-bullet text:level="1" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.1575in" fo:text-indent="-0.1575in" fo:margin-left="0.1575in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="2" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.3154in" fo:text-indent="-0.1575in" fo:margin-left="0.3154in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="3" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.472in" fo:text-indent="-0.1575in" fo:margin-left="0.472in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="4" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.6299in" fo:text-indent="-0.1575in" fo:margin-left="0.6299in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="5" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.7874in" fo:text-indent="-0.1575in" fo:margin-left="0.7874in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="6" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="0.9453in" fo:text-indent="-0.1575in" fo:margin-left="0.9453in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="7" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.102in" fo:text-indent="-0.1575in" fo:margin-left="1.102in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="8" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.2598in" fo:text-indent="-0.1575in" fo:margin-left="1.2598in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="9" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.4173in" fo:text-indent="-0.1575in" fo:margin-left="1.4173in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
      <text:list-level-style-bullet text:level="10" text:style-name="Bullet_20_Symbols" text:bullet-char="•">
        <style:list-level-properties text:list-level-position-and-space-mode="label-alignment">
          <style:list-level-label-alignment text:label-followed-by="listtab" text:list-tab-stop-position="1.5752in" fo:text-indent="-0.1575in" fo:margin-left="1.5752in"/>
        </style:list-level-properties>
        <style:text-properties style:font-name="StarSymbol"/>
      </text:list-level-style-bullet>
    </text:list-style>
  </xsl:template>
</xsl:stylesheet>

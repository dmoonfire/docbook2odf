<?xml version="1.0" encoding="UTF-8"?>
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
	version="1.0">

  <!-- Table of Contents -->
  <xsl:param name="toc.book">0</xsl:param>
  <xsl:param name="toc.chapter">1</xsl:param>

  <!--
	  Paragraph Styles

      style.name.*: The newest versions of OpenOffice.org/Libreoffice don't
      allow spaces in the paragraph styles. With these versions, a space ("
      ") is replaced with "_20_". Headings, on the other hand, retain the
      space so use "Heading 1".

      style.level.*: Which heading level should this style be. If zero,
      then the resulting line will be a text block, otherwise a heading of
      the given type.
  -->

  <xsl:param name="style.name.book.title">Book_20_Title</xsl:param>
  <xsl:param name="style.name.chapter.title">Heading 1</xsl:param>
  <xsl:param name="style.name.para">Paragraph</xsl:param>
  <xsl:param name="style.name.epigraph">Epigraph</xsl:param>
  <xsl:param name="style.name.epigraphAttribution">Epigraph_20_Attribution</xsl:param>
  <xsl:param name="style.name.toc1">Contents_20_1</xsl:param>

  <xsl:param name="style.level.book.title">0</xsl:param>
  <xsl:param name="style.level.chapter.title">1</xsl:param>
  <xsl:param name="style.level.para">0</xsl:param>
  <xsl:param name="style.level.epigraph">0</xsl:param>
  <xsl:param name="style.level.epigraphAttribution">0</xsl:param>

  <xsl:param name="style.font">Courier New</xsl:param>
  <xsl:param name="style.font.heading" select="$style.font"/>
  <xsl:param name="style.font.heading1"/>
  <xsl:param name="style.font.para" select="$style.font"/>
  <xsl:param name="style.font.book" select="$style.font"/>
  <xsl:param name="style.font.epigraph" select="$style.font.para"/>
  <xsl:param name="style.font.epigraphAttribution" select="$style.font.epigraph"/>
  <xsl:param name="style.font.contents1" select="$style.font"/>

  <xsl:param name="style.page.heading1" select="Chapter_20_Page"/>
  <xsl:param name="style.page.para"/>
  <xsl:param name="style.page.book" select="Book_20_Page"/>
  <xsl:param name="style.page.epigraph"/>
  <xsl:param name="style.page.epigraphAttribution"/>
  <xsl:param name="style.page.contents1"/>

  <xsl:param name="style.size">12pt</xsl:param>
  <xsl:param name="style.size.heading" select="$style.size"/>
  <xsl:param name="style.size.heading1">175%</xsl:param>
  <xsl:param name="style.size.para" select="$style.size"/>
  <xsl:param name="style.size.book">200%</xsl:param>
  <xsl:param name="style.size.epigraph">9pt</xsl:param>
  <xsl:param name="style.size.epigraphAttribution" select="$style.size.epigraph"/>
  <xsl:param name="style.size.contents1" select="$style.size"/>
  
  <xsl:param name="style.fontStyle.heading"></xsl:param>
  <xsl:param name="style.fontStyle.heading1"/>
  <xsl:param name="style.fontStyle.para"/>
  <xsl:param name="style.fontStyle.book"></xsl:param>
  <xsl:param name="style.fontStyle.epigraph" select="$style.fontStyle.para"/>
  <xsl:param name="style.fontStyle.epigraphAttribution" select="'italic'"/>
  <xsl:param name="style.fontStyle.contents1"/>

  <xsl:param name="style.fontWeight.heading">bold</xsl:param>
  <xsl:param name="style.fontWeight.heading1"/>
  <xsl:param name="style.fontWeight.para"/>
  <xsl:param name="style.fontWeight.book">bold</xsl:param>
  <xsl:param name="style.fontWeight.epigraph" select="$style.fontWeight.para"/>
  <xsl:param name="style.fontWeight.epigraphAttribution" select="$style.fontWeight.epigraph"/>
  <xsl:param name="style.fontWeight.contents1"/>

  <xsl:param name="style.lineHeight.heading1"/>
  <xsl:param name="style.lineHeight.para">150%</xsl:param>
  <xsl:param name="style.lineHeight.book"/>
  <xsl:param name="style.lineHeight.epigraph"/>
  <xsl:param name="style.lineHeight.epigraphAttribution"/>
  <xsl:param name="style.lineHeight.contents1"/>

  <xsl:param name="style.textAlign.heading">left</xsl:param>
  <xsl:param name="style.textAlign.heading1"/>
  <xsl:param name="style.textAlign.para">justified</xsl:param>
  <xsl:param name="style.textAlign.book">center</xsl:param>
  <xsl:param name="style.textAlign.epigraph">left</xsl:param>
  <xsl:param name="style.textAlign.epigraphAttribution">right</xsl:param>
  <xsl:param name="style.textAlign.contents1">left</xsl:param>

  <xsl:param name="style.textIndent.heading1"/>
  <xsl:param name="style.textIndent.para">0.25in</xsl:param>
  <xsl:param name="style.textIndent.book">0in</xsl:param>
  <xsl:param name="style.textIndent.epigraph">0in</xsl:param>
  <xsl:param name="style.textIndent.epigraphAttribution">0in</xsl:param>
  <xsl:param name="style.textIndent.contents1">0in</xsl:param>

  <xsl:param name="style.breakBefore.heading1">page</xsl:param>
  <xsl:param name="style.breakBefore.para"></xsl:param>
  <xsl:param name="style.breakBefore.book">page</xsl:param>
  <xsl:param name="style.breakBefore.epigraph"></xsl:param>
  <xsl:param name="style.breakBefore.epigraphAttribution"></xsl:param>
  <xsl:param name="style.breakBefore.contents1"></xsl:param>

  <xsl:param name="style.marginTop.heading1">0.125in</xsl:param>
  <xsl:param name="style.marginTop.para">0in</xsl:param>
  <xsl:param name="style.marginTop.book">1in</xsl:param>
  <xsl:param name="style.marginTop.epigraph">0in</xsl:param>
  <xsl:param name="style.marginTop.epigraphAttribution">0in</xsl:param>
  <xsl:param name="style.marginTop.contents1">0in</xsl:param>

  <xsl:param name="style.marginBottom.heading1">0.5in</xsl:param>
  <xsl:param name="style.marginBottom.para">0in</xsl:param>
  <xsl:param name="style.marginBottom.book">1in</xsl:param>
  <xsl:param name="style.marginBottom.epigraph">0in</xsl:param>
  <xsl:param name="style.marginBottom.epigraphAttribution">0.5in</xsl:param>
  <xsl:param name="style.marginBottom.contents1">0in</xsl:param>

  <xsl:param name="style.marginLeft.heading1">0in</xsl:param>
  <xsl:param name="style.marginLeft.para">0in</xsl:param>
  <xsl:param name="style.marginLeft.book">1in</xsl:param>
  <xsl:param name="style.marginLeft.epigraph">0.5in</xsl:param>
  <xsl:param name="style.marginLeft.epigraphAttribution">1.0in</xsl:param>
  <xsl:param name="style.marginLeft.contents1">0in</xsl:param>

  <xsl:param name="style.marginRight.heading1">0in</xsl:param>
  <xsl:param name="style.marginRight.para">0in</xsl:param>
  <xsl:param name="style.marginRight.book">1in</xsl:param>
  <xsl:param name="style.marginRight.epigraph">0.5in</xsl:param>
  <xsl:param name="style.marginRight.epigraphAttribution">0.5in</xsl:param>
  <xsl:param name="style.marginRight.contents1">0in</xsl:param>

  <!-- ODF Settings -->
  <xsl:param name="toc.position">afterContents</xsl:param>

  <!-- Common -->
  <xsl:param name="appendix.autolabel">A</xsl:param>
  <xsl:param name="author.othername.in.middle" select="1"/>
  <xsl:param name="chapter.autolabel" select="1"/>
  <xsl:param name="component.label.includes.part.label" select="0"/>
  <xsl:param name="l10n.gentext.default.language">en</xsl:param>
  <xsl:param name="l10n.gentext.language">en</xsl:param>
  <xsl:param name="l10n.gentext.use.xref.language" select="0"/>
  <xsl:param name="l10n.lang.value.rfc.compliant" select="1"/>
  <xsl:param name="label.from.part" select="0"/>
  <xsl:param name="part.autolabel">I</xsl:param>
  <xsl:param name="preface.autolabel" select="0"/>
  <xsl:param name="qandadiv.autolabel" select="1"/>
  <xsl:param name="reference.autolabel">I</xsl:param>
  <xsl:param name="section.autolabel" select="0"/>
  <xsl:param name="section.autolabel.max.depth">8</xsl:param>
  <xsl:param name="section.label.includes.component.label" select="0"/>
  <xsl:param name="xref.with.number.and.title" select="1"/>

  <xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
  </xsl:param>
</xsl:stylesheet>

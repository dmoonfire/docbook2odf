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

  <!-- Internationalization -->
  <xsl:param name="l10n.gentext.default.language">en</xsl:param>
  <xsl:param name="l10n.gentext.language">en</xsl:param>
  <xsl:param name="l10n.gentext.use.xref.language" select="0"/>
  <xsl:param name="l10n.lang.value.rfc.compliant" select="1"/>

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

  <xsl:param name="style.name.book.title">Title_20_Book</xsl:param>
  <xsl:param name="style.level.book.title">0</xsl:param>
  <xsl:param name="style.name.chapter.title">Heading 1</xsl:param>
  <xsl:param name="style.level.chapter.title">1</xsl:param>

  <xsl:param name="style.name.para">Paragraph_20_Padding</xsl:param>
  <xsl:param name="style.level.para">0</xsl:param>
  <xsl:param name="style.name.simpara">Paragraph_20_Padding</xsl:param>
  <xsl:param name="style.level.simpara">0</xsl:param>
</xsl:stylesheet>

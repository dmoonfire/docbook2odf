<?xml version="1.0" encoding="UTF-8"?>
<!--
docbook2odf - DocBook to OpenDocument XSL Transformation
Copyright (C) 2006 Roman Fordinal
Copyright (C) 2013 Moonfire Games
See `license` for the GNU General Public License v2.
-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

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

  <xsl:param name="style.font">Courier New</xsl:param>
  <xsl:param name="style.size">12pt</xsl:param>

  <xsl:param name="style.article.breakBefore"></xsl:param>
  <xsl:param name="style.article.font" select="$style.font"/>
  <xsl:param name="style.article.fontStyle"></xsl:param>
  <xsl:param name="style.article.fontWeight">bold</xsl:param>
  <xsl:param name="style.article.level">0</xsl:param>
  <xsl:param name="style.article.lineHeight"/>
  <xsl:param name="style.article.marginBottom">0.25in</xsl:param>
  <xsl:param name="style.article.marginLeft">1in</xsl:param>
  <xsl:param name="style.article.marginRight">1in</xsl:param>
  <xsl:param name="style.article.marginTop">0in</xsl:param>
  <xsl:param name="style.article.name">Article_20_Title</xsl:param>
  <xsl:param name="style.article.page" select="Article_20_Page"/>
  <xsl:param name="style.article.size">200%</xsl:param>
  <xsl:param name="style.article.textAlign">center</xsl:param>
  <xsl:param name="style.article.textIndent">0in</xsl:param>

  <xsl:param name="style.chapter.level">1</xsl:param>
  <xsl:param name="style.chapter.name">Heading 1</xsl:param> 
  <xsl:param name="style.appendix.level">1</xsl:param>
  <xsl:param name="style.appendix.name">Heading 1</xsl:param>
  <xsl:param name="style.book.name">Book_20_Title</xsl:param>
  <xsl:param name="style.book.level">0</xsl:param>

  <xsl:param name="style.contents1.breakBefore"></xsl:param>
  <xsl:param name="style.contents1.font" select="$style.font"/>
  <xsl:param name="style.contents1.fontStyle"/>
  <xsl:param name="style.contents1.fontWeight"/>
  <xsl:param name="style.contents1.lineHeight"/>
  <xsl:param name="style.contents1.marginBottom">0in</xsl:param>
  <xsl:param name="style.contents1.marginLeft">0in</xsl:param>
  <xsl:param name="style.contents1.marginRight">0in</xsl:param>
  <xsl:param name="style.contents1.marginTop">0in</xsl:param>
  <xsl:param name="style.contents1.page"/>
  <xsl:param name="style.contents1.size" select="$style.size"/>
  <xsl:param name="style.contents1.textAlign">left</xsl:param>
  <xsl:param name="style.contents1.textIndent">0in</xsl:param>

  <xsl:param name="style.epigraph.level">0</xsl:param>
  <xsl:param name="style.epigraph.name">Epigraph</xsl:param>

  <xsl:param name="style.epigraphAttribution.level">0</xsl:param>
  <xsl:param name="style.epigraphAttribution.name">Epigraph_20_Attribution</xsl:param>

  <xsl:param name="style.para.level">0</xsl:param>
  <xsl:param name="style.para.name">Paragraph</xsl:param>

  <xsl:param name="style.paraCover.parentStyle"></xsl:param>
  <xsl:param name="style.paraCover.breakBefore"></xsl:param>
  <xsl:param name="style.paraCover.font" select="$style.font"/>
  <xsl:param name="style.paraCover.fontStyle"/>
  <xsl:param name="style.paraCover.fontWeight"/>
  <xsl:param name="style.paraCover.level">0</xsl:param>
  <xsl:param name="style.paraCover.lineHeight">100%</xsl:param>
  <xsl:param name="style.paraCover.marginBottom">0in</xsl:param>
  <xsl:param name="style.paraCover.marginLeft">0in</xsl:param>
  <xsl:param name="style.paraCover.marginRight">0in</xsl:param>
  <xsl:param name="style.paraCover.marginTop">0in</xsl:param>
  <xsl:param name="style.paraCover.name">Paragraph</xsl:param>
  <xsl:param name="style.paraCover.page"/>
  <xsl:param name="style.paraCover.size" select="$style.size"/>
  <xsl:param name="style.paraCover.textAlign">center</xsl:param>
  <xsl:param name="style.paraCover.textIndent">0in</xsl:param>

  <xsl:param name="style.paraLegal.breakBefore"/>
  <xsl:param name="style.paraLegal.font"/>
  <xsl:param name="style.paraLegal.fontStyle"/>
  <xsl:param name="style.paraLegal.fontWeight"/>
  <xsl:param name="style.paraLegal.level"/>
  <xsl:param name="style.paraLegal.lineHeight"/>
  <xsl:param name="style.paraLegal.marginBottom" select="$style.size"/>
  <xsl:param name="style.paraLegal.marginLeft"/>
  <xsl:param name="style.paraLegal.marginRight"/>
  <xsl:param name="style.paraLegal.marginTop"/>
  <xsl:param name="style.paraLegal.name" select="'Legal_20_Notice'"/>
  <xsl:param name="style.paraLegal.page"/>
  <xsl:param name="style.paraLegal.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraLegal.size"/>
  <xsl:param name="style.paraLegal.textAlign"/>
  <xsl:param name="style.paraLegal.textIndent" select="'0in'"/>

  <xsl:param name="style.paraNote.breakBefore"/>
  <xsl:param name="style.paraNote.font"/>
  <xsl:param name="style.paraNote.fontStyle"/>
  <xsl:param name="style.paraNote.fontWeight"/>
  <xsl:param name="style.paraNote.level"/>
  <xsl:param name="style.paraNote.lineHeight"/>
  <xsl:param name="style.paraNote.marginBottom"/>
  <xsl:param name="style.paraNote.marginLeft"/>
  <xsl:param name="style.paraNote.marginRight"/>
  <xsl:param name="style.paraNote.marginTop"/>
  <xsl:param name="style.paraNote.name" select="'Note'"/>
  <xsl:param name="style.paraNote.page"/>
  <xsl:param name="style.paraNote.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraNote.size"/>
  <xsl:param name="style.paraNote.textAlign"/>
  <xsl:param name="style.paraNote.textIndent"/>

  <xsl:param name="style.paraImportant.breakBefore"/>
  <xsl:param name="style.paraImportant.font"/>
  <xsl:param name="style.paraImportant.fontStyle"/>
  <xsl:param name="style.paraImportant.fontWeight"/>
  <xsl:param name="style.paraImportant.level"/>
  <xsl:param name="style.paraImportant.lineHeight"/>
  <xsl:param name="style.paraImportant.marginBottom"/>
  <xsl:param name="style.paraImportant.marginLeft"/>
  <xsl:param name="style.paraImportant.marginRight"/>
  <xsl:param name="style.paraImportant.marginTop"/>
  <xsl:param name="style.paraImportant.name" select="'Important'"/>
  <xsl:param name="style.paraImportant.page"/>
  <xsl:param name="style.paraImportant.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraImportant.size"/>
  <xsl:param name="style.paraImportant.textAlign"/>
  <xsl:param name="style.paraImportant.textIndent"/>

  <xsl:param name="style.paraWarning.breakBefore"/>
  <xsl:param name="style.paraWarning.font"/>
  <xsl:param name="style.paraWarning.fontStyle"/>
  <xsl:param name="style.paraWarning.fontWeight"/>
  <xsl:param name="style.paraWarning.level"/>
  <xsl:param name="style.paraWarning.lineHeight"/>
  <xsl:param name="style.paraWarning.marginBottom"/>
  <xsl:param name="style.paraWarning.marginLeft"/>
  <xsl:param name="style.paraWarning.marginRight"/>
  <xsl:param name="style.paraWarning.marginTop"/>
  <xsl:param name="style.paraWarning.name" select="'Warning'"/>
  <xsl:param name="style.paraWarning.page"/>
  <xsl:param name="style.paraWarning.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraWarning.size"/>
  <xsl:param name="style.paraWarning.textAlign"/>
  <xsl:param name="style.paraWarning.textIndent"/>

  <xsl:param name="style.paraCaution.breakBefore"/>
  <xsl:param name="style.paraCaution.font"/>
  <xsl:param name="style.paraCaution.fontStyle"/>
  <xsl:param name="style.paraCaution.fontWeight"/>
  <xsl:param name="style.paraCaution.level"/>
  <xsl:param name="style.paraCaution.lineHeight"/>
  <xsl:param name="style.paraCaution.marginBottom"/>
  <xsl:param name="style.paraCaution.marginLeft"/>
  <xsl:param name="style.paraCaution.marginRight"/>
  <xsl:param name="style.paraCaution.marginTop"/>
  <xsl:param name="style.paraCaution.name" select="'Caution'"/>
  <xsl:param name="style.paraCaution.page"/>
  <xsl:param name="style.paraCaution.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraCaution.size"/>
  <xsl:param name="style.paraCaution.textAlign"/>
  <xsl:param name="style.paraCaution.textIndent"/>

  <xsl:param name="style.paraTip.breakBefore"/>
  <xsl:param name="style.paraTip.font"/>
  <xsl:param name="style.paraTip.fontStyle"/>
  <xsl:param name="style.paraTip.fontWeight"/>
  <xsl:param name="style.paraTip.level"/>
  <xsl:param name="style.paraTip.lineHeight"/>
  <xsl:param name="style.paraTip.marginBottom"/>
  <xsl:param name="style.paraTip.marginLeft"/>
  <xsl:param name="style.paraTip.marginRight"/>
  <xsl:param name="style.paraTip.marginTop"/>
  <xsl:param name="style.paraTip.name" select="'Tip'"/>
  <xsl:param name="style.paraTip.page"/>
  <xsl:param name="style.paraTip.parentStyle">Paragraph</xsl:param>
  <xsl:param name="style.paraTip.size"/>
  <xsl:param name="style.paraTip.textAlign"/>
  <xsl:param name="style.paraTip.textIndent"/>

  <xsl:param name="style.sect1.level">2</xsl:param>
  <xsl:param name="style.sect1.name">Heading_20_2</xsl:param>

  <xsl:param name="style.sect2.level">3</xsl:param>
  <xsl:param name="style.sect2.name">Heading_20_3</xsl:param>

  <xsl:param name="style.sect3.level">4</xsl:param>
  <xsl:param name="style.sect3.name">Heading_20_4</xsl:param>

  <xsl:param name="style.sect4.level">5</xsl:param>
  <xsl:param name="style.sect4.name">Heading_20_5</xsl:param>

  <xsl:param name="style.sect5.level">6</xsl:param>
  <xsl:param name="style.sect5.name">Heading_20_6</xsl:param>

  <xsl:param name="style.toc1.name">Contents_20_1</xsl:param>

  <!-- ODF Settings -->
  <xsl:param name="generate.title.with.cover">1</xsl:param>

  <!-- Table of Contents Levels -->
  <xsl:param name="toc.article">0</xsl:param>
  <xsl:param name="toc.book">0</xsl:param>
  <xsl:param name="toc.chapter">1</xsl:param>
  <xsl:param name="toc.appendix">1</xsl:param>

  <!-- Common -->
  <xsl:param name="appendix.autolabel">A</xsl:param>
  <xsl:param name="author.othername.in.middle" select="1"/>
  <xsl:param name="chapter.autolabel" select="1"/>
  <xsl:param name="component.label.includes.part.label" select="0"/>
  <xsl:param name="generate.section.toc.level">0</xsl:param>
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

  <!-- This uses the standard generate.toc parameters, but we also add 'after' to indicate that the tables should come after the contents (this lets us format for ebooks. -->
  <xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation,after
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

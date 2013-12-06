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
  <!-- Output Settings -->
  <xsl:decimal-format name="staff" digit="D" />
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

  <!-- Inclues -->
  <xsl:include href="param.xsl"/>

  <xsl:include href="../lib/lib.xsl"/>
  <xsl:include href="../common/common.xsl"/>
  <xsl:include href="../common/gentext.xsl"/>
  <xsl:include href="../common/l10n.xsl"/>
  <xsl:include href="../common/labels.xsl"/>
  <xsl:include href="../common/titles.xsl"/>

  <xsl:include href="fonts.xsl"/>
  <xsl:include href="styles.xsl"/>

  <xsl:include href="document-manifest.xsl"/>
  <xsl:include href="document-meta.xsl"/>
  <xsl:include href="document-content.xsl"/>
  <xsl:include href="document-styles.xsl"/>

  <xsl:include href="book.xsl"/>
  <xsl:include href="chapter.xsl"/>

  <xsl:include href="block.xsl"/>
  <xsl:include href="quote.xsl"/>

  <!--
	  Generate the entire ODF file in a single XML document. Then,
	  `odf.xsl` is used to break it into separate output files.
  -->
  <xsl:template match="/">
	<office:document>
	  <!-- Write out the contents for meta.xml -->
	  <xsl:call-template name="document-meta" />

	  <!-- Write out the contents for content.xml -->
	  <xsl:call-template name="document-content" />

	  <!-- Write out the contents for styles.xml -->
	  <xsl:call-template name="document-styles" />

	  <!-- Write out the contents for manifest.xml -->
	  <xsl:call-template name="document-manifest" />
	</office:document>
  </xsl:template>

  <!-- Common Ignored Elements -->
  <xsl:template match="d:info"/>

  <!-- Common Elements -->
  <xsl:template match="*">
  </xsl:template>

  <xsl:template match="text()">
	<xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>

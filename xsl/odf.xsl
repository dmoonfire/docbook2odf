<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	version="1.0">
  <!-- Parameters -->
  <xsl:param name="part" select="content" />

  <!-- Output Settings -->
  <xsl:decimal-format name="staff" digit="D" />
  <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

  <!--
	  Parses the generated document (via `docbook.xsl`) and splits it out
	  into its component parts.
  -->
  <xsl:template match="/">
	<xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="office:document">
	<xsl:choose>
	  <xsl:when test="$part = 'meta'">
		<xsl:copy-of select="/office:document/office:document-meta" />
	  </xsl:when>
	  <xsl:when test="$part = 'content'">
		<xsl:copy-of select="/office:document/office:document-content" />
	  </xsl:when>
	  <xsl:when test="$part = 'styles'">
		<xsl:copy-of select="/office:document/office:document-styles" />
	  </xsl:when>
	  <xsl:when test="$part = 'manifest'">
		<xsl:copy-of select="/office:document/manifest:manifest" />
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:copy-of select="/office:document/office:document-content" />
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
</xsl:stylesheet>

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
		version="1.0">
	
<!--
		xmlns:ooo="http://openoffice.org/2004/office"
		xmlns:ooow="http://openoffice.org/2004/writer"
		xmlns:oooc="http://openoffice.org/2004/calc"
-->
	
	
<!-- SETTINGS -->
<xsl:decimal-format name="staff" digit="D" />
<xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
<!--<xsl:strip-space elements="*"/>-->
<!--<xsl:preserve-space elements=""/>-->


<xsl:include href="param.xsl"/>
<xsl:include href="document-meta.xsl"/>
<xsl:include href="document-styles.xsl"/>
<xsl:include href="document-content.xsl"/>
<xsl:include href="manifest.xsl"/>
<xsl:include href="common/common.xsl"/>

<!-- http://www.docbook.org/tdg/en/html-ng/ -->
<xsl:include href="article.xsl"/>
<xsl:include href="book.xsl"/>
<xsl:include href="slides.xsl"/>

<!-- OVERLAY WITH CORPORATE IDENTITY OR ANYTHING ELSE -->
<xsl:include href="overlay/default.xsl"/>

<xsl:template match="/">
	
	<!-- top-level container is important for parsing output document -->
	<xsl:element name="office:document">
		
		
		<xsl:call-template name="manifest"/> <!-- manifest.xsl -->
		
		
		<xsl:element name="office:document-meta">
			<xsl:call-template name="document-meta"/>
		</xsl:element>
		
		
		<xsl:element name="office:document-styles">
			
			<xsl:element name="office:font-face-decls">
				<xsl:call-template name="document.font-face-decls"/>
			</xsl:element>
			
			<xsl:element name="office:styles">
				<xsl:call-template name="document-styles.office-styles"/>
			</xsl:element>
			
			<xsl:element name="office:automatic-styles">
				<xsl:call-template name="document-styles.page-layout"/>
				<xsl:call-template name="document-styles.automatic-styles"/>
				<!-- corporate identity -->
				<xsl:call-template name="CI.document-styles.automatic-styles"/>
			</xsl:element>
			
			<xsl:element name="office:master-styles">
				<xsl:call-template name="document-styles.master-styles"/>
			</xsl:element>
			
		</xsl:element>
		
		
		<xsl:element name="office:document-content">
			
			<xsl:element name="office:automatic-styles">
				<xsl:call-template name="document-content.automatic-styles.paragraph"/>
				<xsl:call-template name="document-content.automatic-styles.text"/>
				<xsl:call-template name="document-content.automatic-styles.list"/>
				<xsl:call-template name="document-content.automatic-styles.graphic"/>
				<xsl:call-template name="document-content.automatic-styles.date"/>
				<xsl:call-template name="document-content.automatic-styles.table"/>
				<xsl:if test="/slides">
					<xsl:call-template name="document-content.automatic-styles.drawing-page"/>
					<xsl:call-template name="document-content.automatic-styles.presentation"/>
				</xsl:if>
				<xsl:if test="/article">
					<xsl:call-template name="document-content.automatic-styles.section"/>
				</xsl:if>
				<xsl:if test="/book">
					<xsl:call-template name="document-content.automatic-styles.section"/>
				</xsl:if>
				<!-- corporate identity -->
				<xsl:call-template name="CI.document-content.automatic-styles"/>
			</xsl:element>
			
			<!-- same font declarations as in document-styles -->
			<xsl:element name="office:font-face-decls">
				<xsl:call-template name="document.font-face-decls"/>
			</xsl:element>
			
			<xsl:element name="office:body">
				<xsl:apply-templates/> <!-- call for article|book|slides -->
			</xsl:element>
			
		</xsl:element>
		
		
	</xsl:element>
	
</xsl:template>




</xsl:stylesheet>

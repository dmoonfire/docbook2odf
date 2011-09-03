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


<xsl:template match="docbook:formalpara">
	<text:p
		text:style-name="Heading-para">
		<xsl:value-of select="docbook:title"/>
	</text:p>
	<xsl:apply-templates/>
</xsl:template>


<!-- earlier rendered -->
<xsl:template match="docbook:formalpara/docbook:title"/>


<xsl:template match="docbook:para|docbook:simpara">
	<xsl:choose>
		<!-- all docbook elements that would be transformed as a odf:paragraph -->
		<!-- opendocument can't cointain text:p in text:p                      -->
		<!-- also all block elements by                                        -->
		<!-- http://www.docbook.org/tdg/en/html/para.html                      -->
		<!-- abbrev, acronym, action, address, anchor, application, author, authorinitials, beginpage, bibliolist, biblioref, blockquote, calloutlist, caution, citation, citebiblioid, citerefentry, citetitle, classname, classsynopsis, cmdsynopsis, code, command, computeroutput, constant, constructorsynopsis, corpauthor, corpcredit, database, destructorsynopsis, email, emphasis, envar, equation, errorcode, errorname, errortext, errortype, example, exceptionname, fieldsynopsis, figure, filename, firstterm, footnote, footnoteref, foreignphrase, funcsynopsis, function, glosslist, glossterm, graphic, graphicco, guibutton, guiicon, guilabel, guimenu, guimenuitem, guisubmenu, hardware, important, indexterm, informalequation, informalexample, informalfigure, informaltable, inlineequation, inlinegraphic, inlinemediaobject, interface, interfacename, itemizedlist, keycap, keycode, keycombo, keysym, link, literal, literallayout, markup, medialabel, mediaobject, mediaobjectco, menuchoice, methodname, methodsynopsis, modespec, mousebutton, nonterminal, note, olink, ooclass, ooexception, oointerface, option, optional, orderedlist, orgname, othercredit, package, parameter, personname, phrase, productname, productnumber, programlisting, programlistingco, prompt, property, quote, remark, replaceable, returnvalue, revhistory, screen, screenco, screenshot, segmentedlist, sgmltag, simplelist, structfield, structname, subscript, superscript, symbol, synopsis, systemitem, table, termdef, tip, token, trademark, type, ulink, uri, userinput, variablelist, varname, warning, wordasword, xref -->
		<xsl:when test="
			child::docbook:itemizedlist|
			child::docbook:orderedlist|
			child::docbook:abstract|
			child::docbook:screen
			">
			<!-- continue without text:p creation to child element -->
			
			<!-- when in this block is some text, display it in paragraph -->
			<!-- this is not functional
			<text:p>
				<xsl:value-of select="string(.)"/>
			</text:p>
			-->
			<!-- call template for each found element -->
			<xsl:for-each select="*">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="paragraph"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="docbook:para" mode="notes">
	<xsl:choose>
		<xsl:when test="
			child::docbook:itemizedlist|
			child::docbook:orderedlist|
			child::docbook:abstract|
			child::docbook:simpara
			">
			<!-- continue without text:p creation -->
			<xsl:apply-templates mode="notes"/>
		</xsl:when>
		<xsl:otherwise>
			
			<xsl:element name="text:p">
				<xsl:attribute name="text:style-name">para-notes</xsl:attribute>
				<xsl:apply-templates mode="notes"/>
			</xsl:element>
			
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="paragraph">
	
	<xsl:variable name="position" select="position()"/>
	<xsl:variable name="position_div" select="position() div 2"/>
	<xsl:variable name="parent-previous" select="count(../preceding-sibling::node())"/>
	<xsl:variable name="nodes-in-previous" select="count(../preceding-sibling::listitem[$position_div]/*)"/>
	
	<text:p>
		
		<xsl:attribute name="text:style-name">
			<xsl:choose>
				
				<!-- deep magic part -->
				<xsl:when test="parent::docbook:listitem|parent::docbook:step">
					
					<xsl:choose>
						
						<xsl:when test="ancestor::docbook:varlistentry">para-padding-odd</xsl:when>
						
						<!-- if paragraph is first in listitem                                 -->
						<!-- this paragraph is as title of listitem                            -->
						<xsl:when test="$position=2">
							<xsl:choose>
								<!-- very very very ugly hack :) but works very good :))))       -->
								<!-- http://blogs.msdn.com/asanto/archive/2004/09/08/226663.aspx -->
								<xsl:when test="$parent-previous = 1">para-list-begin</xsl:when>
								
								<!-- my very nice hack                                           -->
								
								<!-- when previous listitem has more than one element            -->
								
								<xsl:when test="$nodes-in-previous>1">para-list-padding</xsl:when>
								
								
								<xsl:when test="../../@spacing='compact'">para-list-compact</xsl:when>
								<xsl:when test="parent::docbook:orderedlist/@spacing='compact'">para-list-compact</xsl:when>
								<xsl:when test="parent::docbook:itemizedlist/@spacing='compact'">para-list-compact</xsl:when>
								<xsl:otherwise>para-list-padding</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						
						<!-- all next paragraph in listitem -->
						<xsl:otherwise>
							<!--<xsl:text>para-padding</xsl:text>-->
							<xsl:choose>
								<xsl:when test="../../@spacing='compact'">para-list-compact</xsl:when>
								<xsl:otherwise>para-padding</xsl:otherwise>
							</xsl:choose>
							
						</xsl:otherwise>
						
					</xsl:choose>
				</xsl:when>
				
				
				<xsl:when test="parent::docbook:blockquote">para-blockquote</xsl:when>
				
				<xsl:otherwise>para-padding</xsl:otherwise>
				
			</xsl:choose>
		</xsl:attribute>
		
		<xsl:apply-templates/>
		
	</text:p>
	
</xsl:template>


</xsl:stylesheet>
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
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:office="http://openoffice.org/2000/office"
	xmlns:style="http://openoffice.org/2000/style"
	xmlns:text="http://openoffice.org/2000/text"
	xmlns:table="http://openoffice.org/2000/table"
	xmlns:draw="http://openoffice.org/2000/drawing"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:meta="http://openoffice.org/2000/meta"
	xmlns:number="http://openoffice.org/2000/datastyle"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:chart="http://openoffice.org/2000/chart"
	xmlns:dr3d="http://openoffice.org/2000/dr3d"
	xmlns:math="http://www.w3.org/1998/Math/MathML"
	xmlns:form="http://openoffice.org/2000/form"
	xmlns:script="http://openoffice.org/2000/script"
	xmlns:config="http://openoffice.org/2001/config"
	office:class="text"
	office:version="1.0">


<xsl:template match="para">
	<xsl:choose>
		<!-- all child elements that can contain para -->
		<!-- to be continued... :) -->
		<xsl:when test="
			child::itemizedlist|
			child::orderedlist|
			child::abstract|
			child::simpara
			">
			<!-- continue without text:p creation -->
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="paragraph"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="para" mode="notes">
	<xsl:choose>
		<!-- all child elements that can contain para -->
		<!-- to be continued... :) -->
		<xsl:when test="
			child::itemizedlist|
			child::orderedlist|
			child::abstract|
			child::simpara
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

	<xsl:element name="text:p">
		
		<xsl:attribute name="text:style-name">
			<xsl:choose>
				
				<!-- deep magic -->
				<xsl:when test="parent::listitem">
					<xsl:choose>
						<!-- all next paragraph in listitem -->
						<xsl:when test="not(position()=1)">para-padding</xsl:when>
						<!-- if paragraph is first in listitem -->
						<xsl:otherwise>
							<xsl:choose>
								<!-- if listitem is first in itemizedlist                        -->
								<!-- very very very ugly hack :) but works very good :))))       -->
								<!-- http://blogs.msdn.com/asanto/archive/2004/09/08/226663.aspx -->
								
								<xsl:when test="count(../preceding-sibling::node()) = 0">para-list-begin</xsl:when>
								
								<!-- my very nice hack                                           -->
								<xsl:when test="../preceding-sibling::listitem[position()=1]/*[2]">para-list-padding</xsl:when>
								<xsl:when test="../../@spacing='compact'">para-list-compact</xsl:when>
								<xsl:when test="parent::orderedlist/@spacing='compact'">para-list-compact</xsl:when>
								<xsl:when test="parent::itemizedlist/@spacing='compact'">para-list-compact</xsl:when>
								<xsl:otherwise>para-list-padding</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				
				
				<xsl:when test="parent::blockquote">para-blockquote</xsl:when>
				
				<xsl:otherwise>para-padding</xsl:otherwise>
				
			</xsl:choose>
		</xsl:attribute>
		
		<xsl:apply-templates/>
		
	</xsl:element>

</xsl:template>











</xsl:stylesheet>
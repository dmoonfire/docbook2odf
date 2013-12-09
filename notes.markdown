---
Title: Notes
---

# Tasks for Submissions

* Headers and footers

  <style for paragraphs>
    <style:tab-stops>
      <style:tab-stop style:position="3.25in" style:type="center"/>
  	  <style:tab-stop style:position="6.5in" style:type="right"/>
    </style:tab-stops>
  </style>
  
  <style:master-page style:name="Standard" style:page-layout-name="Mpm1">
    <style:header>
	  <text:p text:style-name="MP1">
        Header
  	    <text:tab/>
 	    lkjsdf
	    <text:tab/>
	    lkjsdf
	  </text:p>
	</style:header>
	<style:footer>
	  <text:p text:style-name="MP2">
	    Footer
	    <text:tab/>
	    lkjsdf
	    <text:tab/>
	    lkjsdfdsf
	  </text:p>
    </style:footer>
  </style:master-page>

* Address and word counts on first page
* List (ordered and unordered) handling
* Move odf.xsl into a common location
* Allow for single-file style selection

# Tasks to Consider

* Handling TOC generation closer to the other versions
  * Still allow for trailing TOC (for ebooks)
  
# Previous Version Handled

* verbatim.xsl
  * screen, programlisting, synopsis
* synop.xsl (programming inlines)
  * varname, filename, constant, guilabel, guibutton, guimenu
  * accel
* section.xsl
  * d:section|d:sect1(-5)
  * above/d:subtitle
  * above/d:title
* notes.xsl (slides)
* lists.xsl
  * d:task
  * d:task/d:title
  * d:taskprerequisites
  * d:procedure
  * d:itemizedlist
  * d:orderedlist
  * above/d:title
  * d:listitem|d:step
  * d:variablelist
  * d:varlistentry (plus d:term)
  * d:varlistentry/d:listitem
* info.xsl
  * Formatting of authors, names, copyrights
* chapter.xsl
  * Handle chapter at the root
  * Handle chapter in book
* block.xsl
  * d:blockquote
* tables.xsl
  * handling tables
* slides.xsl
  * handling slides
* paragraph.xsl
  * d:formalpara (has d:title)
* inline.xsl
  * d:email
  * d:uri
  * d:credit
* bibliography.xsl
  * Lots of stuff
* article.xsl
  * Top-level and book-level

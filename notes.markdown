---
Title: Things that need to be done
---

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
* media.xsl
  * images
* inline.xsl
  * d:quote, d:email, d:uri, d:ulink, d:emphasis, d:emphasis[@role='strong']
  * d:emphasis[@role='bold']
  * d:emphasis[@role='underline']
  * d:emphasis[@role='strikethrough']
  * d:superscript
  * d:subscript
  * d:credit
* bibliography.xsl
  * Lots of stuff
* article.xsl
  * Top-level and book-level
* admonitions.xsl
  * tip
  * note
  * warning
  * caution
  * important

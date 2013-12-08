---
Title: Notes
---

# Tasks for Writing

* Notes, info, warnings, etc.
* Nested quotes, both fancy and non-fancy.
  * ``, `, ", '
  * ``, `, ``, `
  * ", ', ", '

# Tasks for Submissions

* Headers and footers
* Address and word counts on first page
* List (ordered and unordered) handling
* Move odf.xsl into a common location
* Allow for single-file style selection

# Tasks for Smashwords

* Legal section
* Links (xlinks)
* Insert cover image

# Tasks to Consider

* Handling TOC generation closer to the other versions
  * Still allow for trailing TOC (for ebooks)
  
# Generic Tasks

* Handling non-namespaced versions of input files

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
* media.xsl
  * images
* inline.xsl
  * d:email
  * d:uri
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

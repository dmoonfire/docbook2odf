# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="XSL Stylesheets for docbook2odf"
HOMEPAGE="http://open.comsultia.com/docbook2odf/"
SRC_URI="http://open.comsultia.com/docbook2odf/dwn/docbook2odf-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND="!app-text/docbook2odf-xsl-stylesheets-svn"

src_install() {
	WORKDIR=${WORKDIR}/docbook2odf-${PV};
	DEST="/usr/share/docbook2odf/xsl"
	
	insinto ${DEST}
	doins ${WORKDIR}/xsl/*
	
	dodir ${DEST}/document-content
	insinto ${DEST}/document-content
	doins ${WORKDIR}/xsl/document-content/*
	
	dodir ${DEST}/document-styles
	insinto ${DEST}/document-styles
	doins ${WORKDIR}/xsl/document-styles/*
	
	dodir ${DEST}/overlay
	insinto ${DEST}/overlay
	doins ${WORKDIR}/xsl/overlay/*
	
}
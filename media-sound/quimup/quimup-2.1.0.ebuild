# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop qmake-utils

DESCRIPTION="Qt6 client for the music player daemon (MPD)"
HOMEPAGE="https://sourceforge.net/projects/quimup/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${PN^}-${PV}.source.tar.gz"
S="${WORKDIR}/${PN^}-${PV}.source"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-qt/qtbase:6[network,widgets]
	>=media-libs/libmpdclient-2.3
	media-libs/taglib
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( changelog faq readme )

src_configure() {
	eqmake6
}

src_install() {
	default
	dobin ${PN}

	newicon src/resources/mn_icon.png ${PN}.png
	make_desktop_entry ${PN} Quimup
}

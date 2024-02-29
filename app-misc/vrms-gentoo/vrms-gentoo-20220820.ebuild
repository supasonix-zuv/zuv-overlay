# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

COMMIT="6ee80b51b8eeac4e67d8fbe53008b5534273e521"

SRC_URI="https://github.com/z411/vrms-gentoo/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="vrms clone for Gentoo Linux"
HOMEPAGE="https://github.com/z411/vrms-gentoo"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	dev-lang/perl
"

S="${WORKDIR}/${PN}-${COMMIT}"

src_install() {
	default

	dobin "${PN}"
}

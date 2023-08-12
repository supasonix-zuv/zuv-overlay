# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1 desktop xdg-utils

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="http://chirp.danplanet.com"
SRC_URI="https://trac.chirp.danplanet.com/chirp_next/next-${PV}/chirp-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="radioreference"
KEYWORDS="~amd64"

S="${WORKDIR}/chirp-${PV}"

DEPEND="${PYTHON_DEPS}
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/requests
	dev-python/six
	dev-python/future
	dev-python/yattag
	dev-libs/libxml2[python]"
RDEPEND="${DEPEND}
	dev-python/wxpython[${PYTHON_USEDEP}]
	radioreference? ( dev-python/suds-community[${PYTHON_USEDEP}] )"

src_prepare() {
	distutils-r1_src_prepare
}

python_test() {
	pushd tests > /dev/null
	"${PYTHON}" run_tests || die
	popd > /dev/null
}

pkg_postinst() {
	make_desktop_entry "chirp" "Chirp Next" "/usr/lib/${EPYTHON}/site-packages/chirp/share/chirp.ico"\
		"Utility;HamRadio;Programming;Handheld;Radio;Amateur;Programmer"
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Get TiTS today!"
HOMEPAGE="https://fenoxo.com/"
SRC_URI="https://fenoxo.com/play/latest_tits_electron_linux.php -> ${P}.tar.gz"

S="${WORKDIR}/TiTS-public-${PV}-linux"

RESTRICT="mirror"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DIR="/opt/${PN}"

src_install() {
	insinto /opt/${PN}
	doins -r "${S}"/.

	fperms +x /opt/${PN}/tits

	newicon -s 512 "${WORKDIR}"/TiTS-public-${PV}-linux/resources/app/resources/icons/android-chrome-512x512.png trials-in-tainted-space-public.png

	make_desktop_entry /opt/${PN}/tits "Trials in Tainted Space" "" "Game;"
}

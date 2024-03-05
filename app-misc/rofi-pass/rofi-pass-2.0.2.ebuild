# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pass plugin for Rofi"
HOMEPAGE="https://github.com/canager/rofi-pass"
SRC_URI="https://github.com/carnager/rofi-pass/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="mirror"

KEYWORDS="~amd64 ~x86 ~arm ~arm64"
LICENSE="GPL-3"
SLOT="0"

IUSE="X wayland OTP"

RDEPEND="${DEPEND}
	app-admin/pass
	sys-apps/sed
	x11-misc/rofi
	X? ( x11-misc/xdotool x11-misc/xclip )
	wayland? ( gui-apps/wtype gui-apps/wl-clipboard )
	sys-apps/gawk
	>=app-shells/bash-4.0
	sys-apps/findutils
	app-admin/pwgen
	OTP? ( app-admin/pass-otp )"
DEPEND="${RDEPEND}"

src_prepare(){
	default
	#I don't know how to skip compilation
	#the makefile breaks sandbox so it's gotta go
	rm Makefile || die
	mv config.example rofi-pass-example.config

}

src_install(){
	local doc="${EPREFIX}/usr/share/doc/${PF}"
	docinto /usr/share/doc
	dodoc README.md
	dodoc rofi-pass-example.config

	exeinto /usr/bin
	doexe rofi-pass
	doexe addpass

	elog "An example config has been placed into ${doc}"
}

# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Application that queries the user for a selection for printing"
HOMEPAGE="https://github.com/naelstrof/slop"
SRC_URI="https://github.com/naelstrof/slop/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0/${PV}"
IUSE="opengl icu"

RDEPEND="
	icu? ( dev-libs/icu:= )
	x11-libs/libX11
	x11-libs/libXext
	opengl? (
		media-libs/glew:0=
		media-libs/libglvnd
		virtual/opengl
		x11-libs/libXrender:=
	)
"
BDEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"
DEPEND="
	${RDEPEND}
	media-libs/glm
"

#gentoo bug #933863
PATCHES=( "${FILESDIR}/${PN}"-7.6-r1-cxx-11-to-17.patch )

src_configure() {
	local mycmakeargs=(
		-DSLOP_OPENGL=$(usex opengl)
		-DSLOP_UNICODE=$(usex icu)
	)
	cmake_src_configure
}

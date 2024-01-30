# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 font

DESCRIPTION="An iconic bitmap font based on Stlarch with additional glyphs"
HOMEPAGE="https://github.com/stark/siji"

EGIT_REPO_URI="https://github.com/stark/siji.git"

SRC_URI=""
KEYWORDS=""

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(Readme.md)
FONT_S=(${S}/pcf)

# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# inherit lists eclasses to inherit functions from. For example, an ebuild
# that needs the eautoreconf function from autotools.eclass won't work
# without the following line:
inherit desktop

MY_PN="homestuck"
DESCRIPTION="Have you heard of homestuck?"
HOMEPAGE="https://bambosh.dev/unofficial-homestuck-collection/"
SRC_URI="https://github.com/Bambosh/unofficial-homestuck-collection/releases/download/v${PV}/unofficial-homestuck-collection-${PV}.tar.gz"

S="${WORKDIR}/unofficial-homestuck-collection-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

DIR="/opt/${PN}"

pkg_nofetch() {
	einfo "Please download the 4gb asset pack from:"
	einfo "https://bambosh.dev/unofficial-homestuck-collection/#download"
	einfo "and move it to your distfiles directory."
}

src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
	insinto /opt/${PN}
	doins -r "${S}"/.

	fperms +x /opt/${PN}/unofficial-homestuck-collection

	newicon -s 1024 "${FILESDIR}"/icon.png unofficial-homestuck-collection.png

	make_desktop_entry /opt/${PN}/unofficial-homestuck-collection "Homestuck-bin" "" "Game;"
}

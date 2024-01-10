# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop autotools

#inherit autotools check-reqs desktop flag-o-matic gnome2-utils linux-info llvm multiprocessing \
#	optfeature pax-utils python-any-r1 readme.gentoo-r1 toolchain-funcs virtualx xdg

DESCRIPTION="The floorp web browser, made in Japan"

HOMEPAGE="https://floorp.app/"

SRC_URI="https://github.com/Floorp-Projects/Floorp/releases/download/v${PV}/floorp-${PV}.linux-x86_64.tar.bz2"

S="${WORKDIR}/floorp"

LICENSE="MPL-2.0 GPL-2 LGPL-2.1"

SLOT="0"

KEYWORDS="~amd64 ~arm64"

# Comprehensive list of any and all USE flags leveraged in the ebuild,
# with some exceptions, e.g., ARCH specific flags like "amd64" or "ppc".
# Not needed if the ebuild doesn't use any USE flags.
#IUSE="gnome X"

# A space delimited list of portage features to restrict. man 5 ebuild
# for details.  Usually not needed.
RESTRICT="mirror"

RDEPEND=">=sys-libs/glibc-2.17
		>=x11-base/xorg-server-1.7
		>=x11-libs/gtk+-3.14
		>=dev-libs/dbus-glib-0.110
		>=dev-libs/glib-2.42
		>=sys-devel/gcc-4.8.1[cxx]
		>=x11-libs/libXtst-1.2.3
"

DEPEND="${RDEPEND}"

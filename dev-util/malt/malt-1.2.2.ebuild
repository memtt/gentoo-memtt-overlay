# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A memory allocation profiling tool for C/C++/Fortran."
HOMEPAGE="https://memtt.github.io/malt/"
SRC_URI="https://github.com/memtt/malt/releases/download/v${PV}/malt-${PV}.tar.bz2"
LICENSE="CeCILL-C"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 webengine test"
RESTRICT="!test? ( test )"
DEPEND="
	virtual/libelf
	sys-libs/libunwind
	qt5? ( webengine? ( dev-qt/qtcore:5 dev-qt/qtgui:5 dev-qt/qtwebengine:5 ) )
"
RDEPEND="
	${DEPEND}
	net-libs/nodejs
	sys-devel/binutils
"

src_configure() {
	mycmakeargs=(
		-DENABLE_TESTS=$(usex test)
	)
	cmake_src_configure
}

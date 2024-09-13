# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A NUMA memoryprofiling tool for C/C++/Fortran."
HOMEPAGE="https://memtt.github.io/numaprof/"
SRC_URI="https://github.com/memtt/numaprof/releases/download/v${PV}/numaprof-${PV}.tar.bz2"
LICENSE="CeCILL-C"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5 webengine test"
RESTRICT="!test? ( test )"
DEPEND="
	sys-apps/hwloc
	sys-process/numactl
	dev-util/intel-pin
	>=dev-lang/python-3.5
	qt5? ( webengine? ( dev-qt/qtcore:5 dev-qt/qtgui:5 dev-qt/qtwebengine:5 ) )
"
RDEPEND="
	${DEPEND}
"
PATCHES="
	${FILESDIR}/${P}-0001-fix-Fix-include-issue-missing-cstdint-on-Gentoo.patch
	${FILESDIR}/${P}-0002-fix-Lib-dir-install-on-Gentoo.patch
"

src_configure() {
	mycmakeargs=(
		-DENABLE_TESTS=$(usex test)
		-DPINTOOL_PREFIX=/opt/intel-pin
	)
	cmake_src_configure
}

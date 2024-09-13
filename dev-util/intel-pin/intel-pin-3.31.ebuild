# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Pin is a dynamic binary instrumentation framework for the the IA-32 and x86-64 instruction-set architectures that enables the creation of dynamic program analysis tools"
HOMEPAGE="https://www.intel.com/content/www/us/en/developer/articles/tool/pin-a-dynamic-binary-instrumentation-tool.html"
SRC_URI="https://github.com/memtt/numaprof/releases/download/v${PV}/numaprof-${PV}.tar.bz2"
SRC_HASH="98869-gfa6f126a8"
SRC_URI="https://software.intel.com/sites/landingpage/pintool/downloads/pin-external-${PV}-${SRC_HASH}-gcc-linux.tar.gz"
LICENSE="ISSL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/pin-external-${PV}-${SRC_HASH}-gcc-linux"

src_install() {
	# sources
        SPOTIFY_PKG_HOME=./*

	# install in /opt/intel-pin
	SPOTIFY_HOME=/opt/intel-pin
	insinto ${SPOTIFY_HOME}
	exeinto ${SPOTIFY_HOME}
	doins -r ./*
	doexe pin
	doexe pin.sig
}

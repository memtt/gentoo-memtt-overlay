Gentoo memtt overlay
====================

This repository define a Gentoo Overlay to be able to install MALT & NUMAPROF
as packaged in the system.

Usage
-----

You first need to import the overlay :

```sh
# import the repo
sudo eselect repository add gentoo-memtt-overlay git https://github.com/memtt/gentoo-memtt-overlay.git
```

You can then enable it :

```
sudo eselect repository enable memtt
```

You can finally just install `malt` and `numaprof` via :

```sh
sudo emerge -a malt numaprof
```


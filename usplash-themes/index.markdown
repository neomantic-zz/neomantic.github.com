---
layout: base
title: Usplash Themes
---
## Usplash Themes

Disappointed with the pixelized Usplash screen that ships by default with
[Debian GNU/Linux](http://www.debian.org/), I created my own using GIMP, Inkscape, and jedit.

I have only released one, but I plan to release more.

### Usplash Debian Swirl

Usplash Debian Swirl features the Debian Swirl Logo prominently and stays true the the Debian.org color palette. This usplash screen supports the following resolutions:

* 1600x1200
* 1365x768
* 1024x768
* 800x600
* 640x480
* 640x400

### ScreenShot
<a href="files/usplash-theme-debian-swirl-screenshot-1024x768.png"><img src="files/usplash-theme-debian-swirl-screenshot-thumb.png" width="288" height="216" alt="Usplash Debian Swirl Screen Shot"/></a>

Click image to enlarge.

### Download

The Debian Package

* usplash-theme-debian-swirl_1.0.0_i386.deb

The Debian Source Packages

* [usplash-theme-debian-swirl_1.0.0.tar.gz](files/usplash-theme-debian-swirl_1.0.0.tar.gz)
* [usplash-theme-debian-swirl_1.0.0.dsc](files/usplash-theme-debian-swirl_1.0.0.dsc)

All these files can also be found at [Debian-art.org](http://www.debian-art.org)


### Installation Instructions

1. su root
2. dpkg -i usplash-theme-debian-swirl_1.0.0_i386.deb
3. update-alternatives --config usplash-artwork.so
4. select the /usr/lib/usplash/usplash-theme-debian-swirl.so file
5. dpkg-reconfigure linux-image-$(uname -r)

### License

The source code is released under the [GNU General Public License Version 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

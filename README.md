# MPlayer/FFmpeg cross build environment

Based on Debian sid and MinGW-w64 (x86/x86\_64)  
Not very suitable for public use, it's still a bit rude  
It may or may not work on your Linux distribution, perhaps it may work on cygwin

## Setup
### Distribution
On my Debian sid I've installed following packages:

    binutils-mingw-w64
    g++-mingw-w64
    gcc-mingw-w64
    mingw-w64
    mingw-w64-tools
    build-essential
    cmake
    autoconf
    automake
    nasm
    yasm
    gperf
    dos2unix
    p7zip-full
    git
    subversion
    mercurial

### Environment
You may adapt some of config variables in `config.sh` (at the toplevel)

- `PREFIX`: where complied stuff is installed
- `CROSS_PREFIX`: set the same path as `PREFIX`
- `HOST`: the default host triplet, if you don't override it

`./setup.sh` script in packages directory will call sudo to change directory permissions
of target `PREFIX`, then it will create a wrapper for pkgconfig.

>If you want to start over remove `/usr/i686-w64-mingw32` for w32 and `/usr/x86_64-w64-mingw32` for w64,
then reinstall `mingw-w64-i686-dev` and `mingw-w64-x86-64-dev` packages.
Avoid deleting `/usr/x86_64-linux-gnu` instead :)

>Make sure to disable binformats or configure scripts will trigger wine execution slowing down configure
and causing misleading detections.

## Build
### Prerequisites
* bash as /bin/bash
* wget
* sudo (for setup.sh script)
* git (for packages from git repositories)
* svn (for packages from svn repositories)
* mercurial (for packages from hg repositories)
* cmake (to build cmake based packages)
* nasm and yasm

### MPlayer/FFmpeg checkouts
In the toplevel directory:

    git clone git://github.com/sherpya/FFmpeg.git ffmpeg
    git clone --recursive git://github.com/sherpya/MPlayer.git mplayer

### Building
`./build-packages.sh` will build all packages in a consistent order.
You can manually build a single package by calling `./build.sh` within the package directory (e.g. packages/libvpx).

>Please note that build shell scripts are supposed to be launched within the same directory they reside so I added **./** before the command.

    MPlayer: the first time will checkout also FFmpeg so it will take a while (yes also the second time)
from the mplayer directory call `../mp.sh configure && make` (you may add -jX)

    FFmpeg:
from the ffmpeg directory call `../ff.sh configure && make` (you may add -jX)

>Build scripts instead need to be launched from the parent directory

### x86\_64
To build x86\_64 packages prepend HOST=x86\_64-w64-mingw32 to each build script, e.g.

    HOST=x86_64-w64-mingw32 ./setup.sh
    HOST=x86_64-w64-mingw32 ./build-packages.sh
    HOST=x86_64-w64-mingw32 ./build.sh

    HOST=x86_64-w64-mingw32 ../mp.sh configure && make

## Updating
* Build Environment: `git pull` on the toplevel directory, I don't force push this repo
* MPlayer: in the mplayer directory `git pull --rebase`, I have no idea about libdvdnav/libdvdread4 submodules updating :(
* FFmpeg: in the ffmpeg directory `git pull --rebase`
* packages using git: `git pull` in the package subdirectory (e.g. packages/libvpx/libvpx)
* packages using subversion: `svn up` in the package subdirectory (e.g. packages/winpthread/winpthread)
* packages that are downloaded have versioned url in the `build.sh` script, you can edit and change version but you must make sure that patches still apply
* live555: just remove `packages/live555/live555-latest.tar.gz`, it will be redownloaded using the latest version.

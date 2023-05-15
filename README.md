# Alpine APKs for Goyawifi

This git contains APKBUILD for packages working with goyawifi.

You can use it to install mesa working with libetnaviv driver configured for, and so on.

## Building

### Docker
Use Dockerfile included:

    docker build -t abuild --progress=plain --output output .

or directly on the tablet as bellow:
### Setup abuild

    addgroup <yourusername> abuild
    mkdir -p /var/cache/distfiles
    chgrp abuild /var/cache/distfiles
    chmod g+w /var/cache/distfiles
    abuild-keygen -a -i

Then cd into a package, e.g. `cd libetnaviv-dev` and:
    
    abuild checksum
    abuild -r

Packages output dir:  `~/packages/<yourusername>/<arch>/`


### Docs on building

https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package

https://wiki.alpinelinux.org/wiki/Abuild_and_Helpers

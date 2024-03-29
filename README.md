# Vianney's Arch Packages

Package sources for all the PKGBUILD I [maintain](https://aur.archlinux.org/packages/?SeB=m&K=vianney), [co-maintain](https://aur.archlinux.org/packages/?SeB=c&K=vianney), or unofficially host modified versions of on my own package repository for my personal use, some of them forked from [aur.archlinux.org](https://aur.archlinux.org) at some point.

## AVR Package Repository

To use [AVR](https://wiki.archlinux.org/index.php/Unofficial_user_repositories#avr), first add [my GPG key](https://pgp.mit.edu/pks/lookup?op=get&search=0x157B08346330029C) to your Pacman keyring:

```sh
pacman-key --keyserver hkps://keys.openpgp.org --recv-keys 157B08346330029C
pacman-key --lsign-key 157B08346330029C
```

Then add the following repository configuration to your `pacman.conf` after the *[community]* repository.

```ini
[avr]
Server = https://bouchaud.org/packages/$repo/$arch
```

## Builds

As previously stated, packages from this repository (most of them) are added to my unoffical repository AVR. I use a script packaged as [aurbuild](https://github.com/vbouchaud/aur/tree/main/aurbuild) to ease this chore, though I should probably setup a github action to do so at some point.

## Credits

Maintained using [aurpublish](https://github.com/eli-schwartz/aurpublish).

Readme shamelessly adapted from [alerque's](https://github.com/alerque/aur) own aur repository.

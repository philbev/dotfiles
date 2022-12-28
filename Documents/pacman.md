# PACMAN CHEATSHEET

## Installation / Updating
Sync the pacman database with force and update or update alias:
```
    sudo pacman -Syyu
```
Install a package:
```
    sudo pacman -S <package>
```

## Package Removal
Remove a package:
```
    sudo pacman -R <package>
```
Remove package and unnecessary dependencies:
```
    sudo pacman -Rs <package>
```
Remove package, unnecessary dependencies and configuration files:
```
    sudo pacman -Rns <package>
```

## Package Queries
### Arch Linux Repositories
Search Arch repository with regular expression:
```
    sudo pacman -Ss <regex>
```
### Local Database
Query package in local database (with no package name, list all installed packages):
```
    pacman -Q <package>
```
List files owned by package:
```
    pacman -Ql <package>
```
Query the package that owns <filename>:
```
    pacman -Qo <filename>
```
Search locally-installed packages:
```
    pacman -Qs <regex>
```
Search for orphaned packages:
```
    pacman -Qdt
```
List packages explicitly installed:
```
    pacman -Qe
```
List packages explicitly installed (without version info):
```
    pacman -Qeq
```
List packages installed from Arch Linux repositories.
```
    pacman -Qn
```
List packages installed from AUR.
```
    pacman -Qm
```

## Package Maintenance
Clean pacman cache (/var/cache/pacman/pkg) leaving last updates in the cache:

```
    sudo pacman -Sc
```
Remove all orphaned packages:
```
    sudo pacman -Rns $(pacman -Qdtq)
```
Clean pacman cache (/var/cache/pacman/pkg):
```
    paccache -r
```

## Package Groups
To list  all packages in a group:
```
    pacman -Sg <group>
```

## Arch Wiki

For further information on pacman including how to deal with errormessages see:

https://wiki.archlinux.org/index.php/Pacman

pacman -Qqe > pkglist_desktop.txt
comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > optdeplist_desktop.txt
pacman -Qqem > foreignpkglist_desktop.txt

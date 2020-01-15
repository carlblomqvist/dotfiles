#!/usr/bin/env bash
#
# Install dotfiles using stow dynamically.
#
# Created by Dylan Araps, improved by Carl Blomqvist

if [ $# -eq 0 ]
then
    for dir in */; do
        child=("$dir"*); root=
        [[ "$child" =~ $dir(bin|etc|var|usr|opt) ]] && root="root required"
        read -rn 1 -p "install ${dir/\/*}${root:+ ($root)}? [y/n] " ans; echo
        [[ "${ans,,}" != "y" ]] && continue
        [[ "$root" ]] && { sudo stow "$dir" -t /;:; } || stow "$dir"
    done
else
    for dir in "$@"; do
        dir="$dir/"
        child=("$dir"*); root=
        [[ "$child" =~ $dir(bin|etc|var|usr|opt) ]] && root="root required"
        read -rn 1 -p "install ${dir/\/*}${root:+ ($root)}? [y/n] " ans; echo
        [[ "${ans,,}" != "y" ]] && continue
        [[ "$root" ]] && { sudo stow "$dir" -t /;:; } || stow "$dir"
    done
fi

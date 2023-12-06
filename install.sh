#!/bin/sh


_err(){
  [ -n "$1" ] && echo "$1"
  printf '%s\n' "$1"
  printf 'error, exiting...\n'
  exit 1
}

_link(){
  src="$1"
  dst="$2"
  [ -e "$dst" ] && mv -v "$dst" "$(dirname ${dst})/$(basename ${dst})-$(date -I).bak"
  [ -d "$dst" ] && mv -v "$dst" "$(dirname ${dst})/$(basename ${dst})-$(date -I).bak"
  [ -L "$dst" ] && mv -v "$dst" "$(dirname ${dst})/$(basename ${dst})-$(date -I).bak"
  ln -sv "$src" "$dst"
}


dir=$(readlink -f `dirname "$0"`)
[ ! -d "$dir" ] && _err "$dir isn't a valid path"

_link "${dir}/bashrc" "${HOME}/.bashrc"
_link "${dir}/inputrc" "${HOME}/.inputrc"

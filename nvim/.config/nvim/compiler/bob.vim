" Vim compiler file
" for ericsson "bob" to build pcg
" use :compiler bob -> :make partitioner_Linux_elc.elf
" use :compiler bob -> :make partitioner

if exists("current_compiler")
  finish
endif
let current_compiler = "bob"

"bob's gcc output is formatted with ansi codes (color, bold, etc), get rid of them,
"otherwise quickfix won't be able to display error path (file:line)
"general format of a ansi code: \x1b[XXXY where XXX is 1;2;3 (numbers ; separated) Y is a letter
"the sed filter to remove these: sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'
set makeprg=/workspace/git/$USER/epg/bob/bob\ build:cpp\ -p\ cpp-target=$*\ \\\|\&\ sed\ 's/\\\x1b\\\[[0-9;]*[a-zA-Z]//g'
"get rid of bob chatter
set errorformat^=%-G%.%#[bob]%.%#WARNING%.%#
set errorformat^=%-G%.%#[bob]%.%#INFO%.%#


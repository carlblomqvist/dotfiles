" Vim compiler file
" for ericsson "build -c _platform_ _target_
" use :compiler build -> :make -c IPOS_rp _target_

if exists("current_compiler")
  finish
endif
let current_compiler = "build"
set makeprg=build\ $*

"Host seroiuts01422 nproc 80 uptime  09|9| 14 up 22 days,  5:31, 120 users,  load average: 1.87, 2.17, 2.07
set errorformat^=%-GHost\ %.%#uptime\ %.%#load\ average\%.%#



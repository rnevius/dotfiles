" Vim compiler file
" Compiler:	Jest

let current_compiler = "jest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" CompilerSet makeprg=jest\ --no-colors
CompilerSet errorformat=%E\ \ ●\ %m,
		       \%Z\ %\\{4}%.%#Error:\ %f:\ %m\ (%l:%c):%\\=,
		       \%Z\ %\\{6}at\ %\\S%#\ (%f:%l:%c),
		       \%+C\ %\\{4}%\\w%.%#,
		       \%+C\ %\\{4}%[-+]%.%#,
		       \%-C%.%#,
		       \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

if exists('g:loaded_dealwithit') || &cp
  finish
endif

let g:loaded_dealwithit = '0.0.1' " version number
let s:keepcpo = &cpo
set cpo&vim

if !exists('g:dealwithit_guifont')
  let g:dealwithit_guifont = ''
endif

if !exists('g:dealwithit_sleep')
  let g:dealwithit_sleep = 0
endif

command! Dealwithit call dealwithit#Run()

let &cpo = s:keepcpo
unlet s:keepcpo

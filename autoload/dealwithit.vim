let s:frames_dir = simplify(expand('<sfile>:p:h') . '/../resources/frames')

function! dealwithit#Run()
  if !has('gui_running')
    call s:Warning("You need a GUI Vim: deal with it")
    return
  endif

  tabnew

  let saved_font = ''
  if g:dealwithit_guifont != ''
    let saved_font = &guifont
    let &guifont = g:dealwithit_guifont

    set columns=999
    set lines=999
  endif

  for i in range(0, 20)
    exe 'edit + '.s:frames_dir.'/frame_'.printf('%03d', i).'.xpm'
    redraw
  endfor

  if saved_font != ''
    let b:restore_font = saved_font
    autocmd QuitPre <buffer> call s:RestoreFont(b:restore_font)
  endif
endfunction

function! s:RestoreFont(font)
  let &guifont = a:font
endfunction

function! s:Warning(message)
  echohl WarningMsg | echomsg a:message | echohl NONE
endfunction

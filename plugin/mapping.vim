let s:save_cpo = &cpo
set cpo&vim

command! TabDiffStart call tab_diff#start()
command! TabDiffEnd   call tab_diff#end()
command! TabDiffOrig  call tab_diff#orig()

let &cpo = s:save_cpo
unlet s:save_cpo


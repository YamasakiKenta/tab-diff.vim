let s:save_cpo = &cpo
set cpo&vim

let s:V   = vital#of('tab-diff.vim')
let s:Tab = s:V.import('Mind.Tab')

function! tab_diff#start() 
	call s:Tab.tab_diff_start()
endfunction

function! tab_diff#end() 
	call s:Tab.tab_diff_end()
endfunction

function! tab_diff#orig() 
	call s:Tab.tab_diff_orig()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

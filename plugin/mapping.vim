let s:save_cpo = &cpo
set cpo&vim

let s:Tab = vital#of('tab-diff.vim').import('Mind.Tab')

function! s:tab_diff_start() "{{{
	call s:Tab.tab_diff_start()
endfunction
"}}}
function! s:tab_diff_end() "{{{
	call s:Tab.tab_diff_end()
endfunction
"}}}
function! s:tab_diff_orig() "{{{
	call s:Tab.tab_diff_orig()
endfunction
"}}}

nnoremap <PLUG>(tab_diff_start)
			\ :<C-u>call <SID>tab_diff_start()<CR>|"

nnoremap <PLUG>(tab_diff_end)
			\ :<C-u>call <SID>tab_diff_end()<CR>|"

nnoremap <PLUG>(tab_diff_orig)
			\ :<C-u>call <SID>tab_diff_orig()<CR>|"

nmap ;dy<CR> <PLUG>(tab_diff_start)
nmap ;dn<CR> <PLUG>(tab_diff_end)
nmap ;do<CR> <PLUG>(tab_diff_orig)

let &cpo = s:save_cpo
unlet s:save_cpo


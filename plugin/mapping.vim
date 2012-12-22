let s:save_cpo = &cpo
set cpo&vim

let s:Tab = vital#of('tab-diff.vim').import('Mind.Tab')

function! s:map_diff() "{{{
	map <buffer> <A-up>    [c
	map <buffer> <A-down>  ]c
	map <buffer> <A-left>  :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <A-right> :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <tab>     :<C-u>call tab-diff#common#map_diff_tab()<CR>|"
	map <buffer> <F5>      :<C-u>diffupdate<CR>|"
endfunction "}}}
function! s:map_diff_reset() "{{{
	map <buffer> <A-up>    <A-up>
	map <buffer> <A-down>  <A-down>
	map <buffer> <A-left>  <A-left>
	map <buffer> <A-right> <A-right>
endfunction "}}}
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

nmap ;dy<CR> :<C-u>call <SID>tab_diff_start()<CR>
nmap ;dn<CR> :<C-u>call <SID>tab_diff_end()<CR>
nmap ;do<CR> :<C-u>call <SID>tab_diff_orig()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo


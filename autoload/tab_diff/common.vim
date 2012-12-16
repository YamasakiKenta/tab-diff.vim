let s:save_cpo = &cpo
set cpo&vim

let s:Tab = vital#of('tab-diff.vim').import('Mind.Tab')

function! tab_diff#common#map_diff_reset() "{{{
	map <buffer> <A-up>    <A-up>
	map <buffer> <A-down>  <A-down>
	map <buffer> <A-left>  <A-left>
	map <buffer> <A-right> <A-right>
endfunction "}}}
function! tab_diff#common#map_diff_tab() "{{{
	"********************************************************************************
	" É^ÉuêÿÇËë÷Ç¶éûÇ…èàóùÇí«â¡Ç∑ÇÈÇΩÇﬂçÏê¨ÇµÇΩ
	"********************************************************************************
	wincmd w
endfunction "}}}
function! tab_diff#common#map_diff() "{{{
	map <buffer> <A-up>    [c
	map <buffer> <A-down>  ]c
	map <buffer> <A-left>  :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <A-right> :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <tab>     :<C-u>call tab-diff#common#map_diff_tab()<CR>|"
	map <buffer> <F5>      :<C-u>diffupdate<CR>|"
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo


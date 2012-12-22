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
function! s:copy_wins() "{{{
	call s:Tab.copy_wins()
endfunction
"}}}

noremap <PLUG>(tab_diff_start)
			\ :<C-u>call <SID>copy_wins()<CR>:windo diffthis<CR>:windo call <SID>map_diff()<CR>|"

noremap <PLUG>(tab_diff_end)
			\ :<C-u>diffoff!<CR>:windo call <SID>map_diff_reset()<CR>:tabc<CR>|"

noremap <PLUG>(tab_diff_orig)
			\ :<C-u>call <SID>copy_wins()<CR>:only<CR>:DiffOrig<CR>:windo call <SID>map_diff()<CR>|"

nmap ;dy<CR> <PLUG>(tab_diff_start)
nmap ;dn<CR> <PLUG>(tab_diff_end)
nmap ;do<CR> <PLUG>(tab_diff_orig)


let &cpo = s:save_cpo
unlet s:save_cpo


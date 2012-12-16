let s:save_cpo = &cpo
set cpo&vim

let s:Tab = vital#of('tab-diff.vim').import('Mind.Tab')

noremap <PLUG>(tab_diff_start)
			\ :<C-u>call s:Tab.copy_wins()<CR>:windo diffthis<CR>:windo call tab_diff#common#map_diff()<CR>|"

noremap <PLUG>(tab_diff_end)
			\ :<C-u>diffoff!<CR>:windo call tab_diff#common#map_diff_reset()<CR>:tabc<CR>|"

noremap <PLUG>(tab_diff_orig)
			\ :<C-u>call s:Tab.copy_wins()<CR>:only<CR>:DiffOrig<CR>:windo call tab_diff#common#map_diff()<CR>|"

nmap ;dy<CR> <PLUG>(tab_diff_start)
nmap ;dn<CR> <PLUG>(tab_diff_end)
nmap ;do<CR> <PLUG>(tab_diff_orig)

let &cpo = s:save_cpo
unlet s:save_cpo


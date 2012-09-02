noremap <PLUG>(tab_diff_start)
			\ :<C-u>call tab_diff#common#tabcopy()<CR>:windo diffthis<CR>:windo call common#map_diff()<CR>|"

noremap <PLUG>(tab_diff_end)
			\ :<C-u>diffoff!<CR>:windo call common#map_diff_reset()<CR>:tabc<CR>|"

noremap <PLUG>(tab_diff_orig)
			\ :<C-u>call tab_diff#common#tabcopy()<CR>:only<CR>:DiffOrig<CR>:windo call common#map_diff()<CR>|"

nmap ;dy<CR> <PLUG>(tab_diff_start)
nmap ;dn<CR> <PLUG>(tab_diff_end)
nmap ;do<CR> <PLUG>(tab_diff_orig)
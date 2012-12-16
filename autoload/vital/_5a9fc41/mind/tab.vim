let s:save_cpo = &cpo
set cpo&vim

function! s:open_onebtab()
	" 複数のファイルを別タグで開く
endfunction

function! s:tabcopy() "{{{
	let bufnrs = []
	windo let bufnrs += [bufnr("%")]

	tabe
	" 最初の画面の更新
	exe 'b' bufnrs[0]

	" 2画面目からは、分割する
	for bufnr in bufnrs[1:]
		exe 'sb' bufnr
	endfor	
	
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo


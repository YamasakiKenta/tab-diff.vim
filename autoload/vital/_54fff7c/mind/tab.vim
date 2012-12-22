let s:save_cpo = &cpo
set cpo&vim

function! s:open_files(files) "{{{
	let files_ = a:files

	" �����̃t�@�C����ʃ^�O�ŊJ��
	exe 'tabe' files_[0]
	
	for file_ in files_[1:]
		exe 'sp' file_
	endfor
endfunction "}}}
function! s:open_bufnrs(bufnrs) "{{{
	let bufnrs = a:bufnrs
	tabe
	" �ŏ��̉�ʂ̍X�V
	exe 'b' bufnrs[0]

	" 2��ʖڂ���́A��������
	for bufnr in bufnrs[1:]
		exe 'sb' bufnr
	endfor	
endfunction "}}}
function! s:copy_wins() "{{{
	let bufnrs = []
	windo let bufnrs += [bufnr("%")]
	call s:open_bufnrs(bufnrs)
endfunction "}}}
function! s:open_lines(datas) "{{{
	let datas = a:datas
	tabe

	" �ŏ��̉�ʂ̍X�V
	call append(0, datas[0])
	call cursor(0,0)

	" 2��ʖڂ���́A��������
	for lines in datas[1:]
		new
		call append(0, lines)
		call cursor(0,0)
	endfor	
endfunction "}}}
function! s:tab_diff_start() "{{{
			call s:copy_wins()
			windo diffthis
			windo call <SID>map_diff()
endfunction
"}}}
function! s:tab_diff_end() "{{{
			diffoff!
			windo call s:map_diff_reset()
			tabc
endfunction
"}}}
function! s:tab_diff_orig() "{{{
	call <SID>copy_wins()
	only
	DiffOrig
	windo call <SID>map_diff()
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
let s:save_cpo = &cpo
set cpo&vim

function! s:open_onebtab()
	" �����̃t�@�C����ʃ^�O�ŊJ��
endfunction

function! s:tabcopy() "{{{
	let bufnrs = []
	windo let bufnrs += [bufnr("%")]

	tabe
	" �ŏ��̉�ʂ̍X�V
	exe 'b' bufnrs[0]

	" 2��ʖڂ���́A��������
	for bufnr in bufnrs[1:]
		exe 'sb' bufnr
	endfor	
	
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo


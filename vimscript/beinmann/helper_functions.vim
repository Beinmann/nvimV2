function! PasteTextWithoutIndentingLine(text_to_paste)
    let l:current_line = getline('.')
    let l:cursor_pos = col('.')
    let l:text_to_insert = a:text_to_paste 

    let l:new_line = l:current_line[:l:cursor_pos - 1] . l:text_to_insert . l:current_line[l:cursor_pos:]
    call setline('.', l:new_line)
endfunction

function ToggleMarkdownCheckbox()
    
endfunction

augroup markdown_toggle
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <C-L> :call ToggleMarkdownCheckbox()<CR>
augroup END

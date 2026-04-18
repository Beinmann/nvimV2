augroup ViewPersistence
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

augroup LocListMapping
    autocmd!
    autocmd FileType qf nnoremap <buffer> l :lnext<CR><C-W><C-P>lh
    autocmd FileType qf nnoremap <buffer> h :lprev<CR><C-W><C-P>lh
augroup END

function! OpenNetrwIfBuffer()
    if bufname('%') == ''
        Ex
    endif
endfunction

augroup OpenNetrw
    autocmd!
    autocmd VimEnter * call OpenNetrwIfBuffer()
augroup END













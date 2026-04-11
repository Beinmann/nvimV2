autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

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

" Execute the function on Vim startup
autocmd VimEnter * call OpenNetrwIfBuffer()













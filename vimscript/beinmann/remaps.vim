" Additional things loaded in init.lua
" This is great because I can use the standard .vim format
" but also lua

" TODO get this to work somehow (a very similar try from me is in the
" remap.lua file



"""""""""""" Not sure if I keep these """"""""""""

" H and L go to the start/end of the visual Line
nnoremap H g0
nnoremap L g$

" jk exits insert mode
inoremap jk <Esc>

" In visual mode if you paste over something then do not save that thing you
" pasted over.
" There is still an issue that if you paste over a whole line then the line
" break character won't get added back but for now that is something that I
" will have to live with because the alternative of fixing this would be very
" complicated. Here is a function that chatGPT produced for fixing this but
" besides not working it is also really hard to even understand
" xnoremap <expr> p 'p' ==# getregtype() ? '"_dP' : '"_dp`[V`]'
vnoremap p "_dP


" Remap C to be equal to deleting the current char and then inserting
nnoremap C xi

" Quickly switch back and forth between the most recent buffers
nnoremap <leader>- <C-^>




"""""""""""" Remaps that are here to stay (for now) """"""""""""



" x doesn't yank text
nnoremap x "_x


" From ChatGPT
function! ToggleVSplitOrNextTab()
    if winnr('$') == 1
        execute 'vsplit'
        execute 'wincmd w'
    else
        execute 'wincmd w'
    endif
endfunction
" nnoremap <c-Tab> :call ToggleVSplitOrNextTab()<CR>


" TODO put these remaps, etc. into a folder that makes more sense
" Remaps for working with buffers
nnoremap <Leader>bl :ls<CR>:b<Space>
nnoremap <leader>bb :enew<CR>


nnoremap § @




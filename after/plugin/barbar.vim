nnoremap <silent> <Leader>l <Cmd>BufferNext<CR>
nnoremap <silent> <Leader>h <Cmd>BufferPrevious<CR>
nnoremap <leader>w <Cmd>BufferClose<CR>  " <Cmd>Ex<CR>

nnoremap <leader><S-T> <Cmd>BufferRestore<CR>

nnoremap <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <A-6> <Cmd>BufferGoto 6<CR>

nnoremap <leader>bp <Cmd>BufferPick<CR>
nnoremap <leader>bd <Cmd>BufferPickDelete<CR>

nnoremap <leader>1 <Cmd>BufferMovePrevious<CR>
nnoremap <leader>2 <Cmd>BufferMoveNext<CR>


" Re-order to previous/next
" nnoremap <silent>    TODO <Cmd>BufferMovePrevious<CR>
" nnoremap <silent>    TODO <Cmd>BufferMoveNext<CR>

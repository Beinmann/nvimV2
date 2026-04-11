
"""""" Functions I may delete (may be detrimental)

" Remap Ctrl S to saving the file (Usually Ctrl s is used for pausing output of the console or something
nnoremap <C-s> :w<CR>

" Remap Enter (Carriage Return) to creating a new line below the current one
	" Side Note: If I keep this I could also make it have the normal
	" behaviour of creating a new line from the current pos
nnoremap <CR> o<ESC>

" Set k and j to go up and down visual lines (instead of actual lines). Mostly relevant if there are line wraps
" TODO learn what the difference between noremap and nnoremap is and what the <silent> does here
noremap <silent> k gk
noremap <silent> j gj


" Set softtabstop to 4 spaces (Don't know what this does exactly)
set softtabstop=4

" Converts all Tabs into spaces (already existing tabs in a file are not changed but can be converted using :retab)
set expandtab

" Enables you to move to new lines if you go right at the end of a line or left at the beginning of a line
" (source: https://vim.works/2019/03/16/wrapping-text-in-vim/i)
set whichwrap+=<,>,h,l

" Removes any form of automatic newlines when the text gets too long
set textwidth=0


" Makes it so you can also start (:) commands by simply pressing space (might change)
nnoremap <space> :

""""""Some generic commands to check if init.vim even works (From ChatGPT)



" Enable line numbers
set number

" Highlight search results as you type
set incsearch

"Highlight matching parentheses
set showmatch

"Use a different color scheme
colorscheme evening



"""""" Other Settings

" Tell nvim to use the clipboard
set clipboard+=unnamedplus

" Show relative line numbers
set relativenumber

" Disable Search highlighting
set nohlsearch

" Do enable highlithing search terms while writing them
set incsearch

" Set tab width to 4
set tabstop=4

" Set shift width to 4 (I think this is the behaviour of >> and <<)
set shiftwidth=4

" For auto wrapped lines also indent them and then add some space to show they are indented. Also makes it so that only in between words can be auto wraps
set breakindent
set showbreak=++\  "
set linebreak

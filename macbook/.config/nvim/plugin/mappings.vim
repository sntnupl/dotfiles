" let mapleader=","       " leader is comma (default is '\'

" Movement
" In visual mode, once u indent code, the visual mode goes away and normal
" mode comes back. This might not be what you want, in that case, the
" following key mapping changes would help. This is basically going to allow
" Visual mode to stay post indentation. For the record, >gv  means
" 1. shift text right (>)
" 2. reselect it (g)
" 3. go back to visual mode (v)
:vmap > >gv
:vmap < <gv
" Putting <Tab> to better use..
" 1. Use Tab and Shift-Tab to indent right/left. Note: only in Visual Mode.
:vmap <Tab> >gv
:vmap <S-Tab> <gv
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l




" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>



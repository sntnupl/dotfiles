
" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" +++++++ vundle plugins ++++++++
Plugin 'sjl/badwolf'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin '907th/vim-auto-save'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" TAB Handling {{{
" ++++++++++ <TAB> handling ++++++++++
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " make each indent 4 cols wide
" }}}

set visualbell
" uncomment below to disable flashing
" set t_vb=

" Auto Save {{{
" https://vimawesome.com/plugin/vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
" AutoSave will display on the status line on each auto-save by default.
" You can silence this
" let g:auto_save_silent = 1  " do not display the auto-save notification
" }}}


" UI Config {{{
" ++++++++++ UI config ++++++++++
colorscheme badwolf                 " awesome colorscheme
syntax enable                       " enable syntax processing
set number                          " show line numbers
set showcmd                         " show command in bottom bary
set cursorline                      " highlight current line
filetype indent on                  " load filetype-specific indent files
set wildmenu                        " visual autocomplete for command menu
set wildmode=list:longest           " Complete files like a shell.
set lazyredraw                      " redraw only when we need to.
set showmatch                       " highlight matching [{()}]
set backspace=indent,eol,start      " Intuitive backspacing. Allow backspacing over everything in insert mode.
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
"set smartindent                    " smart indent

set ignorecase                      " Case-insensitive searching.
set smartcase                       " But case-sensitive if expression contains a capital letter.
set number                          " Show line numbers.
set ruler                           " Show cursor position.
" Applies substitutions globally on lines. So, instead of doing
" :%s/foo/bar/g you just type :%s/foo/bar/
set gdefault
" Vim will change the current working directory to that of the file opened
set autochdir
set nowrap                                      " Turn off line wrapping.
set scrolloff=3                                 " Show 3 lines of context around the cursor.
set history=1000                                " remember more commands and search history
set undolevels=1000                             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class        " Ignore these file extensions when completing names by pressing Tab

" When you paste text into your terminal-based Vim with a right mouse click, Vim cannot know it is
" coming from a paste. To Vim, it looks like text entered by someone who can
" type incredibly fast.
" Since Vim thinks this is regular key strokes, it applies all
" auto-indenting and auto-expansion
" of defined abbreviations to the input, resulting in often cascading
" indents of paragraphs.
" The following allows us to temporarily switch to 'paste mode'. F2 becomes a toggle switch.
set pastetoggle=<F2>
set clipboard=unnamed                           " copy selection to OS X clipboard
" }}}


" Search {{{
" ++++++++++ searchin ++++++++++
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}


" Folding {{{
" ++++++++++ Folding ++++++++++
"set foldenable                                  " enable folding
"set foldlevelstart=10                           " only very nested blocks of code, here more than 10 levels deep, are folded when opening a buffer(opens most folds by default)
"set foldnestmax=10                              " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=syntax   " fold based on indent level
"set foldlevel=1
"set foldclose=all
set foldnestmax=1
let g:markdown_folding = 1   " turn on folding for markdown files
"set modelines=1
" }}}


" Movement {{{
" ++++++++++ Movement ++++++++++
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


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
" }}}


" let mapleader=","       " leader is comma

" Jump to last position {{{
" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
" }}}

" tag related {{{
set tags=./tags,tags; " this will look for a tag in the current dir first, and the up n up till it finds it
map <F1> :tn<Enter>
map <F2> :ts<Enter>
" }}}



" Backups {{{
" ++++++++++ Backups ++++++++++
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}



" Airline {{{
" ++++++++++ For Airline ++++++++++
" https://github.com/vim-airline/vim-airline/wiki/FAQ
" http://vi.stackexchange.com/questions/5622/how-to-configure-vim-airline-plugin-to-look-like-its-own-project-screenshot
set laststatus=2        " show status line always 
let g:airline_powerline_fonts = 1
set t_Co=256
" }}}


" NERDTree and NERD Git {{{
" ++++++++++ For NERDTree and NERD Git Plugin ++++++++++
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = 'â–¸'
let g:NERDTreeDirArrowCollapsible = 'â–¾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "âœ¹",
    \ "Staged"    : "âœš",
    \ "Untracked" : "âœ­",
    \ "Renamed"   : "âžœ",
    \ "Unmerged"  : "â•",
    \ "Deleted"   : "âœ–",
    \ "Dirty"     : "âœ—",
    \ "Clean"     : "âœ”ï¸Ž",
    \ "Unknown"   : "?"
    \ }
" }}}


" this must be the last line of this files for the specific fold method to
" work
" vim:foldmethod=marker:foldlevel=0



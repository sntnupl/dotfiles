call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'sjl/badwolf'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'windwp/nvim-autopairs'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'mhinz/vim-startify'
Plug 'danilamihailov/beacon.nvim'

call plug#end()

filetype plugin indent on    " required

lua << EOF
require("nvim-autopairs").setup {}
EOF





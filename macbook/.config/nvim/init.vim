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
Plug 'dhruvasagar/vim-table-mode'

" cmp Plugins
Plug 'hrsh7th/nvim-cmp'                               " The completion plugin
Plug 'hrsh7th/cmp-buffer'                             " buffer completions
Plug 'hrsh7th/cmp-path'                               " path completions
Plug 'hrsh7th/cmp-cmdline'                            " cmdline completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'nvim-lua/plenary.nvim'                          " reqd for crates
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }        " rust crates
Plug 'PasiBergman/cmp-nuget'                          " dotnet nuget packages

" LSP
Plug 'neovim/nvim-lspconfig'             " enable LSP
Plug 'williamboman/nvim-lsp-installer'   " Simple to use language server installer
Plug 'RRethy/vim-illuminate'             " automatic highlighting of word under cursor

" Rust
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'          " rust tools using neovim's LSP
" ensure to `brew install llvm` to install lldb-vscode, needed for debugging

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'


" Snippets (for luasnip users)
Plug 'L3MON4D3/LuaSnip'                   " snippet engine
Plug 'saadparwaiz1/cmp_luasnip'           " snippet completions
Plug 'rafamadriz/friendly-snippets'       " bunch of snippets to use
"Plug 'sirver/ultisnips'

" Telescope
" remember to `brew install ripgrep` for live_grep or grep_string to work
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/playground'

" DAP
Plug 'mfussenegger/nvim-dap'      " refer to https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
Plug 'rcarriga/nvim-dap-ui'
Plug 'ravenxrz/DAPInstall.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'

" Snippets (for vsnip users)
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

call plug#end()


filetype plugin indent on    " required

lua << EOF
require("nvim-autopairs").setup {}
require("user.lsp")
require('crates').setup()
require('cmp-nuget').setup({})
EOF



let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" vim-plug
" https://github.com/junegunn/vim-plug
"
" Install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
  Plug 'tpope/vim-fugitive'
  " Plug 'junegunn/gv.vim' " git commit browser in vim
  Plug 'mhinz/vim-signify'

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'

  Plug 'gruvbox-community/gruvbox'
  Plug 'flazz/vim-colorschemes'
  Plug 'chriskempson/base16-vim'

  Plug 'sheerun/vim-polyglot'
  Plug 'mattn/emmet-vim'

  " Fuzzy finding and buffer management
  Plug 'Shougo/denite.nvim'

  " See https://github.com/neoclide/coc.nvim for config options
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " For coc w/ vue:
  " Note you have to install eslint and eslint-plugin-vue
  " See https://github.com/neoclide/coc-vetur

call plug#end()

map <Space> <Leader>
set encoding=utf-8
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

set shiftwidth=2
set tabstop=2         " number of visual spaces per TAB
set softtabstop=2     " number of spaces in tab when editing
set expandtab         " tabs are spaces

set number
set relativenumber

set incsearch     " search as characters are entered
set hlsearch      " highlight matches
set ignorecase    " Make searches case-insensitive.
set smartcase     " Make searches case-sensitive upon the first capital letter

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=101
  highlight ColorColumn ctermbg=darkgray
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/
endif

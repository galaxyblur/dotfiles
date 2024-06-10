set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

" vim-plug
" https://github.com/junegunn/vim-plug
"
" Install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'

  Plug 'flazz/vim-colorschemes'
  Plug 'gruvbox-community/gruvbox'

  " Linting
  Plug 'dense-analysis/ale'

  "Requires +conceal.
  "macOS: `sudo port install vim +huge` and reload via `source ~/.bash_profile`
  Plug 'Yggdroot/indentLine'

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-signify'
  Plug 'ap/vim-css-color'
  Plug 'ryanoasis/vim-devicons'

  Plug 'sheerun/vim-polyglot'

  " Javascript syntax highlighting
  Plug 'pangloss/vim-javascript'

  " Typescript syntax highlighting
  Plug 'leafgarland/typescript-vim'
  " Plug 'leafOfTree/vim-vue-plugin'

  " Vue.js syntax highlighting
  Plug 'posva/vim-vue'

  " Web development auto-completion
  Plug 'mattn/emmet-vim'

  " Fuzzy finding and buffer management
  Plug 'Shougo/denite.nvim'

  " Intellisense code engine, auto-completion, linting, code fixing
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  " CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-vetur

" Add plugins to &runtimepath
call plug#end()

runtime! plugin/sensible.vim

map <Space> <Leader>
set showcmd

set encoding=utf-8
set hidden


" Buffer for cursor when using j/k
set so=7

set shiftwidth=2
set tabstop=2         " number of visual spaces per TAB
set softtabstop=2     " number of spaces in tab when editing
set expandtab         " tabs are spaces

set list
"set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•


set cursorline        " highlight current line
set lazyredraw        " redraw only when we need to.
set showmatch         " highlight matching [{()}]

set number
set relativenumber

set t_Co=256 " enable 256-color mode.

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark


" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=101
  highlight ColorColumn ctermbg=darkgray
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%101v.\+/
endif

set incsearch     " search as characters are entered
set hlsearch      " highlight matches
set ignorecase    " Make searches case-insensitive.
set smartcase     " Make searches case-sensitive upon the first capital letter
set shiftround    " always indent/outdent to the nearest tabstop

if has('mac')
  set guifont=DroidSansMono_Nerd_Font:h11
else " linux, bsd, etc
  set guifont=DroidSansMono\ Nerd\ Font\ 11
endif

let g:vim_json_syntax_conceal = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

function! ToggleClean()
  if &number == 0
    set number
    set relativenumber
    IndentLinesEnable
    SignifyEnable
  else
    set nonumber
    set norelativenumber
    IndentLinesDisable
    SignifyDisable
  endif
endfunction


nnoremap <Leader>clip :tab sb +call\ ToggleClean()<CR>
nnoremap <Leader>clipq :tabclose<CR>
map <F3> :call ToggleClean()<CR>
set pastetoggle=<F2>

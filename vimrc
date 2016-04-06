set nocompatible         " get rid of Vi compatibility mode. SET FIRST!

" vim-plug
" https://github.com/junegunn/vim-plug
"
" Install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-sensible'

  Plug 'flazz/vim-colorschemes'

  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-signify'
  Plug 'vim-scripts/Align'
  Plug 'ap/vim-css-color'

  " Require python
  "Plug 'Valloric/YouCompleteMe'
  "Plug 'marijnh/tern_for_vim'

  Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
  Plug 'groenewege/vim-less'
  Plug 'elzr/vim-json'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'tpope/vim-cucumber'
  Plug 'digitaltoad/vim-jade'

" Add plugins to &runtimepath
call plug#end()


" Buffer for cursor when using j/k
set so=7

set shiftwidth=2
set tabstop=2
set expandtab         
set list
set listchars=tab:>\  " > to highlight <tab> "


set t_Co=256 " enable 256-color mode.
colorscheme ego


" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=121
  highlight ColorColumn ctermbg=darkgray
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%121v.\+/
endif



set ignorecase            " Make searches case-insensitive.
set shiftround            " always indent/outdent to the nearest tabstop

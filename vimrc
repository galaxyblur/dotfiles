"  Vundle
"
"
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
filetype off             " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'flazz/vim-colorschemes'
Plugin 'groenewege/vim-less'
Plugin 'elzr/vim-json'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-cucumber'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'JavaScript-Indent'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/nerdcommenter'


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
"
"
" end Vundle

" Buffer for cursor when using j/k
set so=7

set shiftwidth=2
set tabstop=2
set expandtab         
set list
set listchars=tab:>\  " > to highlight <tab> "


set t_Co=256              " enable 256-color mode.
colorscheme desert


" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif



set ignorecase            " Make searches case-insensitive.
set shiftround            " always indent/outdent to the nearest tabstop

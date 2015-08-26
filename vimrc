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

""" Automatically make needed files and folders on first run
""" If you don't run *nix you're on your own (as in remove this) {{{
    call system("mkdir -p $HOME/.vim/{plugin,undo}")
    if !filereadable($HOME . "/.vimrc.plugins") | call system("touch $HOME/.vimrc.plugins") | endif
    "if !filereadable($HOME . "/.vimrc.first") | call system("touch $HOME/.vimrc.first") | endif
    "if !filereadable($HOME . "/.vimrc.last") | call system("touch $HOME/.vimrc.last") | endif
""" }}}
""" Vundle plugin manager {{{
    """ Automatically setting up Vundle, taken from
    """ http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
        let has_vundle=1
        if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
            echo "Installing Vundle..."
            echo ""
            silent !mkdir -p $HOME/.vim/bundle
            silent !git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
            let has_vundle=0
        endif
    """ }}}
    """ Initialize Vundle {{{
        filetype off                                " required to init
        set rtp+=$HOME/.vim/bundle/Vundle.vim       " include vundle
        call vundle#begin()                         " init vundle
    """ }}}

          " let Vundle manage Vundle, required
          Plugin 'gmarik/Vundle.vim'

          Plugin 'tpope/vim-sensible'
          Plugin 'flazz/vim-colorschemes'
          Plugin 'sjl/badwolf'
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

    """ Installing plugins the first time, quits when done {{{
        if has_vundle == 0
            :silent! PluginInstall
            :qa
        endif
    """ }}}

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
colorscheme badwolf


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

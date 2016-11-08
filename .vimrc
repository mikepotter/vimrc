filetype off

set laststatus=2                    " Set the status line to be on the second from the last row

"call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible                " remove unneeded old compatibility
set nobackup                    " turn off backups
set nowritebackup
set hidden                      "keep buffers in the background - enables moving between buffers without saving

" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'for': 'go' }                        " go tools
Plug 'mikepotter/vim-golang-open-testfile'                  " opening go test file
Plug 'scrooloose/syntastic'                                 " error checking
Plug 'scrooloose/nerdcommenter'                             " commenting management
Plug 'scrooloose/nerdtree'                                  " tree explorer
Plug 'tpope/vim-surround'                                   " change surround cs'<q> changes single quotes to <q>
Plug 'chase/vim-ansible-yaml'                               " ansible yml formatting
Plug 'vim-scripts/auto-pairs-gentle'                                 " Insert or delete brackets, parens, quotes in pair
Plug 'jpalardy/vim-slime'                                   " copy text from vim to screen session
Plug 'jamessan/vim-gnupg'                                   " edit a gpg encrypted file
Plug 'wannesm/wmgraphviz.vim'                               " GraphViz highligting
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}       " docker syntax highlighter
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }     " AutoComplete
Plug 'vim-airline/vim-airline'                              " status bar
Plug 'vim-airline/vim-airline-themes'                       " status bar themes
Plug 'ctrlpvim/ctrlp.vim'                                   " fuzzy file find
" Plug 'ervandew/supertab.git'                              " Unknown
" Plug 'jiangmiao/auto-pairs'                               " Create quotes and brackets in pairs
" Plug 'tpope/vim-fugitive'                                 " git tools
call plug#end()

" NerdTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
let g:ycm_filetype_blacklist = { 'tagbar' : 1 }

" don't open a menu
set completeopt=menuone

" Set TabStops
set expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4

" Syntastic Settings
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Syntastic + VimGo
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix""

" Slime set to tmux
"let g:slime_target = "tmux"

" switch between tabs
":nnoremap <Leader><Left> gT
":nnoremap <Leader><Right> gt
":nnoremap <Leader><Up> :Te<CR>

" switch between buffers
:nnoremap <Leader><Left> :bp<CR>
:nnoremap <Leader><Right> :bn<CR>

set showtabline=2
colorscheme default           " set default theme
set nu                        " show line numbers
set nowrap                    " turn off line wrapping
set showmatch                 " Show matching brackets when text indicator is over them
set mat=2                     " How many tenths of a second to blink when matching brackets

"set listchars=eol:$,tab:__,trail:.,extends:>,precedes:<
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set list                      " show non next chars

" Standard color groups
autocmd ColorScheme * highlight NonText guibg=bg guifg=#333333 ctermfg=233
autocmd ColorScheme * highlight SpecialKey guibg=bg guifg=#333333 ctermfg=233

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

set autoindent                " Who doesn't like autoindent

set showcmd                   " Show (partial) command in status line.
set ignorecase                " Do case insensitive matching
set smartcase                 " Do smart case matching
set incsearch                 " Incremental search
set ruler                     " show the line number on the bar

" Disable Ex Mode
nnoremap Q <nop>

" Ruby {{{
augroup rubylan
    autocmd!
    autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
"}}}

" GoLang {{{
augroup golang
    autocmd!
    autocmd FileType go compiler go
    autocmd FileType go setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
    "autocmd FileType,ColorScheme go,* set listchars=eol:$,tab:\|\ ,trail:.,extends:>,precedes:<

    " Go-Vim Plugin
    autocmd Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
    autocmd FileType go nnoremap <leader>l :GoLint<CR>
    "let g:go_fmt_command = "gofmt"
    let g:go_fmt_command = "goimports"

    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

augroup END
"}}}

" GraphViz {{{
augroup graphviz
    autocmd!
    autocmd FileType gv setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END
"}}}


" Open a new directory listing in a new tab
" command Nt tabnew .

"runtime macros/matchit.vim " Better % Matching

if has("gui_running")
    let loaded_netrwPlugin = 1
else
    set backspace=indent,eol,start
    set mouse=a                             " Enable mouse copy
    set clipboard=unnamed
endif

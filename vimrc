"############### Vundle configuration ######################
    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    " Plugin 'tpope/vim-fugitive'
let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" *** Vundle Begin (Load Plugins) ***
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim' " Vundle is required
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'Konfekt/FastFold'
    Plugin 'vim-scripts/indentpython.vim'
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'nvie/vim-flake8'
    "Plugin 'wincent/command-t'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tpope/vim-fugitive'
    "Docs anschauen
    "Plugin 'klen/rope-vim'
    "  Plugin 'python-rope/ropemode'
    "Plugin 'python-rope/ropevim'
    "Plugin 'davidhalter/jedi-vim'
    "Plugin 'ervandew/supertab'
    Plugin 'SirVer/ultisnips'
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'tomasr/molokai'
    Plugin 'tpope/vim-surround'
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    "Plugin 'garbas/vim-snipmate'                " Snippets manager
    "Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    "Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo
    "Plugin 'sheerun/vim-polyglot'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'mhinz/vim-startify'
    Plugin 'sickill/vim-monokai'
    " *** Vundle End ***
call vundle#end()            " required
filetype plugin indent on
"###########################################################

"############## Plugin Configuration #######################

" **** davidhalter/jedi-vim

" **** SimpylFold
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

" **** NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
map <F3> :NERDTreeToggle<CR>

"**** vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"**** Konfekt/FastFold
let g:fastfold_savehook = 0


"use flake8 for syntax checking
let g:syntastic_python_checkers=['flake8']

"**** Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1

"###########################################################

"############### Editor Configuration ######################
" **** Edit Keybindings ****
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za
" move to beginning/end of line
nnoremap B ^
nnoremap E $
"custom keys
let mapleader=","       " leader is space
" jk is escape
inoremap jk <esc>
" Make Ctrl-e jump to the end of the current line in the insert mode.
inoremap <C-e> <C-o>$

" Make Ctrl-w jump to the end of the current line in the insert mode.
inoremap <C-w> <C-o>0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<right>"
let g:UltiSnipsJumpBackwardTrigger = "<left>"
" **************************

"############### Start Python PEP 8 stuff ###################
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent

"############################################################

" ****tabs/buffer configuration
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>
"******************************

" ****Airline settings
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
"******************************
"****Nerdtree
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
"*********************************
"

" ****python executables for different plugins
let g:syntastic_python_python_exec='python3'
"*********************************************
"
"

" encode in utf-8
set encoding=utf-8
set wildmode=longest,list,full
set incsearch                                                " search as you type
set laststatus=2  
set number
set ruler
set ttyfast 
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files
set secure
" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable system clipboard
set clipboard=unnamed

" display incomplete commands
set showcmd

" Search Highlighting
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set wildmenu

" ****Startify
let g:startift_session_dir = '~/.vim/session'
let g:startify_change_to_dir = 1 
let startify_session_persistence = 1
let g:startify_enable_special = 1
let g:startify_update_oldfiles = 1
"***********************
"
" **** color scheme ****
syntax enable
syntax on
colorscheme monokai
set background=dark

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

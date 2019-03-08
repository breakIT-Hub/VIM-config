" ############### Vundle configuration ######################
let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" *** Vundle Begin (Load Plugins) ***
call vundle#begin()
    " **** Python Plugins
    Plugin 'VundleVim/Vundle.vim' " Vundle is required
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'nvie/vim-flake8'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'tomasr/molokai'
    Plugin 'tpope/vim-surround'
    Plugin 'python-rope/rope'
    Plugin 'mbbill/undotree'

    " **** Tex Plugins
    Plugin 'lervag/vimtex'

    " **** GIT Plugins
    Plugin 'jreybert/vimagit'
    Plugin 'airblade/vim-gitgutter' 

    " *** Vundle End ***
call vundle#end()            " required
filetype plugin indent on
"###########################################################

"############## Plugin Configuration #######################

" **** SimpylFold
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview=1

" **** YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion=['<TAB>', '<Space>', '<Enter>']
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_error_symbol="!!"
let g:ycm_warning_symbol="w"
let g:ycm_collect_identifiers_from_comments_and_strings=1
map <leader>c  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" **** Ultisnips
let g:UltiSnipsExpandTrigger="<space-f>"
let g:UltiSnipsJumpForwardTrigger="<space-g>"
let g:UltiSnipsJumpBackwardTrigger="<space-d>"
let g:UltiSnipsListSnippets="<space-v>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" **** undotree
nnoremap <F2> :UndotreeToggle<cr>
" **** NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
map <F3> :NERDTreeToggle<CR>
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments

"**** vim-syntastic/syntastic

"**** Konfekt/FastFold
"let g:fastfold_savehook = 0


"use flake8 for syntax checking

"**** Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
let python_highlight_all=1
let g:syntastic_auto_jump = 3
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_python_checkers=['flake8', 'bandit', 'pylama', 'pyflakes', 'pylint', 'frosted']
" **** colorscheme
syntax enable
syntax on
colorscheme molokai
set background=dark
"***** Zenburn/vim-colors-solarized
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
"call togglebg#map("<F5>")
"let g:solarized_termcolors=256
" ****Airline settings
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1


"###########################################################

"############### Editor Configuration ######################
" **** Edit Keybindings ****
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <C-Space> za
" move to beginning/end of line
nnoremap B ^
nnoremap E $
"custom keys
let mapleader="<C>"       " leader is C
" jk is escape
inoremap jk <esc>
" Make Ctrl-e jump to the end of the current line in the insert mode.
inoremap <C-e> <C-o>$

" Make Ctrl-w jump to the end of the current line in the insert mode.
inoremap <C-w> <C-o>0


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" **************************

"############### Start Python PEP 8 stuff ###################
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py set softtabstop=4

"if (exists('+colorcolumn'))
"    set colorcolumn=80
"    highlight ColorColumn ctermbg=9
"endif

" Wrap text after a certain number of characters
"au BufRead,BufNewFile *.py,*.pyw, set textwidth=80

" Use UNIX (\n) line endings.
"au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
"autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"Folding based on indentation:
"autocmd FileType *.py set foldmethod=indent

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


"############################################################

" ****tabs/buffer configuration
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>
"******************************

"******************************
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


" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'w0rp/ale'
    Plugin 'vim-scripts/vim-auto-save'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
    Plugin 'tpope/vim-surround'
    Plugin 'mbbill/undotree'
    Plugin 'raimondi/delimitmate'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'flazz/vim-colorschemes'
    
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

" **** YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion=['<Tab>']
let g:ycm_enable_diagnostic_highlighting=1
map <C-c>c  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" **** Ultisnips
let g:UltiSnipsExpandTrigger="<C-x>"
let g:UltiSnipsJumpForwardTrigger="<C-c>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-v>"
let g:UltiSnipsUsePythonVersion = 3
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" **** Ale
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_keep_list_window_open = 0
"let g:ale_list_vertical = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = 'w'
let b:ale_linters = { 'python': ['pyflakes', 'bandit', 'prospector', 'pycodestyle', 'pylama'] }
let b:ale_fixers = { 'python' : [ 'remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'isort', 'autopep8', 'black', 'yapf' ]}

" **** vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save

" **** undotree
nnoremap <F2> :UndotreeToggle<cr>

" **** NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
map <F3> :NERDTreeToggle<C>
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments

" **** Airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts=1
let python_highlight_all=1

" **** colorscheme
syntax enable
"syntax on
colorscheme molokai
set background=dark
"###########################################################

"############### Editor Configuration ######################
" **** Edit Keybindings ****
"split navigationsi
nnoremap <Space> <C-y>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
"custom keys
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

" make backspaces more powerfull
set backspace=indent,eol,start

"############################################################

" ****tabs/buffer configuration
"tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>
"******************************

" encode in utf-8
set encoding=utf-8
set wildmode=longest,list,full
set incsearch                                                " search as you type
set laststatus=2  
set number
set ruler
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
"set showcmd

" Search Highlighting
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set wildmenu


" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

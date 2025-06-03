""""""""""""""""""""""""""""
"CONFIG FILE FOR VIM EDITOR"
""""""""""""""""""""""""""""

""""""""
" ABOUT:
"
" with the right .config/nvim/init.vim it's also applied to neovim
"
" assumes the following:
"   $HOME/.vim/ directory exists and structured thus
"       .vim/.VIM_BACKUP_FILES, .vim/.VIM_SWAP_FILES, .vim/.VIM_UNDO_FILES
" 
" Configures the following the plugins
"   lightline
"
"
" TODO
" fix the centralisation of backups and swaps....
"
"""""""

"============="
" INDENTATION "
"============="

"Set tab to pep-8 standard of 4 spaces:
set expandtab	    "convert all \t into x*\s
set tabstop=4	    "indent level of 4 cols
set softtabstop=4
set shiftwidth=4	"indent/outdent by 4 cols
set shiftround		"always indent to nearest tabstop
"Set autoindentation when required:
set autoindent
"backspace everything:
set backspace=indent,eol,start

"============="
" EDITOR SIZE "
"============="

"Set max size of editor line:
set textwidth=78 
" Note: 0 means no limit.

"Don't wrap lines:
set nowrap
"Turn on the ruler:
set ruler

"========="
" SEARCHS "
"========="

"Increment search matches:
set incsearch
"Ignore capitalisation during search:
set ignorecase
"unless searching for caps...
set smartcase
"show search matches:
set showmatch
"highlight when searching:
set hlsearch

"========="
" DISPLAY "
"========="

"show partial cmds:
set showcmd
"show mode:
set showmode

"Enable filetype detection:
filetype on
filetype indent on
filetype plugin on

"Set syntax highlighting:
syntax on

"Show line numbers:
"set number

"Don't add empty newlines at end of files:
"set binary
set noeol
"Show status line always:
set laststatus=2
"Enable mouse in all modes:
set mouse=a
"Disable bell sounds:
set noerrorbells
set belloff=all
set visualbell
"Don't reset cursor to start of line:
set nostartofline
"Show the cursor position:
set ruler
"show the filename in window title bar:
set title
"disable spell checking:
set nospell
"let cursor go anywhere:
"set virtualedit=all

"===================="
" BACK-UPS & HISTORY "
"===================="

"num of cmds in history (defaults 20):
set history=1000
"Turn off back ups:
"set nobackup

""" FIXME
"Centralise backups & swapfiles
"set backupdir=$HOME/.vim/.VIM_BACKUP_FILES
"set directory=$HOME/.vim/.VIM_SWAP_FILES
" see below for undo.

"================="
" AUTO-COMPLETION "
"================="

"enable auto-completion
set wildmenu
"set behaiour a la bash completion
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"======"
" MISC "
"======"

"change line endings to unix style (\n) not DOS (\n\r)
set ff=unix
"turn off backwards compatibility w vi:
set nocompatible
"allow cursor keys in insert mode:
" set esckeys
" the above is vim only
"optimise for terminal conections:
set ttyfast
"use utf-8 sans BOM
set encoding=utf-8 nobomb
"quicken esc key response?
set ttimeoutlen=50
"show hidden characters on
"set list
"use os clipboard?
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""
" the following inspired by this		 "
" http://howivim.com/2016/damian-conway/ "
""""""""""""""""""""""""""""""""""""""""""
" auto write the buffer
set autowrite
" dial up persistent undo
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.vim/.VIM_UNDO_FILES
    set undofile
endif
" swap file rotate after how many key strokes
set updatecount=100		    " default is 200

"=========="
" MAPPINGS "
"=========="
" these should go at top or bottom/somewhere special
" caps to esc at a system level...
" ...

" just while we're learning:
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"========="
" PLUGINS "
"========="

"====== lightline ======"
set noshowmode      " no need for extra status line

let g:lightline = {
      \ 'colorscheme': 'srcery_drk',
      \ }
" next configure what appears in the line
" schemes to try: srcery_drk, 


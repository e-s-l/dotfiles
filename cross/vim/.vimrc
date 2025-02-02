""""""""""""""""""""""""""""
"CONFIG FILE FOR VIM EDITOR"
""""""""""""""""""""""""""""

""""""""""""""
"INDENTATION:"
""""""""""""""
"Set tab to pep-8 standard of 4 spaces:
"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"Set autoindentation when required:
set autoindent
"backspace everything:
set backspace=indent,eol,start

"""""""""""""
"EDITOR SIZE"
"""""""""""""
"Set max size of editor line:
set textwidth=80 
"132
"Note: 0 means no limit.
"""
"Don't wrap lines:
"set nowrap
"Turn on the ruler:
set ruler

""""""""""
"SEARCHS:"
""""""""""
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

""""""""""
"DISPLAY:"
""""""""""
"show partial cmds:
set showcmd
"show mode:
set showmode
"Select a color scheme
"coloscheme darkblue "molokai
"Enable filetype detection:
filetype on
filetype indent on
"Set syntax highlighting:
syntax on
"Show line numbers:
set number
"Cursor corss-hairs:
"set cursorline
"set cursorcolumn
"Don't add empty newlines at end of files:
"set binary
"set noeol
"Show status line always:
"set laststatus=2
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
"Show mode:
set showmode
"show the filename in window title bar:
set title
"disable spell checking:
set nospell
"let cursor go anywhere:
"set virtualedit=all

"""""""""""""""""""""
"BACK-UPS & HISTORY:"
"""""""""""""""""""""
"num of cmds in history (defaults 20):
set history=1000
"Turn off back ups:
"set nobackup
"Centralise backups, swapfiles, undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"    set undodir=~/.vim/undo
"endif

""""""""""""""""""
"AUTO-COMPLETION:"
""""""""""""""""""
"enable auto-completion
set wildmenu
"set behaiour a la bash completion
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"""""""
"MISC:"
"""""""
"change line endings to unix style (\n) not DOS (\n\r)
set ff=unix
"turn off backwards compatibility w vi:
set nocompatible
"allow cursor keys in insert mode:
set esckeys
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

""""""""""""""""""""""""""""""""""""""
"NOW DO KEY MAPPINGS LOL

""""""""""""""""""""""""""""
"CONFIG FILE FOR VIM EDITOR"
""""""""""""""""""""""""""""

""""""""""""""
"INDENTATION:"
""""""""""""""
"Set tab to pep-8 standard of 4 spaces:
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"Set autoindentation when required:
set autoindent

"""""""""""""
"EDITOR SIZE"
"""""""""""""
"Set max size of editor line:
set textwidth=100
"Don't wrap lines:
"set nowrap

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
"HISTORY:"
""""""""""
"num of cmds in history (defaults 20):
set history=1000

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
"set number
"Cursor corss-hairs:
"set cursorline
"set cursorcolumn

""""""""""""""""""
"AUTO-COMPLETION:"
""""""""""""""""""
"enable auto-completion
set wildmenu
"set behaiour a la bash completion
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# on vim

plugins go in $HOME/.vim/plugin/

or go in packages *cf* https://vimhelp.org/repeat.txt.html#packages

## in other editors

vim mode can be enabled in obsidian, vscode...

### vscode

install vscodevim extension
but make sure to enable key-repeats
*c.f.* https://github.com/VSCodeVim/Vim

## How to learn

Look at `:help` or `:help functions-list`

********************

# Misc Learning Notes

modes:
1. i for insert
2. : for command
3. v for visual
4. esc for normal

## Commands

`:set number` show line numbers
Then use `:x` where x is a number to jump to it.

- navigation: hjkl
- in-line editing: iIaA
- change in cmd mode: xru
    - r = replace
    - x = x out (delete)
    - u = undo

### common remaps

remap caps key to escape

### shells/command-line commands

`:!` then *eg* bash to run bash shell

## Pasting

`+p` to paste from system clipboard.

******************

# Plugins

## Recommended plugins:

 plugins to look into
    fat-finger.vim          (autocorrect common mistakes)
    autoswap_mac_linux.vim  (better swap files)
    emmet.vim               (html/css autocomplete, learn your emmet shortcuts)
    lightline.vim           (better status lines, customisable)
    git-gutter.vim

## Good commands to use

`:Files`
    Consider mapping like `map ; :Files<CR>`

# references

http://howivim.com/2016/damian-conway/

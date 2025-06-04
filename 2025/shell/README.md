# Shells

We use bash on linux and zsh on macintosh.

The `.profile` is for interactive log-in shells, and must be compatible to all shells (here, both bash and zsh).

The `.bashrc/.zshrc` files are for non-interactive log-in shells.

Really what we need are: `.bash_profile` and `.zprofile` files which load `.profile` and appropriate `rc` file, in that order.
# Dotfiles
## 2024

Run create_links.sh to set-up the symbolic links between the files here and the locations they are looked for in by their programs.

(Next will create install.sh, which will apt-get the programs themselves, then also run the above.) 

#### Note

It would also be good to add links to the cronjobs here...

### Current programs

So far I have rudimentray configurations estabilished for the following programs:

- vim (~/.vimrc)
- alacritty (~/.config/alacritty/alacritty.yml)
- bash (~/.bashrc)
- conky (~/.conkyrc)
- git (~/.gitconfig)
- screen (~/.screenrc) 
- tmux (~/.tmux.conf)
- vscode (~/.config/Code/User/settings.json)

(In brackets, we have the anticipated locations of the user specific configurations.)

****************

## Old Doc's:

- Started for vim *ie* the file ~/.vimrc based on internet recommendations, happy with current set-up.
- Simliarly added a tmux: this needs much more work.
- Then added a bashrc and aliases file, and kept on adding them. 
- Next need to write a install bash script that copies (or creates symbolic links) all the dot files to the right places.
- Then get list of apt packages installed (which have corresponding dotfiles). Then use this list create install.sh


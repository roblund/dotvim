# Rob's Dot Vim Folder

This is a repo for all of my vim settings and plugin setup. Couple notes that might be helpful when installing this on a new system:

After cloning the repo into your .vim directory, create a softlink from your home directory into .vim
```
ln -s ~/.vim/.vimrc ~/.vimrc
```

Install [Vim-Plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run Vim-Plug
```
vi +PlugInstall +qa
```

## Windows

Add single line files in your home directory that point to the real vimrc files.

```
echo "source ~/.vim/.vimrc" >> ~/_vimrc && echo "source ~/.vim/_winvimrc" >> ~/_gvimrc
```

Copy `ftplugin, colors, after` files into `{Program Files}/vim/vimfiles/`

#### from Babun
```

```


#### from Git Bash

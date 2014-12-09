# Rob's Dot Vim Folder

This is a repo for all of my vim settings and plugin setup. Couple notes that might be helpful when installing this on a new system:

After cloning the repo into your .vim directory, create a softlink from your home directory into .vim
```
ln -s ~/.vim/.vimrc ~/.vimrc
```

Install [Vundle](https://github.com/gmarik/vundle)
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Run Vundle
```
vi +BundleInstall +BundleClean! +qa
```

## Windows

Add single line files in your home directory that point to the real vimrc files.

####_vimrc
```
source ~/.vim/.vimrc
```
####_gvimrc
```
source ~/.vim/_winvimrc
```

You will also need to manually copy `ftplugin, colors, after` files into `{Program Files}/vim/vimfiles/`

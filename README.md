# Rob's Dot Vim Folder

This is a repo for all of my vim settings and plugin setup. Couple notes that might be helpful when installing this on a new system:

After cloning the repo into your .vim directory, create a softlink from your home directory into .vim
    ln -s ~/.vim/.vimrc ~/.vimrc

Install [Vundle](https://github.com/gmarik/vundle)
     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Open up vim and run the following command to install all plugins via Vundle
    :BundleInstall

To clean up any old plugins not managed by Vundle you can run
    :BundleClean

If you are using gvim on Windows copy _winvimrc into your home directory and rename it _gvimrc. You can't just use a soft link for this because some settings don't seem to load correctly (error bell comes to mind).

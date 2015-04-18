#!/bin/bash


TIMESTAMP=$(date +%s)
APP_DIR="$HOME/.dotfiles"

SWAP_DIR="$HOME/.vim_swap"
BUFFER_DIR="$HOME/.vim_backup"
VIM="$HOME/.vim"
VIMRC="$HOME/.vimrc"
VIMRB_BUNDLE="$HOME/.vimrc.bundles"
TMUX="$HOME/.tmux.conf"
ZSHRC="$HOME/.zshrc"

echo "Install vundle"
git clone https://github.com/gmarik/Vundle.vim.git "$VIM/bundle/Vundle.vim"

echo ""
echo "Install Powerline fonts"
"$APP_DIR/fonts/install.sh"

echo ""
echo "Install italic suppot font TERMINFO"
tic "$APP_DIR/xterm-256color-italic.terminfo"

if [ -d "$VIM" ]
    then
        echo "Move existing .vim folder to backup"
        mv "$VIM $VIM.$TIMESTAMP"
fi

if [ ! -d "$SWAP_DIR" ]
    then
        echo "Creating swap folder "
        mkdir "$SWAP_DIR"
fi

if [ ! -d "$BUFFER_DIR" ]
    then
        echo "Creating buffer folder "
        mkdir "$BUFFER_DIR"
fi

if [ -f "$VIMRC" ]
then
    echo "Move existing vimrc to backup"
    mv "$VIMRC $VIMRC.$TIMESTAMP"
fi

if [ -f "$VIMRC" ]
then
    echo "Move existing vimrc bundles to backup"
    mv "$VIMRC_BUNDLE $VIMRC_BUNDLE.$TIMESTAMP"
fi

if [ -f "$TMUX" ]
then
    echo "Move existing tmux config to backup"
    mv "$TMUX $TMUX.$TIMESTAMP"
fi

if [ -f "$ZSHRC" ]
then
    echo "Move existing zshrc file to backup"
    mv "$ZSHRC $ZSHRC.$TIMESTAMP"
fi

ln -s "$APP_DIR/.vim" "$VIM"

ln -s "$APP_DIR/.tmux.conf" "$TMUX"

ln -s "$APP_DIR/.zshrc" "$ZSHRC"

ln -s "$APP_DIR/.vimrc" "$VIMRC"

ln -s "$APP_DIR/.vimrc.bundles" "$VIMRB_BUNDLE"

echo "\n"
echo "type ':BundleInstall' in Vim"
read "Press any key to continue..."
vim

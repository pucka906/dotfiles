#!/bin/bash

if [ -e "$HOME/.dotfiles" ]; then
	ln -sfv $HOME/.dotfiles/.bash_aliases $HOME
	ln -sfv $HOME/.dotfiles/.vim $HOME
	ln -sfv $HOME/.dotfiles/.vimrc $HOME
fi

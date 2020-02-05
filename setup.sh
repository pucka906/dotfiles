#!/bin/bash
set -e

if [ $EUID -ne 0 ]; then
	echo "Please run as root"
	exit
fi

echo -e "\e[33m

                        ____        __  _____ __
                       / __ \____  / /_/ __(_) /__  _____
                      / / / / __ \/ __/ /_/ / / _ \/ ___/
                     / /_/ / /_/ / /_/ __/ / /  __(__  )
                    /_____/\____/\__/_/ /_/_/\___/____/\e[0m

--------------------------------------------------------------------------------
                    \e[33mWELCOME TO THE DOTFILES INSTALLER!\e[0m
--------------------------------------------------------------------------------
"

if [ -e "$HOME/.dotfiles" ]; then
	echo "Files already exist"
	echo "You need to delete these existing files $HOME/.dotfiles"
	exit
fi

# Check git
git --version

echo "Successfully!"
echo "The following NEW directory will be installed: ~/.dotfiles"
echo "This will be added in ~/:  .bash_aliases .vimrc .vim"
echo "Do you want to continue? [y/n]"

read choice

if [ "$choice" = "y" -o "Y" ]; then
	echo "Creating the directory ..."
	mkdir -p "$HOME/.dotfiles"
	echo "Cloning a repository ..."
	s=`$pwd`
	cd "$HOME/.dotfiles"
	git clone https://github.com/pucka906/dotfiles.git

	mv -v ./dotfiles/{.[!.],}* ./
	rm -r dotfiles/

	mkdir .vim/autoload/ .vim/plugged/
	curl -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo "Installing shell initializer ..."
	if [ -e "$HOME/.dotfiles" ]; then
    	ln -sfv $HOME/.dotfiles/.bash_aliases $HOME
    	ln -sfv $HOME/.dotfiles/.vim $HOME
    	ln -sfv $HOME/.dotfiles/.vimrc $HOME
	fi
	echo "Done!"
	cd $s
else
	echo "ABORT!"
fi

echo "Install and update apt packages? [y/n]"

read choice

if [ "$choice" = "y" -o "Y" ]; then

	echo "Package Installation ..."

	# packages
	apt-get install -y vim
	apt-get install -y htop

	# update && upgrade
	apt-get update
	apt-get upgrade
	apt-get autoremove

	echo "Done!"
fi

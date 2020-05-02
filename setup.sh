#!/bin/bash
set -e

if [ ! $EUID -ne 0 ]; then
	echo "Please don't run root"
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

# Files
FILES=(".bashrc" ".bash_aliases" ".vim" ".vimrc" ".gitconfig")

echo "Successfully!"
echo "The following NEW directory will be installed: ~/.dotfiles"
echo "This will be added in ~/: ${FILES[@]}"
echo "Do you want to continue? [y/n]"

read choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
	echo "Creating the directory ..."
	mkdir -p "$HOME/.dotfiles"

	s="$pwd"
	cd $HOME/.dotfiles/

	echo "Cloning a repository ..."
	git clone https://github.com/pucka906/dotfiles.git

	mv -v ./dotfiles/{.[!.],}* ./
	rm -r dotfiles/

	mkdir backup/
	mkdir .vim/autoload/ .vim/plugged/
	curl -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo "Your files will be located in: ~/.dotfiles/backup/"
	echo "Backuping your files ..."

	for item in ${FILES[*]}; do
		if [ -f "$HOME/$item" ]; then
			mv -r $HOME/$item $HOME/.dotfiles/backup/
		fi
	done

	sleep 4

	echo "Initialize file copy ..."
	for item in ${FILES[*]}; do
		cp -v $HOME/.dotfiles/$item $HOME
	done

	echo "Done!"
	cd $s
else
	echo "ABORT!"
fi

echo "Install and update apt packages? [y/n]"

read choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then

	echo "Getting the distribution name ..."

	DISTRO=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

	echo "Getting packages ..."

	filepath="$HOME/.dotfiles/package_list.txt"

	packages=""
	n=0

	while read line; do
		packages+="$line "
		n=$((n + 1))
	done < $filepath

	echo "RECD ($n) packages:"
	echo -e "\t $packages\n"

	echo "Package Installation ..."

	if [ $DISTRO == "arch" -o $DISTRO == "manjaro" ]; then

		# install packages
		sudo pacman -S --noconfirm $packages

		echo "Upgrade Packages ..."

		# upgrade
		sudo pacman -Syu
		sudo pacman -Rns $(pacman -Qtdq)

		echo "Done!"
	elif [ $DISTRO == "ubuntu" -o $DISTRO == "debian" ]; then

		# install packages
		sudo apt-get install -y $packages

		echo "Upgrade Packages ..."

		# update && upgrade
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get autoremove

		echo "Done!"
	elif [ $DISTRO == "red hat" -o $DISTRO == "fedora" ]; then

		# install packages
		sudo dnf install $packages

		echo "Upgrade Packages ..."

		# upgrade
		sudo dnf upgrade

		echo "Done!"
	elif [ $DISTRO == "opensuse" -o $DISTRO == "sles" ]; then

		# install packages
		sudo zypper install $packages

		echo "Upgrade Packages ..."

		# update
		sudo zypper update

		echo "Done!"
	elif [ $DISTRO == "void linux"]; then

		# install packages
		sudo xbps-install -S $packages

		echo "Upgrade Packages ..."

		# upgrade
		sudo xbps-install -Su

		echo "Done!"
	else
		echo "Distribution not found\nABORT!"
	fi
else
	echo "ABORT!"
fi

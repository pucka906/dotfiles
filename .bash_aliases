#!/bin/bash

# -------------------------
# ALIASES
# -------------------------
alias cls='clear'

alias v='vim'
alias sv='sudo vim'

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir='ls -lF'

# alias grep commands
alias grep='grep --color=auto'
alias fgrep='grep --color=auto'
alias egrep='egrep --color=auto'

# alias chmod commands
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# compress files
alias mktar='tar -cvf'

# decompress files
alias untar='tar -xvf'

# ------------------------- 
# FUNCTION
# -------------------------

# extract any archive(s)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

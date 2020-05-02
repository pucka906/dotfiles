# -------------------------
# DEFAULT SETTINGS
# -------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -------------------------
# ALIASES
# -------------------------

source ~/.bash_aliases

# -------------------------
# PROMPT
# -------------------------

PS1='[\u@\h \W]\$ '

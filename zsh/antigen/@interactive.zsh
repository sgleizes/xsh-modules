#
# Antigen module for zsh.
# https://github.com/zsh-users/antigen
#

# Path to the antigen installation.
ANTIGEN_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/antigen/antigen.zsh"
ADOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/antigen"

# Install antigen if necessary.
if [[ ! -f $ANTIGEN_PATH ]]; then
  print -P "%F{33}:: Installing zsh-users/antigen...%f"
  command mkdir -p ${ANTIGEN_PATH:h}
  command curl -L 'git.io/antigen' >$ANTIGEN_PATH \
    && print -P "%F{34}:: Installation successful%f%b" \
    || { print -P "%F{160}:: Installation failed%f%b" && return 1 }
fi

# Source antigen.
source $ANTIGEN_PATH

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

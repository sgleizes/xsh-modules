#
# Zplug module for zsh.
# https://github.com/zplug/zplug
#

# Path to the zplug installation.
ZPLUG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/zplug"

# Install zplug if necessary.
if [[ ! -d $ZPLUG_HOME ]]; then
  print -P "%F{33}:: Installing zplug/zplug...%f"
  command git clone 'https://github.com/zplug/zplug' $ZPLUG_HOME \
    && print -P "%F{34}:: Installation successful%f%b" \
    || { print -P "%F{160}:: Installation failed%f%b" && return 1 }
fi

# Source zplug.
source $ZPLUG_HOME/init.zsh

# Set the prezto prompt theme.
zstyle ':prezto:module:prompt' theme 'powerlevel10k'

# Supports oh-my-zsh and prezto plugins.
zplug "plugins/git",    from:oh-my-zsh
zplug "modules/prompt", from:prezto

# Or plugins from any other repo.
zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  read -q && echo && zplug install
fi

# Source plugins and add commands to the PATH.
zplug load

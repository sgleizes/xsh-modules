#
# Zinit module for zsh.
# https://github.com/zdharma/zinit
#

# Paths for the zinit installation.
typeset -gAH ZINIT
ZINIT[HOME_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}/zinit"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
ZPFX="$ZINIT[HOME_DIR]/prefix"

# Install zinit if necessary.
if [[ ! -f $ZINIT[HOME_DIR]/bin/zinit.zsh ]]; then
  print -P "%F{33}:: Installing zdharma/zinit...%f"
  command mkdir -p $ZINIT[HOME_DIR]
  command git clone 'https://github.com/zdharma/zinit' $ZINIT[HOME_DIR]/bin \
    && print -P "%F{34}:: Installation successful%f%b" \
    || { print -P "%F{160}:: Installation failed%f%b" && return 1 }

  # Patch scope: apply available patches to zinit.
  patch_dir="${0:h}/patch"
  function {
    # Apply patch to git-process-output.
    local patch="$patch_dir/zinit-git-process-output.patch"
    patch -d $ZINIT[HOME_DIR]/bin -p1 -r- -suN <$patch |& grep -q 'FAILED' \
      && print -P ":: %F{red}ERROR%f: failed to apply $patch"
  }
  unset patch_dir
fi

# Automatically compile sourced scripts.
# To enable, run `zinit module build`.
# To see the list of sourced files and their loading time, run `zpmod source-study -l`.
# module_path+=($ZINIT[HOME_DIR]/bin/zmodules/Src)
# zmodload -s zdharma/zplugin

# Source zinit.
source $ZINIT[HOME_DIR]/bin/zinit.zsh

# Remove redundant zinit aliases and functions.
unalias zini zpl zplg
unfunction zpcdclear zpcdreplay zpcompdef zpcompinit zplugin

# Install zinit annexes.
zinit light-mode depth=1 for \
  zinit-zsh/z-a-bin-gem-node

# Install zinit consolette for plugin management.
zinit light-mode lucid depth=1 trackbinds for \
  blockf bindmap'^O^Z -> hold' zdharma/zui \
         bindmap'^O^J -> ^O^Z' zinit-zsh/zinit-console

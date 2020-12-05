# Zinit module

This module provides an integration with
[zinit](https://github.com/zdharma/zinit) for demonstration purposes.
It comes with the
[z-a-bin-gem-node annex](https://zdharma.org/zinit/wiki/z-a-bin-gem-node/)
and the [zinit-console](https://github.com/zinit-zsh/zinit-console)
bound to `C-o C-z`.

An opinionated patch is also included for demonstration purposes.

Integration with the
[zinit module](https://github.com/zdharma/zinit#zinit-module) is disabled by
default and can be uncommented if desired.

To migrate your zinit configuration to xsh, you can copy this module, load it
first in `init.zsh` and simply put your configuration in other xsh modules.

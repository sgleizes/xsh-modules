# Antigen module

This module provides an integration with
[antigen](https://github.com/zsh-users/antigen) for demonstration purposes.
It comes with the default configuration example taken from the
[README](https://github.com/zsh-users/antigen#usage).

To migrate your antigen configuration to xsh, you can copy this module and
apply your customizations to `@interactive.zsh`.

You can load antigen first and split your antigen commands in multiple modules,
along with your customizations. Just don't forget to run `antigen apply` in the
last module, or use a dedicated module for that.

# Xsh Modules

This repository is a collection of self-contained
[xsh](https://github.com/sgleizes/xsh) modules for demonstration purposes.

It is meant as a quick way to integrate with the various plugin managers and
frameworks available out there. It is not meant to be a library of modules for
specific applications, since this is what plugin managers and libraries already
provide.

## Usage

Simply clone this repository somewhere and copy the module(s) you are interested
in to your xsh configuration directory:

```sh
git clone https://github.com/sgleizes/xsh-modules
cp -r xsh-modules/zsh/zinit $XSH_CONFIG_DIR/zsh
```

Then register the module in your
[xsh init file](https://github.com/sgleizes/xsh#initialization-file):

```sh
xsh module zinit
```

And reload your shell:

```sh
exec zsh
```

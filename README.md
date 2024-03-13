# Dotfiles

This directory contains the dotfiles for my system managed with GNU stow.

## Installation

1. Clone the repository.

```
$ git clone git@github.com/evanjo03/dotfiles.git
$ cd dotfiles
```

2. Backup existing files.

```
mv ~/$HOME/.config ~/$HOME/.config.bak
mv ~/$HOME/.tmux.conf ~/$HOME/.tmux.conf
```

3. Use stow to install the dotfiles.

```
$ stow .
```

## TODO: Merge with `stow --adopt`

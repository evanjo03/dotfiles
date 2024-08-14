# Dotfiles

This directory contains the dotfiles for my system managed with GNU stow.

## Requirements

1. Install git
2. Install GNU stow

## Installation

1. Clone the repository to $HOME.

```
$ git clone https://github.com/evanjo03/dotfiles.git
$ cd dotfiles
```

2. Backup existing files.

```
$ mv $HOME/.config $HOME/.config.bak
$ mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
```

3. Use stow to install the dotfiles.

```
$ stow .
```


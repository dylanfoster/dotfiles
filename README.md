dotfiles
========

System bootstrap for OS X and Ubuntu

## Installation

`bash -c "$(curl -fsSL https://raw.github.com/dylan947/dotfiles/master/bin/dotfiles)"`


## Veni, vidi, vici

Installs and boostraps your system in a few steps in `.dotfiles/bin/dotfiles`

### init

The meat of the dotfiles, this runs most of the bootstrapping.

### link

Symlinks that will be linked to $HOME

### bin

Anything inside of `bin` can be accessed during your terminal session.

## What's inside

### Homebrew

Of course, we use Homebrew for just about everything on OS X

### Git

If git is not installed, it will be by Homebrew. In addtion, we'll include git-extras to make your gitting even better

### n and Node.js

[n](https://github.com/visionmedia/n) is Node version manager which will install the latest stable version of Node.js

### Vim and Neobundle

Vim. That is all that needs to be said

### [Fish-shell](http://fishshell.com)

## Thanks

Thanks for the footwork

 - Ben Truyman [dotfiles](https://github.com/bentruyman/dotfiles)
 - Mathias Bynens [dotfiles](https://github.com/mathiasbynens/dotfiles)

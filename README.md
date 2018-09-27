# Idearium dotfiles

Idearium dotfiles are portable bash customisations. We use them at Idearium to improve developer productivity and create easily repeatable development environments.

## OS Details

These dotfiles have been designed to work on Mac and Linux (tested on Ubuntu only).

## Requirements

- Git

## Customisation

If you'd like to customise anything or personal the dotfiles, you can do so by creating a `custom.sh` file in this directory. If it exists, it will be executed at the end of the install process. For example:

```shell
#!/usr/bin/env bash

# Check if Homebrew is installed. If not, install it.
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

# Install packages.
packages=(
  bash
  bash-completion@2
  coreutils
  git
  hub
  node
  packer
  wget
  yarn
)

brew install "${packages[@]}"

# Install Cask.
brew tap caskroom/cask

# Install apps.
apps=(
  atom
  firefox
  google-chrome
  kaleidoscope
  moom
  postman
  slack
)

brew cask install "${apps[@]}"

# Atom

# Open atom and close atom to create default directory and files.
/Applications/Atom.app/Contents/Resources/app/atom.sh
pkill atom

cat ./assets/atom-config.cson > ~/.atom/config.cson

# Install packages.
apm install docblockr
apm install editorconfig
apm install linter
apm install linter-csslint
apm install linter-eslint
apm install linter-sass-lint
apm install pigments
apm install sort-lines
```

## Setup

1. Execute `git clone https://github.com/idearium/dotfiles.git` to clone this repository.
1. Execute `cd ./dotfiles`.
1. Create either a `.mac` or `.linux` file (i.e. `touch .mac`) in this repository's directory.
1. Create a local `.gitconfig`:
    - `git config --file ./.gitconfig --add user.name "Your Name"`
    - `git config --file ./.gitconfig --add user.email "your@email.com"`
1. Execute `./install`.

_For Mac_, everything should be working now.

_For Ubuntu_, follow these additional steps:

1. Add the following to ``~/.bashrc`

```sh
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
```

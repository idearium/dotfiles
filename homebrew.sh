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
    "bash"
    "bash-completion@2"
    "git"
    "hub"
    "kubernetes-cli"
    "nvm"
    "packer"
    "yarn --without-node"
)

for package in "${packages[@]}"; do

    if ! brew list -1 | grep -q "^${package}\$"; then
        brew install $package
    fi

done

# Install Cask.
brew tap caskroom/cask

# Install apps.
apps=(
    "1password"
    "browserstacklocal"
    "docker"
    "firefox"
    "focus-booster"
    "google-chrome"
    "google-cloud-sdk"
    "gpg-suite"
    "kaleidoscope"
    "moom"
    "nordvpn"
    "postman"
    "sequel-pro"
    "slack"
    "transmit"
    "vagrant"
    "vagrant-vmware-utility"
    "visual-studio-code"
    "vmware-fusion10"
)

for app in "${apps[@]}"; do

    if ! brew cask list -1 | grep -q "^${app}\$"; then
        brew cask install $app
    fi

done

# VSCode

cat ./assets/vscode-settings.json > ~/Library/Application\ Support/Code/User/settings.json

# Install packages.
code --install-extension EditorConfig.editorconfig
code --install-extension PeterJausovec.vscode-docker
code --install-extension Tyriar.sort-lines
code --install-extension WallabyJs.quokka-vscode
code --install-extension akamud.vscode-theme-onelight
code --install-extension akamud.vscode-theme-onedark
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension joelday.docthis
code --install-extension ms-vscode.atom-keybindings
code --install-extension naumovs.color-highlight
code --install-extension hookyqr.beautify
code --install-extension bungcip.better-toml
code --install-extension zamerick.vscode-caddyfile-syntax
code --install-extension ilich8086.coldfusion
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension mermade.openapi-lint
code --install-extension redhat.vscode-yaml
code --install-extension eg2.vscode-npm-script
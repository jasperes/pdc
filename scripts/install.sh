#!/usr/bin/env bash

install_dependencies() {
    sudo apt-get install "${pdcyml_dependencies[@]}"
}

install_tldr() {
    log_info "Installing tldr..."
    local location=/usr/local/bin/tldr  # elevated privileges needed for some locations
    sudo wget -qO $location https://raw.githubusercontent.com/pepa65/tldr-bash-client/master/tldr
    sudo chmod +x $location
    log_info "tldr installed!"
}

install_oh_my_zsh() {
    log_info "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    log_info "oh-my-zsh installed!"
}

install_spf13() {
    log_info "Installing spf13-vim3..."
    sh <(curl https://j.mp/spf13-vim3 -L)
    log_info "spf13-vim3 installed!"
}

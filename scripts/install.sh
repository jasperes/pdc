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

install_sublime() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
}

install_soapui() {
    cd "$pdcyml_tmp"
    curl -O "https://b537910400b7ceac4df0-22e92613740a7dd1247910134033c0d1.ssl.cf5.rackcdn.com/soapui/5.3.0/SoapUI-x64-5.3.0.sh" &&
    bash "./SoapUI-x64-5.3.0.sh"
}

#!/usr/bin/env bash

install_theme() {
    if [ "$(echo "$XDG_CURRENT_DESKTOP")" = 'GNOME' ]; then
        know_distro "Debian" && gnome_shell_debian_theme
        know_distro "Ubuntu" && gnome_shell_ubuntu_theme
    fi
}

gnome_shell_debian_theme() {
    echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /' > /etc/apt/sources.list.d/arc-theme.list 
    sudo tee /etc/apt/sources.list.d/papirus-ppa.list << EOF
    deb http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
EOF

    wget -nv https://download.opensuse.org/repositories/home:Horst3180/Debian_8.0/Release.key -O Release.key
    apt-key add - < Release.key
    sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E58A9D36647CAE7F

    apt-get update
    apt-get install arc-theme papirus-icon-theme
}

gnome_shell_ubuntu_theme() {
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
    sudo add-apt-repository ppa:papirus/papirus
    
    wget -nv https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
    apt-key add - < Release.key

    sudo apt-get update
    sudo apt-get install arc-theme papirus-icon-theme
}

know_distro() {
    local distro=$1
    return "$(cat /etc/*-release | grep "$distro")"
}

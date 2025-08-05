#!/bin/bash

# Function to display a header
function show_header() {
    clear
    echo "====================================="
    echo "       Linux System Updater        "
    echo "====================================="
    echo
}

# Detect the distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
    fi
}

# Update for Ubuntu-based (apt)
update_ubuntu() {
    echo "Updating Ubuntu..."
    sudo apt update && sudo apt upgrade -y
}

# Update for Fedora-based (dnf)
update_fedora() {
    echo "Updating Fedora..."
    sudo dnf update -y
}

# Update for Arch-based (pacman)
update_arch() {
    echo "Updating Arch Linux..."
    sudo pacman -Syu --noconfirm
}

# Update for Debian-based (apt)
update_debian() {
    echo "Updating Debian..."
    sudo apt update && sudo apt upgrade -y
}

# Update for OpenSUSE-based (zypper)
update_opensuse() {
    echo "Updating OpenSUSE..."
    sudo zypper refresh && sudo zypper update -y
}

# Update for Void Linux (xbps)
update_void() {
    echo "Updating Void Linux..."
    sudo xbps-install -Syu
}

# Update for Manjaro (pacman)
update_manjaro() {
    echo "Updating Manjaro..."
    sudo pacman -Syu --noconfirm
}

# Update for Arch-based (yay for AUR)
update_yay() {
    echo "Updating AUR packages..."
    yay -Syu --noconfirm
}

# Update for CentOS-based (dnf)
update_centos() {
    echo "Updating CentOS..."
    sudo dnf update -y
}

# Update for Pop!_OS (apt)
update_popos() {
    echo "Updating Pop!_OS..."
    sudo apt update && sudo apt upgrade -y
}

# Execute the appropriate update command based on the distro
run_update() {
    case "$ID" in
        "ubuntu"|"debian")
            update_ubuntu
            ;;
        "fedora")
            update_fedora
            ;;
        "arch"|"manjaro")
            update_arch
            ;;
        "opensuse")
            update_opensuse
            ;;
        "void")
            update_void
            ;;
        "pop")
            update_popos
            ;;
        "centos")
            update_centos
            ;;
        *)
            echo "Unknown distribution or no supported package manager found."
            ;;
    esac
}

# Main script execution
show_header
detect_distro
run_update

# End of script
echo "Update complete!"

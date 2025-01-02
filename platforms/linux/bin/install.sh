#!/bin/bash

# Create application directories
mkdir ~/.jvm
mkdir ~/.jvm/bin
mkdir ~/.jvm/current
mkdir ~/.jvm/installed-versions
mkdir ~/.jvm/tmp

# Copy jvm file to created bin directory and make it an executable
cp ./jvm ~/.jvm/bin/jvm
chmod +x ~/.jvm/bin/jvm

# Update shell init file to include jvm executables in PATH
#
# Arguments:
#     $1 = shell init file
add_to_rc() {
    path_update="export PATH=\$HOME/.jvm/bin:\$HOME/.jvm/current/bin:\$PATH";
    
    # Only update the file if needed
    if ! grep -q "$path_update" "$1"; then
	echo $path_update >> $1;
    fi
}

if [ "$SHELL" == "/bin/bash" ]; then
    add_to_rc $HOME/.bashrc;
elif [ "$SHELL" == "/bin/zsh" ]; then
    add_to_rc $HOME/.zshrc;
fi


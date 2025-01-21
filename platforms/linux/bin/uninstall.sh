#!/bin/bash

# Delete jvm directories
rm -Rf $HOME/.jvm

# Modify shell init file to remove any lines containing ".jvm"
#
# Arguments:
#     $1 = shell init file
remove_from_rc() {
    sed -in "/\.jvm/d" $1; 
}

if [ "$SHELL" == "/bin/bash" ]; then
    remove_from_rc $HOME/.bashrc;
elif [ "$SHELL" == "/bin/zsh" ]; then
    remove_from_rc $HOME/.zshrc;
fi


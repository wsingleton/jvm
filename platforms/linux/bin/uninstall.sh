#!/bin/bash

# Delete jvm directories
rm -Rf $HOME/.jvm

# Modify .bashrc to remove any lines containing ".jvm"
sed -in "/\.jvm/d" $HOME/.bashrc


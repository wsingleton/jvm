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

# Add location of jvm executable and location of current Java version bin to PATH
cat bashrc-contents >> $HOME/.bashrc


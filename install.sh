#!/bin/bash

mkdir ~/.jvm
mkdir ~/.jvm/bin
mkdir ~/.jvm/current
mkdir ~/.jvm/installed-versions
mkdir ~/.jvm/tmp

cp ./jvm ~/.jvm/bin/jvm

echo export PATH=\$HOME/.jvm/bin:\$HOME/.jvm/current/bin:\$PATH >> $HOME/.bashrc


#!/bin/bash

rm -Rf $HOME/.jvm
sed -in "/\.jvm/d" $HOME/.bashrc

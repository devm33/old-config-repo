#!/bin/bash

# Script to pull config files into this directory
#
# devraj mehta

HERE="`dirname ${BASH_SOURCE[0]}`" # regardless of caller loc put files $HERE

echo "COPYING CONFIG FILES TO $HERE";

# copy the files

## bash
cp -f ~/.bashrc $HERE/bashrc;
cp -f ~/.bash_aliases $HERE/bash_aliases;
cp -f ~/.bash_logout $HERE/bash_logout;

## vim
cp -f ~/.vimrc $HERE/vimrc;

## pianobar
cp -rf ~/.config/pianobar $HERE/pianobar;



# done
echo "DONE";



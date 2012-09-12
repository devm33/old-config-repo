#!/bin/bash

# Script to pull config files into this directory
# Then commits the files to git and pushes to github
#
# devraj mehta

HERE="`dirname ${BASH_SOURCE[0]}`" # regardless of caller loc put files $HERE
echo "$(date) ${0} updating config_repo";
echo "COPYING CONFIG FILES TO $HERE";

# copy the files

## bash
cp -f ~/.bashrc $HERE/bashrc;
cp -f ~/.bash_aliases $HERE/bash_aliases;
cp -f ~/.bash_logout $HERE/bash_logout;

## vim
cp -f ~/.vimrc $HERE/vimrc;

## pianobar
cp -rf ~/.config/pianobar $HERE;

## apache2
cp -rf /etc/apache2/sites-available $HERE;

# push to git
cd $HERE; 
git add .; # add all untracked files
git commit -a -m "automated commit from $(whoami)@$(uname -n) $(date)";
git push -u github master;

# done
echo "DONE";



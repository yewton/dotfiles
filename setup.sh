#!/bin/bash
FILES=(".tmux-powerlinerc" ".tmux.conf" ".zshrc" "tmux-powerline/themes/clarity.sh")

(cd `dirname $0`
 PWD=`pwd`
 for FILE in ${FILES[@]}; do
     TO=$PWD/$FILE
     FROM=~/$FILE
     if [ -f $FROM ]; then
         echo "${FROM} already exists."
     else
         echo "${FROM} -> ${TO}"
         ln -s $TO $FROM
     fi
 done)

#!/bin/bash
FILES=(".pydistutils.cfg" ".tmux.conf" ".zshrc" ".config/powerline")

(
    cd `dirname $0`
    PWD=`pwd`
    for FILE in ${FILES[@]}; do
        TO=$PWD/$FILE
        FROM=~/$FILE
        if [ -e $FROM ]; then
            echo "${FROM} already exists."
        else
            echo "${FROM} -> ${TO}"
            ln -s $TO $FROM
        fi
    done
)

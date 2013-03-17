#!/bin/sh
basedir=`dirname $0`

ln -s "${basedir}/.tmux-powerlinerc" ~/.tmux-powerlinerc
ln -s "${basedir}/.tmux.conf"        ~/.tmux.conf
ln -s "${basedir}/.zshrc"            ~/.zshrc
ln -s "${basedir}/clarity.sh"        ~/tmux-powerline/themes/clarity.sh

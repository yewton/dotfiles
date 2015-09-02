source $HOME/.zshrc_setup

source $ZSH/oh-my-zsh.sh

if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    if which pyenv 2>&1 >/dev/null; then export PATH=$(pyenv root)/shims:$PATH; fi
    test -z "$TMUX" && test "$TERM" != "dumb" && (tmux attach || tmux new-session)
fi

export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

setopt transient_rprompt
setopt IGNORE_EOF

source $HOME/.zshrc_env

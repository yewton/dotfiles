export PATH=/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/bin
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv 2>&1 >/dev/null; then eval "$(rbenv init -)"; fi
if which pyenv 2>&1 >/dev/null; then eval "$(pyenv init -)"; fi

export PATH=/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/bin
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv 2>&1 >/dev/null; then eval "$(rbenv init -)"; fi
if which pyenv 2>&1 >/dev/null; then eval "$(pyenv init -)"; fi
# cf. https://github.com/yyuu/pyenv/issues/106#issuecomment-94921352
if which pyenv 2>&1 >/dev/null; then alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"; fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# Load keys from keychain into agent

# { eval `ssh-agent`; ssh-add -A; } &>/dev/null
ssh-add -A &>/dev/null

# Lesspipe
if which lesspipe.sh >/dev/null; then
    eval $( lesspipe.sh )
fi

# Perlbrew
source ~/perl5/perlbrew/etc/bashrc

# Perl local::lib
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# Vault

export VAULT_ADDR=https://dns.fz.sdlocal.net:8200

# Editor
export VISUAL="atom -nw"
export EDITOR="$VISUAL"

# added by travis gem
[ -f /Users/adamc/.travis/travis.sh ] && source /Users/adamc/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/bin" # Add home bin PATH for local scripts

export PATH="/usr/local/opt/openssl101/bin:$PATH"

eval "$(direnv hook bash)"

export PATH="/usr/local/sbin:/usr/local/bin:/Users/adamc/Development/flutter/bin:$PATH"

export PATH="/usr/local/lib/balena-cli:$PATH"

complete -C /usr/local/bin/mc mc

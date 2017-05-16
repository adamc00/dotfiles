export BASH_IT_CUSTOM=~/Development/dotfiles

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


# Editor
export VISUAL="atom -nw"
export EDITOR="$VISUAL"

# Bash
# export HISTCONTROL=ignoreboth:erasedups

# added by travis gem
[ -f /Users/adamc/.travis/travis.sh ] && source /Users/adamc/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/usr/local/opt/openssl101/bin:$PATH"

eval "$(direnv hook bash)"

export PATH=~/bin:$PATH

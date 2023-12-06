# vim: set ts=4 sw=4 expandtab
[ -f /etc/bashrc ] && . /etc/bashrc

export PATH="${HOME}/.local/bin:${PATH}"   
export HISTFILE=${HOME}/.cache/bash_history
export EDITOR=vi

alias ll="ls -l"
alias la="ls -la"
alias mv="mv -vi"
alias cp="cp -vi"
alias rm="rm -vi"
alias wget="wget --no-hsts"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

if command -v podman > /dev/null; then
    source <(podman completion bash)
fi

# 
PS1='\[\033[33;1m\]${PS_ENV:+$(PS_ENV)}\[\033[0m\]'
PS1+='\[\033[34;1m\]\w\[\033[0m\]'
PS1+='\n\[\033[35;1m\]> \[\033[0m\]'

#
if [ -d "${HOME}/.config/bash.d" ]; then
    if [ "$(stat -c '%a' ${HOME}/.config/bash.d)" == 700 ]; then
        for cfg in "${HOME}/.config/bash.d"/*; do
            [ -f "$cfg" ] && source "$cfg"
         done
    else
        printf '%s\n' "Unsecure permissions, skipping ~/.config/bash.d"
    fi
fi

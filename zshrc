#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Aliases
alias g='git'
alias v='Vim'
alias t='tmux'
alias c='cd'
alias z='zeus'
alias be='bundle exec'

# Servers and Processes
alias running_rs='lsof -wni tcp:3000'

alias psql.server='postgres -D /usr/local/var/postgres'

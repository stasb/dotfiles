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
alias ns='npm install'

# Servers and Processes
alias running_rs='lsof -wni tcp:3000'

alias psql.server='postgres -D /usr/local/var/postgres'

alias dj_start='RAILS_ENV=development bin/delayed_job start'
alias dj_stop='RAILS_ENV=development bin/delayed_job stop'
alias dj_restart='RAILS_ENV=development bin/delayed_job restart'

runNodemon() {
  nodemon $1
}

alias nod=runNodemon

# If you installed the SDK via Homebrew, otherwise ~/Library/Android/sdk
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

export NVM_DIR="/Users/stanislavbelkov/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

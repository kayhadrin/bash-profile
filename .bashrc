# Git aliases
alias gits="git status"
alias gitc="git commit"
alias gitb="git branch"
alias gs='git status'
alias gc='git commit'
alias gb='git branch'
alias gbr='git branch -r'
alias gf='git fetch && git fetch --tags'
alias gl='git log --graph --decorate --oneline'
alias gt='git tag -l'
alias gtl='git for-each-ref --format="%(taggerdate): %(refname)" --sort=-taggerdate --count=10 refs/tags'

# General bash aliases
alias ll="ls -al --color"
alias new="start bash --login -l" # create a new shell terminal on msysgit Windows

# SSH setup
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
  }
else
  start_agent;
fi
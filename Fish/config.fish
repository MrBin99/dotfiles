set -g -x fish_greeting ''

# OMF Pure
set pure_color_success yellow

# Base
alias ls 'ls --color'
alias ll 'ls -l'
alias la 'ls -a'
alias lla 'ls -la'

# Change directory aliases
alias home 'cd ~'
alias cd.. 'cd ..'

# Git
alias gcm 'git commit -m '
alias gc 'git commit '
alias gaa 'git add . '
alias ga 'git add '
alias gb 'git branch '
alias gch 'git checkout '
alias gd 'git diff '
alias gs 'git status '
alias gm 'git marge '
alias gr 'git rebase '
alias gp 'git push '
alias gl 'git log '
alias glo 'git log --oneline --graph --color --all --decorate'
alias gf 'git flow'

# Hosts
abbr hosts 'sudo vim /c/Windows/System32/drivers/etc/hosts'

# Paths
set -U fish_user_paths $HOME/.poetry/bin $fish_user_paths

set -U fish_user_paths $HOME/.pyenv/bin $fish_user_paths
set -U fish_user_paths $HOME/.pyenv/shims $fish_user_paths

# ---------------------------------------------------------------------------- #
#                          MrBi99 - Bash configuration                         #
# ---------------------------------------------------------------------------- #

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
    *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL="erasedups:ignoreboth"

# For setting history length.
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
shopt -s nocaseglob

# Append to the history file, don't overwrite it.
shopt -s histappend

# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# Bash default prompt.
if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;33m\]>\[\033[00m\] "
else
  PS1="${debian_chroot:+($debian_chroot)}\w\n\$ "
fi

unset color_prompt force_color_prompt

# Add a blank line after each command.
PROMPT_COMMAND="echo"

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first'
  alias dir='dir --color=auto --group-directories-first'
  alias vdir='vdir --color=auto --group-directories-first'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Add more aliases.
alias ll="ls -alF"
alias la="ls -A"

# Bash completions.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add local stuff to the path.
export PATH="$HOME/.local/bin:$PATH"

# Add Rust stuff to the path.
if [[ -d "$HOME/.cargo/bin" ]]; then
  . "$HOME/.cargo/env"
fi

# Start Pyenv.
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Start NVM.
if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Start Phpenv.
if [[ -d "$HOME/.phpenv" ]]; then
  export PHPENV_ROOT="$HOME/.phpenv"
  export PATH="$PHPENV_ROOT/bin:$PATH"
  eval "$(phpenv init bash -)"
fi

# Add terraform completions.
complete -C /usr/bin/terraform terraform

# zsh Setting
autoload -U compinit
compinit

# PATH Setting
export PATH=$PATH:/Developer/usr/bin/:/usr/local/google_appengine/

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

# MVN (Java)
export MVN_HOME=/Users/soichiro/java/apache-maven-2.2.1
export PATH=$MVN_HOME/bin:$PATH

# Spring Roo
export ROO_HOME=/Users/soichiro/java/spring-roo-1.2.1.RELEASE
export PATH=$ROO_HOME/bin:$PATH

# RVM (Ruby)
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

# MacVim
alias mvi="mvim --remote-tab-silent"

# PHP
export PATH=/usr/local/Cellar/php/5.3.10/bin:$PATH

# MacVim for default vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'


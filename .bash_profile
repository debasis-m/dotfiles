fortune 
alias factor='gfactor'
alias ll='ls -ahlG' 
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vi='nvim'
alias tx='tmuxinator'
alias kotc='kotlinc'
alias kotrepl='kotlinc-jvm'
alias mp3player='cmus'
alias mp3dwld='youtube-dl --extract-audio --audio-format mp3'
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
PATH="~/.cargo/bin:${PATH}"
export PATH
export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.6"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
set -o vi

export PS1="\e[1;34m\u@\h \#-\! \W> \e[m"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/debasis/.sdkman"
[[ -s "/Users/debasis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/debasis/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.cargo/bin:$PATH"

if [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi

fortune 

export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
shopt -s expand_aliases 

alias ms='tumxinator-fzf-start.sh'
alias factor='gfactor'
alias ll='ls -ahlG' 
alias vi='nvim'
alias tx='tmuxinator'
alias kotc='kotlinc'
alias kotrepl='kotlinc-jvm'
alias mp3player='cmus'
alias mp3dwld='youtube-dl --extract-audio --audio-format mp3'
alias l2yt='listen-to-yt'

PATH="~/.cargo/bin:${PATH}"
export TERM="xterm-256color"
export VISUAL=vim
export EDITOR="$VISUAL"
export SHELL=$(which bash)

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
set -o vi

timer_now () {
    date +%s%N
}

timer_start () {
    timer_start=${timer_start:-$(timer_now)}
}

# export PS1="\e[1;34m\u@\h \#-\! \W> \e[m"

timer_stop () {
   local delta_us=$((($(timer_now) - $timer_start) / 1000))
   local us=$((delta_us % 1000))
   local ms=$(((delta_us / 1000) % 1000))
   local s=$(((delta_us / 1000000) % 60))
   local m=$(((delta_us / 60000000) % 60))
   local h=$((delta_us / 3600000000))

   if ((h > 0)); then timer_show=${h}h${m}m
   elif ((m > 0)); then timer_show=${m}m${s}s
   elif ((s >= 10)); then timer_show=${s}.$((ms / 100))s
   elif ((s > 0)); then timer_show=${s}.$(printf %03d $ms)s
   elif ((ms >= 100)); then timer_show=${ms}ms
   elif ((ms > 0)); then timer_show=${ms}.$((us / 100))ms
   else timer_show=${us}us
   fi
   unset timer_start
}

set_prompt () {
   Last_Command=$?
   Blue='\[\e[01;34m\]'
   White='\[\e[01;37m\]'
   Red='\[\e[01;31m\]'
   Green='\[\e[01;32m\]'
   Reset='\[\e[00m\]'
   FancyX='\342\234\227'
   Checkmark='\342\234\223'

   PS1="$White\$? "
   timer_stop
   PS1+="($timer_show) \A "
   PS1+="$Blue\\W \\\$$Reset "
}

trap 'timer_start' DEBUG
PROMPT_COMMAND='set_prompt'

listen-to-yt () {
   if [[ -z "$1" ]]; then
      echo "Enter a search string!";
   else
      mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)";
   fi
}

export PATH


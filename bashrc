# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 2)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=~/bin:$HOME/Library/Android/sdk/platform-tools/:$HOME/Library/Android/sdk/tools/:$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"

umask 0002

gerpush() {
  git push gerrit HEAD:refs/for/$1
}

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

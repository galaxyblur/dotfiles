# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 2)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 2)\]]\[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=~/bin:$HOME/Library/Android/sdk/platform-tools/:$HOME/Library/Android/sdk/tools/:$HOME/.npm/bin:$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

umask 0002

if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

gerpush() {
  git push gerrit HEAD:refs/for/$1
}

glgv() {
  git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | vim -R -c 'set filetype=git nowrap' -
}

# https://adrianperez.org/improving-dev-environments-all-the-http-things/
docker-serve-start-proxy() {
  echo "Did you create /etc/resolver/dev?"
  echo "  nameserver 127.0.0.1"
  echo "  port 53535"
  echo ""

  docker run -d -p 8080:80 --name nginx-proxy --restart always -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
  docker run -d -p 53535:53/tcp -p 53535:53/udp --name dnsmasq --restart always --cap-add NET_ADMIN andyshinn/dnsmasq --address=/dev/127.0.0.1

  echo ""
  docker ps
}

docker-serve-dot-dev() {
  vhost="$(basename $PWD).dev"
  echo "Serving current directory as $vhost:8080 ... Press Ctrl-C to stop serving"
  docker run -it --rm -v $PWD:/usr/share/nginx/html/ -e VIRTUAL_HOST=$vhost nginx
}

docker-serve-localhost() {
  echo "Serving current directory as localhost ... Press Ctrl-C to stop serving"
  docker run -it --rm --name nginx-localhost -v $PWD:/usr/share/nginx/html:ro -p 80:80 nginx
}

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/cbrown/.nvm/versions/node/v8.1.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/cbrown/.nvm/versions/node/v8.1.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/cbrown/.nvm/versions/node/v8.1.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/cbrown/.nvm/versions/node/v8.1.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
###-tns-completion-start-###
if [ -f /Users/cbrown/.tnsrc ]; then 
    source /Users/cbrown/.tnsrc 
fi
###-tns-completion-end-###

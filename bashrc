export PS1=" |\n\[\033[0;1;4;34m\] |                                                                                                   \r\[\033[0m\] |\[\033[1;34m\] \w \n \[\033[0m\]|\[\033[1;34m\] pi-dev \t => \[\033[0m\]"
export PS2=" | \[\033[1;34m\]pi-dev \t => \[\033[0m\]"

export DEV_DIR=/usr/src/app

# create ~/.ssh directory from ~/.ssh-orig and ~/.ssh-config
mkdir -p ~/.ssh
cp ~/.ssh-orig/* ~/.ssh
cp ~/.ssh-config ~/.ssh/config

# npm login via token
echo //registry.npmjs.org/:_authToken=${NPM_TOKEN} > ~/.npmrc

# universal aliases
alias la='ls --color=always -alFG'
alias less=more
alias ll='ls --color=always -FGlAhp'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | more'

# project path
export PATH=$DEV_DIR/pi-docker/scripts:$PATH
source pi-alias.sh

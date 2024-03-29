# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="code ~/.zshrc"
alias zshrs="omz reload"
alias dc="docker-compose"
alias dm="docker-machine"
alias gc="git commit"
alias gc!="git commit --amend"
alias server="lite-server -c ~/Dev/bs-config.json --baseDir"
alias lg="lazygit"
alias ip="ifconfig en0 | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"
alias activate="source env/bin/activate"


function zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

function pip-save() {
  package_name=$1
  requirements_file=$2
  if [[ -z $requirements_file ]]
  then
      requirements_file='./requirements.txt'
  fi
  pip install $package_name && pip freeze | grep -i $package_name >> $requirements_file
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  bower
  brew
  docker
  docker-compose
  docker-machine
  grunt
  git
  git-flow
  gulp
  httpie
  kubectl
  macos
  ng
  node
  npm
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# User configuration

# Preferred editor for local and remote sessions
export EDITOR="nano"
export ZSH_DISABLE_COMPFIX=true

export GO_PATH="/usr/local/go/bin"
# Download JDK from https://www.oracle.com/uk/java/technologies/javase-downloads.html
# export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export YARN_BIN="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
export DOTNET_BIN=/usr/local/share/dotnet
export PATH="$PATH:$GO_PATH:$JAVA_HOME:$YARN_BIN:$DOTNET_BIN"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"

export SPACESHIP_TIME_SHOW=false
export SPACESHIP_DIR_TRUNC=3
export SPACESHIP_DIR_TRUNC_REPO=false
export SPACESHIP_NODE_SHOW=true
export SPACESHIP_PACKAGE_SHOW=true
export SPACESHIP_PACKAGE_SYMBOL="📦 "
export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_CHAR_SYMBOL="❯ "
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=true
export SPACESHIP_GCLOUD_SHOW=false
export SPACESHIP_PYENV_SHOW=false

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/Dev/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/Dev/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/Dev/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/Dev/google-cloud-sdk/completion.zsh.inc"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh
# https://github.com/inishchith/autoenv/issues/188#issuecomment-540541116
source /usr/local/opt/autoenv/activate.sh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# . /usr/local/opt/asdf/libexec/asdf.sh


# Load Angular CLI autocompletion.
# source <(ng completion script)
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

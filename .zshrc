#*~*~*~*~*~*~*~*~*~*~*~*~*~*~#
#~*~*~ SHELL / TERMINAL *~*~*#
#*~*~*~*~*~*~*~*~*~*~*~*~*~*~#

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

[[ -z "$TMUX" ]] && { tmux attach-session -t $USER || tmux new -s $USER -n "main"}
source ~/antigen.zsh

export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3.12"
export AUTOSWITCH_VIRTUAL_ENV_DIR=".virtualenv"
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

#*~*~*~*~*~*~*~*~*~*~*~*~*~*#
#~*~*~*~*~ ANTIGEN *~*~*~*~*#
#*~*~*~*~*~*~*~*~*~*~*~*~*~*#

antigen use oh-my-zsh
# Load the theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle web-search
antigen bundle lein
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle web-search
antigen bundle sudo
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-autosuggestions
# NVM bundle
antigen apply
plugins=(autoswitch_virtualenv $plugins)
source $ZSH/oh-my-zsh.sh


#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

#*~*~*~*~*~*~*~*~*~*~*~*~*~*#
#~*~*~*~*~ NIX MGR *~*~*~*~*#
#*~*~*~*~*~*~*~*~*~*~*~*~*~*#


if [ -e /home/cmeorin/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/cmeorin/.nix-profile/etc/profile.d/nix.sh; fi

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

#*~*~*~*~*~*~*~*~*~*~*~*~*~*#
#~*~*~*~*~ ALIASES *~*~*~*~*#
#*~*~*~*~*~*~*~*~*~*~*~*~*~*#

alias zshrc='nvim ~/.zshrc'
alias cdlr='cd ~/projects/'
alias gist='gh gist'
alias ts='tmux source ~/.tmux.conf'
alias tse='nvim ~/.tmux.conf'
alias ghrcpvt='() {gh repo create git@github.com:CaioMeorin/$1.git --source . --private}'
alias ghrcpub='() {gh repo create git@github.com:CaioMeorin/$1.git --source . --public}'
alias flake="nix --extra-experimental-features 'nix-command flakes' flake"
alias nix="nix --extra-experimental-features 'nix-command flakes'"
alias cpzsh='sudo cp ~/.zshrc ~/ubuntuconfig/'
alias lsc='ls -altchLp1 --hyperlink --group-directories-first'
alias rgaiops='rg -aiops'
alias rgf='rg --files | rg'
alias rgrmi='() { rm $2 $(rgf -v $1) }' # remove files ignoring files containing the pattern passsed to $1
                                        # if $2 passed, will apply option to rm, as -rf, for example
alias cdn='cd ~/.config/nvim'

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

#*~*~*~*~*~*~*~*~*~*~*~*~*~*#
#~*~*~*~ GITHUB CLI ~*~*~*~*#
#*~*~*~*~*~*~*~*~*~*~*~*~*~*#

# Gist edit. Add to file to gist. $1 is ID or URL, $2 is the file to add
function gha(){
  gh gist edit $1 --add $2
}

# Gist create. To create gists. $* refers to any arbitrary number of parameters
# so, this is a default function for creating gists.
function ghc(){
  gh gist create $*
}

# Gist edit. Edits gist description. $1 is ID or URL, $2 is the description
function ghd(){
  gh gist edit $1 -d $2
}

# Gist edit. Edits file. $1 is ID or URL, $2 is the filename
function ghf(){
  gh gist edit $1 -f $2
}

# Gist edit. Removes file. $1 is ID or URL, $2 is the file to be removed
function ghr(){
  gh gist edit $1 -r $2
}

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

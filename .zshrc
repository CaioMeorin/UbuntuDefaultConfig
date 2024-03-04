#################################
# REPLACE THIS WITH YOUR .ZSHRC #
#################################

# Preferred editor for local and remote sessions 
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

[[ -z "$TMUX" ]] && { tmux attach-session -t $USER || tmux new -s $USER -n "main"}
source ~/antigen.zsh

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

alias zshrc='nvim ~/.zshrc'
alias cdlr='cd ~/projects/'
alias gist='gh gist'
alias ts='tmux source ~/.tmux.conf'
alias tse='nvim ~/.tmux.conf'
alias ghrcpvt='() {gh repo create git@github.com:CaioMeorin/$1.git --source . --private}' 
alias ghrcpub='() {gh repo create git@github.com:CaioMeorin/$1.git --source . --public}'



if [ -e /home/cmeorin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/cmeorin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

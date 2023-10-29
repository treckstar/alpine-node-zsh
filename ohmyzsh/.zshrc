export ZSH="/home/node/.oh-my-zsh"

export ZSH_THEME="robbyrussell"
export ZSH_DISABLE_COMPFIX=true
export ZSH_DISABLE_COMPFIX=true
plugins=( 
    zsh-syntax-highlighting
)


source ~/.aliases.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/node/.oh-my-zsh/oh-my-zsh.sh || omz reload

#source <(/usr/bin/starship init zsh --print-full-init)
source .zshrc
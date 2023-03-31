# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTNET_ROOT="/usr/lib/dotnet"
export VISUAL=nvim
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias rc="regolith-control-center"
alias i3go="/home/jason/.restore-i3.sh"
alias rez="/home/jason/.local/bin/i3-resurrect restore -w"
alias ra="/usr/bin/ranger"
eval $(thefuck --alias)
[[ $TMUX != "" ]] && export TERM="screen-256color"
ZSH_THEME="spaceship"

plugins=(git gitfast rbw zsh-autosuggestions jsontools zsh-syntax-highlighting)
source /home/jason/.environment
source $ZSH/oh-my-zsh.sh
source /home/jason/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

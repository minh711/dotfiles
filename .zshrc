# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

export PATH="$HOME/.local/bin:$PATH"

eval "$(oh-my-posh init zsh --config /home/minh711/.cache/oh-my-posh/themes/custom.omp.json)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/nvim/bin:$PATH"
export PATH="/opt/nvim/bin:$PATH"
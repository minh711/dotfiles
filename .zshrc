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

warp-cli() {
    if [[ "$1" == "start" ]]; then
        sudo systemctl start warp-svc
        command warp-cli connect
    else
        command warp-cli "$@"
    fi
}


# ===================== eza =====================
ls() {
  local level=2
  local args=()
  local long=0
  local tree=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -l|--long)
        long=1
        shift
        ;;
      -t|--tree)
        tree=1
        shift
        if [[ $1 =~ ^[0-9]+$ ]]; then
          level=$1
          shift
        fi
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done

  if (( tree )); then
    eza -T --level="$level" --all --color=always --icons=always --long --git \
        --no-filesize --no-time --no-user --no-permissions "${args[@]}"
  elif (( long )); then
    eza -a --color=always --icons=always --long --git \
        --no-filesize --no-time --no-user --no-permissions "${args[@]}"
  else
    eza -a --color=always --icons=always --git --grid "${args[@]}"
  fi
}
# ===================== End eza =====================


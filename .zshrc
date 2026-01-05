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
  local level=2    # default tree depth
  local args=()
  local long=0

  # parse arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
      --tree)
        shift
        # next argument is depth if provided
        if [[ $1 =~ ^[0-9]+$ ]]; then
          depth=$1
          shift
        fi
        # call eza tree
        eza -T --level="$level" --all --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions "${args[@]}"
        return
        ;;
      --long)
        long=1
        shift
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done

  # fallback behavior
  if (( long )); then
    # long listing, no grid
    eza -a --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions "${args[@]}"
  else
    # grid view
    eza -a --color=always --icons=always --git --grid "${args[@]}"
  fi
}
# ===================== End eza =====================
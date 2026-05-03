export EDITOR="nvim"

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Completion
autoload -Uz compinit
compinit -C

[[ -o interactive ]] || return

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration
export LANG=en_US.UTF-8

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="cd ~/.config/nvim && nvim"

alias python=python3
alias pip=pip3

gbs() {
  local branch
  branch=$(git branch --all --color=never | grep -v '\->' | sed 's/^..//' | sort -u | fzf --prompt="Switch to branch: ") || return
  if [[ -n "$branch" ]]; then
    git switch "${branch#remotes/origin/}"
  fi
}

ranger-cd() {
  temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
  ranger --choosedir="$temp_file" -- "${@:-$PWD}"
  if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
    cd -- "$chosen_dir"
  fi
  rm -f -- "$temp_file"
}
alias r="ranger-cd"

# Git aliases
alias gs="git status -s"
alias gd="git diff"
alias gsw="git switch"
alias ga="git add"
alias gc="git commit -m"
alias gac="git add -A && git commit -m"
alias gp="git pull origin mainline"
alias gr="git rebase mainline"
alias gml="git switch mainline"
alias gl="git log"
alias gx="git checkout"
alias gwip="git add -A && git commit -m \"WIP\""
alias gundowip="git reset HEAD^"

# Open workspaces in VSCode through terminal
code() {
  case "$1" in
    *)
      command code "$@"
      ;;
    esac
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# prefix-based history search
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search


# Starship prompt
eval "$(starship init zsh)"

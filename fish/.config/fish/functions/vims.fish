function vims --wraps vim  --description 'alias vimss=vim ($fzf)' 
  vim $(fzf --height 50% --layout=reverse --border --margin 5% --padding 5% --border --preview 'cat {}' \
                       --color bg:#222222,preview-bg:#333333) $argv 
end
alias v="nvim"

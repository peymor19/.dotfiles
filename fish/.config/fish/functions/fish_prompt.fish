
function fish_prompt 
    if set -q TMUX; tmux setenv TMUXPWD_(tmux display -p "#D" | tr -d '%') $PWD; end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin ~/go/bin
starship init fish | source
set -U fish_greeting

# aliases
alias sudo="sudo "
alias vim="nvim"
fish_add_path /home/peytonmorrison/.spicetify

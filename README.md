# dotfiles
The dotfiles are meant to be installed using [stow](https://www.gnu.org/software/stow/manual/stow.html#:~:text=The%20approach%20used%20by%20Stow,from%20clutter%20from%20other%20packages.)

## Requirements

### Packagaes
Install these with your preferred package manager or from source:
```
stow
fish
nvim
starship
```

### Set-Up
Set fish as your default shell:
```
chsh -s $(which fish)
```

## Install
Clone repo into your home dir:
```
git clone git@github.com:peymor19/.dotfiles.git ~/.dotfiles
```
Install dotfiles:
```
cd ~/.dotfiles/
stow */
```


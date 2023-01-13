# dotfiles
These are the main dotfiles in my .config/
The dotfiles are mean to be installed using [stow](https://www.gnu.org/software/stow/manual/stow.html#:~:text=The%20approach%20used%20by%20Stow,from%20clutter%20from%20other%20packages.)

## Requirements

### Packagaes
Install these with your preferred package manager or from source:
```
stow
fish
nvim
startship
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


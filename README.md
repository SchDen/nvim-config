# Neovim config
![nvim 0 1 0](https://cloud.githubusercontent.com/assets/1484977/11009323/1565995c-84e7-11e5-9018-842c1688ddf3.png)

# Description
Config for [Neovim](https://github.com/neovim/neovim)

#### Pre Installed plugins
- [VundleVim (plugin manager)](https://github.com/VundleVim/Vundle.vim)

- [The NERD Tree](https://github.com/scrooloose/nerdtree)

- [Vim-airline](https://github.com/bling/vim-airline)

- [Fugitive](https://github.com/tpope/vim-fugitive)

- [Syntastic](https://github.com/scrooloose/syntastic)

- [Vim-misc](https://github.com/xolox/vim-misc)

- [Vim-session](https://github.com/xolox/vim-session)

- [Emmet-vim](https://github.com/mattn/emmet-vim)


# Install 
- [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Clone config:
```
$ mkdir ~/.config
$ cd ~/.config
$ git clone https://github.com/SchDen/nvim-config nvim
$ git submodule update --init
```
- [Install powerline fonts](https://powerline.readthedocs.org/en/latest/installation.html)
- Set settings for you terminal font size and e.t.c.

For iTerm2 you can use my com.googlecode.iterm2.plist - from repository. (make dump before use).

`$ cp ~/.config/nvim/com.googlecode.iterm2.plist ~/Library/Preferences/`

Maybe you need import [color presets](https://github.com/chriskempson/base16-iterm2) for change colorsheme. ([See preview](http://chriskempson.github.io/base16))
- For tmux - 256 colors fix
Add to your ~/.bashrc (or e.t.c):
```
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM=xterm-256color
else
    export TERM=screen-256color
fi
```
- Run nvim and install plugins:

`:PluginInstall`

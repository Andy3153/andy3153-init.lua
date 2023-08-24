<!-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}: -->
# andy3153-init.lua
This is my init.lua and all the plugins that I use with it.

## Installation
This Git repo contains files from the `~/.config/nvim` folder. So, you can go two ways about 'installing' the configs:

### Symlinks (you need to keep the cloned folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-init.lua/
ln -s /path/to/clone/folder/andy3153-init.lua ~/.config/nvim/
```

### Copying (feel free to delete the folder)
```bash
cd /path/to/clone/folder/
git clone https://github.com/Andy3153/andy3153-zshrc/
cp -r andy3153-init.lua ~/.config/nvim/
cd ..
rm -rf andy3153-init.lua
```

Replace `/path/to/clone/folder/` with the folder you want to clone the Git repo inside. Your choice, could be your Home directory.

## Plugins included:
See [plugins.lua](../../blob/master/lua/plugins.lua)

## Programs required to install (in Arch Linux package names):
### For COQ
  - python
  - python-virtualenv

### For Rnvimr
  - python-pynvim
  - ranger

### For Telescope
  - ripgrep
  - fd

### For some preinstalled LSP servers
  - npm
  - jre-openjdk

### Others
  - xclip (X11) _OR_ wl-clipboard (wayland) (for using the system clipboard)

### ...or, a simple, copy-pasteable line:
`python python-virtualenv python-pynvim ranger ripgrep fd npm jre-openjdk xclip wl-clipboard`

## Other dotfiles of mine
- [Zsh config](https://github.com/Andy3153/andy3153-zshrc)
- [Hyprland rice](https://github.com/Andy3153/hyprland-rice)
- [Sway rice](https://github.com/Andy3153/sway-rice)

## Contributing
Feel free to give me advice on this, or even help me with it!

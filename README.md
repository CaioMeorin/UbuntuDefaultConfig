# UbuntuDefaultConfig
For those who just want to get things done without reading anything, check the [installation](https://github.com/CaioMeorin/UbuntuDefaultConfig/tree/main?tab=readme-ov-file#installation) section.

This repo adds default packages and configurations that **I** like use in Ubuntu.
Usually, this is the first thing I run after configuring my SSH to use git/github in my system.

## Script flow
### First stage - buildup.sh
1. Execute `buildup.sh` or copy the command at the Installation section, at the end of this file to execute everything automatically;
2. Copies `.zshrc`, `.tmux` and `.tmux.conf` to home;
3. Set permission to execute `.buildup.sh`, where the main logic is placed;
4. Execute `.buildup.sh`

### Second stage - .buildup.sh
1. Updates apt repositories and upgrade system;
2. Downloads packages and dependencies from Aptitude;
3. Makes `kitty` as default terminal;
4. Makes `zsh` as default shell;
5. Downloads more packages from other sources than Aptitude;
6. Refresh `$HOME` owner to `$USER`;
7. Restarts `gdm3` to apply changes that needs to log out and log in;
8. The end.

## Packages and Dependencies

### Packages installed from Aptitude

#### Dependencies
`cmake` - **Used to compile and install LuaJIT and latest NeoVim version** \
`gettext` - **Used to compile and install latest NeoVim version** \
`git` - **Used to download NeoVim, Antigen, tmux-plugins and LuaJIT** \
`wget` - **Used to download Chrome**

#### Personal Packages
`build-essential`
`fd-find`
`fzf`
`gh`
`kitty`
`nodejs`
`perl`
`python3.12-full`
`ripgrep`
`tmux`
`vim`
`zsh`

### Packages installed from other sources (non-Aptitude)
`antigen.zsh`
`google-chrome`
`luajit`
`neovim`
`nix`
`tmux-plugins`

## Installation
 
1. First, configure git SSH, otherwishe, some downloads might be blocked
2. Copy and execute the code below in your terminal:
```
git clone git@github.com/CaioMeorin/ubuntuconfig.git && cd UbuntuDefaultConfig && chmod 777 buildup.sh
```
3. Wait until finish;
4. Log in;

# ✨ Enjoy the effortless-configurated system! ✨

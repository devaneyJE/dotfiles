## devaneyJE: Linux dotfiles
Contained in this repo are the configuration files for various utilities used on my personal Linux systems. The colorschemes are generally adapted from the [Nord Theme](https://www.nordtheme.com/). Active tools listed in the following sections, with planned additions listed [here](#future-considerations).

### Overview

- Window Manager: [bspwm](#window-manager) with [sxhkd](#window-manager)
- Display Server: [xorg](#xorg)
- Bar: [polybar](#bar)
- Run Launcher: [dmenu](#launcher)
- Terminal: [kitty](#cli)
- Shell: [zsh](#cli)
- Alt Shell: [fish](#cli)
- Fetch Utilities: [neofetch](#cli) and [pfetch](#cli)
- Editor(CLI): [neovim](#editors)
- Editor(GUI): [VSCodium](#editors)
- Browser: [Firefox](#browser)
- Music Player: [Spotify](https://www.spotify.com/) themed with [spicetify-cli](#music-player)
- Font: [Droid Sans](https://fonts.adobe.com/fonts/droid-sans-mono)
- Image Viewer: [feh](#wallpaper)

![](images/scrots/desktop.png)


### Window Manager
I am using the [bspwm](https://github.com/baskerville/bspwm) tiling window manager. This is paired with [sxhkd](https://github.com/baskerville/sxhkd) as the hotkey daemon for managing keybinds.

The included [bspwmrc](/.config/bspwm/bspwmrc) file contains little beyond the basic default, launching both `sxhkd` and [polybar](#bar). Logic based on a query for connected displays sets workspaces and launches the appropriate variant of my polybar configuration.

The [sxhkdrc](/.config/sxhkd/sxhkdrc) file is also similar to the default. Most modifications involve setting default programs (terminal, editor, launcher), as well as setting bindings for [dmenu scripts](https://github.com/devaneyJE/dmenu/tree/main/dmscripts).


### Xorg
This setup utilizes the [X](https://www.x.org/wiki/) display server, booting to TTY and opting for a shell script rather than a display manager to select a `.xinitrc` variant for a specified WM/DE. The [.xinitrc](/.config/xorg/.xinitrc_bspwm) for my main WM adds the following to the default file:
```bash
# more xorg
xsetroot -cursor_name left_ptr &
# mouse preferences
xinput set-prop 8 298 -0.7 &
# monitor-related
mons --primary DP-2 -e left &
~/.config/feh/.fehbg &
redshift -P -O 4200 &

picom &
exec bspwm
```


### Bar
The current bar in use is [polybar](https://polybar.github.io/). The included configuration was adapted from the [Grayblocks](https://github.com/adi1090x/polybar-themes/tree/master/bitmap/grayblocks) theme in [polybar-themes](https://github.com/adi1090x/polybar-themes). The colors were generated using the polybar-themes [pywal script](https://github.com/adi1090x/polybar-themes/blob/master/bitmap/grayblocks/scripts/pywal.sh), referencing the [wallpaper](#wallpaper) I use (also sourced from the `polybar-themes` repo).

Bars for separate displays are split between multiple files, and module configurations were reorganized into a `modules` directory; included modules are as follows:
- [alsa](/.config/polybar/modules/alsa.ini)
- [cpu](/.config/polybar/modules/cpu.ini)
- [date](/.config/polybar/modules/date.ini)
- [memory](/.config/polybar/modules/memory.ini)
- [network](/.config/polybar/modules/network.ini)
- [sep](/.config/polybar/modules/sep.ini)
- [title](/.config/polybar/modules/title.ini)
- [workspaces](/.config/polybar/modules/workspaces.ini)

There is now a separation of bar configs based on theme and attached displays. The [nord_bspwm](/.config/polybar/nord_bspwm) directory contains a version for `dual` and `single` display polybar variants.


### Launcher
This configuration uses [dmenu](https://tools.suckless.org/dmenu/). My modifications to this tool are detailed in [this](https://github.com/devaneyJE/dmenu) repository.


### CLI
The primary terminal emulator used is [kitty](https://sw.kovidgoyal.net/kitty/), with a secondary of [alacritty](https://github.com/alacritty/alacritty). Kitty configurations are contained in this repo, including my modified variant of [connorholyday's nord-kitty](https://github.com/connorholyday/nord-kitty/blob/master/nord.conf) theme. There are currently no files included for alacritty.

While an old configuration of the [fish](/.config/fish) shell in [Dracula](https://draculatheme.com/) theme is kept here, [zsh](https://www.zsh.org/) is the only shell consistently in use. I am using [antigen](https://github.com/zsh-users/antigen) for plugin management and the [oh-my-zsh](https://ohmyz.sh/) prompt [gallois](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#gallois).

The fetch utilties currently on my system are [neofetch](/.config/neofetch/config.conf) and [pfetch](/.config/shell/pfetch.conf).


### Editors
The majority of my editing is done in [neovim](https://neovim.io/). Its configuration file [init.vim](/.config/nvim/init.vim) sources my [.vimrc](/.config/vim/.vimrc). The plugin manager [Vundle](https://github.com/VundleVim/Vundle.vim) is used, with a sample of my included plugins listed below:

- [`arcticicestudio/nord-vim`](https://github.com/arcticicestudio/nord-vim/blob/master/colors/nord.vim)
- [`itchyny/lightline.vim`](https://github.com/itchyny/lightline.vim)
- [`preservim/nerdtree`](https://github.com/preservim/nerdtree)
- [`svermeulen/vim-easyclip`](https://github.com/svermeulen/vim-easyclip)

When not on the command line, I occasionally use [VSCodium](https://vscodium.com/). A sample of my extensions:

- vscodevim: `Vim`
- arcticicestudio: `Nord`
- golang: `Go`
- ms-azuretools: `Docker`


### Browser
My main browser is currently [firefox](https://www.mozilla.org/en-US/firefox/new/) using [minimal-functional-fox]() and [nightTab](https://github.com/zombieFox/nightTab). I altered the [userChrome.css](/.config/mozilla/firefox/userChrome.css) file for consistency with the Nord theme. A nightTab [config](/.config/nightTab/nightTab_conf.json) file was generated using the backup/export feature of the tool.
![](/images/scrots/firefox_nightTab.png)


### Music Player
Spotify is themed with the [nord theme](https://github.com/morpheusthewhite/spicetify-themes/tree/master/Nord) using [spicetify-cli](https://github.com/khanhas/spicetify-cli).


### Wallpaper
![](/images/wallpapers/polybar-themes/bg_3.jpg)


### Future Considerations
As an always-ongoing project, I'll try to keep a list of planned additions below:

- [dunst](https://dunst-project.org/) notification daemon
- [Eww](https://github.com/elkowar/eww) widget system
- Additional [bspwm](#window-manager) modifications
- [picom (jonaburg fork)](https://github.com/jonaburg/picom)
- Minimalistic split bars for [polybar](#bar)
- Adaptation of this configuration in [LeftWM](http://leftwm.org/)


### Contributions / Credit
These files are generally adapted from default examples by tool authors or community contributors. Credit for this work is contained either in the files themselves or the linked project pages. Feel free to use these on your own systems and make recommendations for fixes/changes!

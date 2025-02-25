# Polybar Nord

> Collection of Polybar theme and module.

The theme and module collection for [Polybar](https://github.com/polybar/polybar) based on [Nord](https://www.nordtheme.com/) colors. This theme provides two bar setups, each of them has light and dark variants. Besides the official modules, there are also scripts from [polybar-scripts](https://github.com/polybar/polybar-scripts) and myself which are configured to suit the theme.

![i3-nord-dark.png](https://github.com/Yucklys/polybar-nord-theme/raw/master/polybar-nord.png)

<!--more-->

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Module Details](#module-details)

## Install

### Dependency

Required dependency:

1. [Font Awesome](https://www.archlinux.org/packages/community/any/ttf-font-awesome/)

Optional dependency:

1. [Weather Icon](https://github.com/erikflowers/weather-icons) (required by `weather` module)
2. Dunst (required by `notify` module)
3. redshift (required by `backlight` module)
4. clash (required by `clash-widget` module)
5. [onedrive](https://github.com/skilion/onedrive) (required by `onedrive-widget` module)
6. [clipmenu](https://github.com/cdown/clipmenu/) (required by `clipmenu-widget` module)
7. [nord-oneline](https://github.com/lr-tech/rofi-themes-collection) (required by `rofi-run` module)

### Install by `git clone` (recommand)

```shell
git clone https://github.com/Yucklys/polybar-nord-theme ~/.config/polybar/
```

`~/.config/polybar` is the default path for polybar configuration, if you want to use other location, change `~/.config/polybar` to your location and also change the location specified in the `launch.sh` file.

## Usage

1. Enter the installation directory `cd ~/.config/polybar`.
2. Run `./launch.sh light` for light theme, and `./launch.sh dark` for dark theme.
3. For customization, most of the options are listed in `nord-config` file. For more details, check [File Structure](#File Structure) part.
4. `pkill polybar` to kill the bars.

## File Structure

### `dark-colors` and `light-colors`

The color for dark and light theme. You don't need to edit these flies unless you want to change the color globally.

### `dark-config` and `light-config`

The configuration for dark and light theme. Most of the settings are covered by `nord-config` except font settings. You can change the font setting in these files.

### `nord-config`

The global configuration. You can customize the position of the bars, DPI setting, modules, etc. The detailed help messages are in the comment for each option.

### `nord-top` and `nord-down`

The modules for top and bottom bar setup. For some specific modules you need to edit these files. For more details of these modules check [Module Details](#Module Details).

### `scripts`

The directory contains all the scripts and files that required by the modules. 

## Module Details

1. [alsa](#alsa)
2. [backlight](#backlight)
3. [battery](#battery)
4. [bspwm](#bspwm)
5. [clash-widget](#clash-widget)
6. [clipmenu-widget](#clipmenu-widget)
7. [cpu](#cpu)
8. [daily-poem](#daily-poem)
9. [date](#date)
10. [github](#github)
11. [i3](#i3)
12. [info-hackspeed](#info-hackspeed)
13. [keyboard](#keyboard)
14. [logseq-sync](#logseq-sync)
15. [memory](#memory)
16. [mpd](#mpd)
17. [mullvad-status](#mullvad-status)
18. [network-detail](#network-detail)
19. [network-short](#network-short)
20. [notify (基于dunst)](#notify)
21. [onedrive-widget](#onedrive-widget)
22. [powermenu](#powermenu)
23. [pulseaudio](#pulseaudio)
24. [rofi-run](#rofi-run)
25. [show-desktop](#show-desktop)
26. [spotify](#spotify)
27. [temperature](temperature)
28. [title](#title)
29. [weather](#weather)
30. [workspace-name](#workspace-name)


### alsa

Display current volume. The default sound card is `default`, you can change this option in `nord-config`.

| Bind             | Event                |
| ---------------- | -------------------- |
| mouse left click | toggle mute          |
| scroll up        | volume + 5% for each |
| scroll down      | volume - 5% for each |

### backlight

Display current lightness of screen.

| Bind             | Event                   |
| ---------------- | ----------------------- |
| scroll up        | lightness + 5% for each |
| scroll down      | lightness - 5% for each |
| mouse left click | toggle redshift         |

### date

Display date and time.

| Bind             | Event                           |
| ---------------- | ------------------------------- |
| mouse left click | switch between date/time format |

### notify

Notify icon.

| Bind     | Event                                                         |
| -------- | ------------------------------------------------------------ |
| mouse left click | key event `ctrl+grave`, the default hotkey for dunst history notify |

### network-detail

Display upload and download speed in KB/s. Need to set your network interface at `nord-config.interface`.

### network-short

Display network connection icon. By defailt left click on the icon will call `networkmanager-dmenu`. For more details of this you can check [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu).

| Bind     | Event                 |
|:---------|:---------------------|
| mouse left click | networkmanager-dmenu |


### battery

Display battery infomation. Requires to set `nord-config.battery-full-at`, `nord-config.battery-bat` and `nord-config.battery-adp`.

### keyboard

Display keyboard CapsLock indicator.

### mpd

Display mpd information. It is hidden when mpd process does not running. There are three layout corresponding to **play**, **pause** and **stop**.

- Display full content when in play status, including *pause*, *prev*, *artist - song*, *next*, *stop*, *progress bar*, *cycle* and *random*.
- Display part of the content when in pause status, including *play*, *prev*, *artist - song*, *next*, *stop*.
- Display *play* only in stop status.

Requires `nord-config.mpd-host` and `nord-config.mpd-port`.

### spotify

Display currently playing spotify song title.

### i3

Display i3 workspace icon. Icon list can be customized in `nord-top`.

| Bind     | Event                     |
| -------- | ------------------------ |
| mouse left click | i3-msg workspace <index> |
| scroll up   | i3-msg workspace prev    |
| scroll down   | i3-msg workspace next    |

### bspwm

Display bspwm workspace icon.

### workspace-name

Display the name of current workspace which is defined in the configuration of i3. The format should be `index:identifier`, for example `1:Home`.

### title

Display the title of current active window.

### weather

Display weather information from Openweather with scripts [polybar/polybar-scripts/openweather-fullfeatured](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-fullfeatured). Personal API and city code is required. For more detailed usage check the project's README.

### info-hackspeed

Display the speed of inputting in cpm(char per minute) or wpm (word per minute). The script comes from [polybar/polybar-scripts/info-hackspeed](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/info-hackspeed).

### daily-poem

Display Chese poem. The API is from [今日诗词 API](https://www.jinrishici.com/). ~~Before usage you need to get your token from https://v2.jinrishici.com/token and replace mine in `nord-down`~~.

You can use this module without any configuration, but if you want to customize the output format, you can change the command in `nord-down`. For help on the command, `scripts/daily-poem -h` will list all the options for you.

#### Providers
- 今日诗词(jrsc)
- ...

### temperature

Display internal temperature. You can specify the thermal-zone in `nord-config.thermal-zone`, the default value is 0. When the temperature is lower than `nord-config.base-temperature` it will switch to lowest temperature layout; when the temperature is higher than `nord-config.warn-temperature` is will switch to warning temperature layout. The color of icon will change between `base-temperature` and `warn-temperature`, so set the proper values for your environment.

### memory

Display memory usage in the format used/total.

### cpu

Display CPU usage.

### show-desktop

Display desktop. By default it will switch to `25:Desktop`. You can customize this in `nord-down`.

| Bind     | Event                        |
| -------- | --------------------------- |
| mouse left click | i3-msg workspace 25:Desktop |

### powermenu

List of power options, `shutdown`, `reboot` and `logout`.

### clash-widget

Require clash service. You can write by yourself or use mine in `systemd/clash.service`.

| Bind              | Event          |
| ----------------- | -------------- |
| mouse left click  | toggle service |
| mouse right click | update status  |

### onedrive-widget

Require [onedrive](https://github.com/skilion/onedrive).

| Bind              | Event          |
| ----------------- | -------------- |
| mouse left click  | toggle service |
| mouse right click | update status  |

### clipmenu-widget

Require [clipmenu](https://github.com/cdown/clipmenu/).

| Bind              | Event          |
| ----------------- | -------------- |
| mouse left click  | trigger menu   |
| double left click | toggle service |
| mouse right click | update status  |

### nord-oneline

One-line style program runner. It will cover the top panel by left click the icon.

![rofi-run](https://github.com/Yucklys/polybar-nord-theme/raw/master/screenshots/rofi-run.png)

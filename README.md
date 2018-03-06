<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### tab
> A super-rad plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

Open new iTerm, Apple Terminal, Konsole, Yakuake, Gnome Terminal and Guake tabs from the command line.


## Install

```fish
$ omf install tab
```

If you use iTerm and your default session profile isn't "Default Session" you can override it in your omf `init.fish`:

```fish
set -g tab_iterm_profile "MyProfile"
```


## Usage

```fish
$ tab                     Opens the current directory in a new tab
$ tab [path]              Open PATH in a new tab
$ tab [cmd]               Open a new tab and execute CMD
$ tab [path] [cmd] ...    You can prolly guess
$ tab [-s|--split]        Split the current tab instead of opening a new tab
$ tab [-S|--split-horiz]  Split the current tab horizontally.
                          (Splits are only supported in iTerm and Yakuake at this time)
```


# License

[MIT][mit] © [Justin Hileman][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/bobthecow
[contributors]:   https://github.com/oh-my-fish/plugin-tab/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square

![][license-badge]

<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

# tab

Open new iTerm and Terminal tabs from the command line.

A super-rad plugin for [Oh My Fish][omf-link].


## Install

```fish
$ omf install tab
```


If you use iTerm and your default session profile isn't "Default Session", override it in your omf `init.fish`:

```fish
set -g tab_iterm_profile "MyProfile"
```


## Usage

```fish
$ tab                   Opens the current directory in a new tab
$ tab [path]            Open PATH in a new tab
$ tab [cmd]             Open a new tab and execute CMD
$ tab [path] [cmd] ...  You can prolly guess
```


# License

[MIT][mit] © [Justin Hileman][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/bobthecow
[contributors]:   https://github.com/oh-my-fish/plugin-tab/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square

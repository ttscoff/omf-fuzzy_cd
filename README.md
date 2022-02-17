<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### Fuzzy cd

> A plugin for [Oh My Fish][omf-link] which replaces the `cd` command with a fuzzy searching version.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.0.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Dependencies

You'll definitely need to install `fasd`. This is easiest with Homebrew, just `brew install fasd`.

You'll also want `fzf` available. Again, easiest with Homebrew: `brew install fzf`.

To make use of the jump marks, you'll want to install [this particular jump plugin](https://github.com/oh-my-fish/plugin-jump) (via `omf install jump`, probably). The `__fuzzy_cd` function doesn't actually use it for jumping, but my replacement for the `jump` function does not include any functions for adding or listing marks. This version of jump creates symlinks in `~/.marks`, which is what fuzzy cd is set up to read.

## Install

```fish
$ omf repositories add https://github.com/ttscoff/omf-packages
$ omf install fuzzy_cd
```


## Usage

```fish
$ cd JUMP_MARK [fuzzy [sub [dir [sequence]]]]
```

Fuzzy cd replaces the cd command.

If there's only one argument to the `cd` command and it matches a valid path, `cd` will behave normally.

If the first argument is a jump bookmark, that will be used as the base directory. Bookmarks are fuzzy matched, so `cd bmark` would recognize a bookmark titled `bookmark` and use it.

Any additional arguments will be used to fuzzy search subdirectories in sequence. So `cd desk pod ov 8` would locate `~/Desktop/Podcasts/Overtired/268` and cd to it.

If the first argument is 3 or more dots, `cd` will navigate up the directory tree, allowing fuzzy directory searching from the base folder with additional arguments. 1 dot is the current directory, 2 dots is the next level up, each additional dot is one level further up. 3 dots is equivalent to `../..`, 4 dots is `../../..`, etc.

If no valid path is found using this method, `cd` will fall back to using `fasd` to search recent directories.

# License

[MIT][mit] © [Brett Terpstra][author]

[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/ttscoff
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square

# ardeidae dotfiles

This repository hosts my dotfiles. This is a work in progress.

## git

This gitconfig file sets some colors, pretty format, command line and graphical
editors for diff and merge. It defines some properties to avoid some problems
on macOS and some safe options.

When you work in a team, there is a good chance your tree will become
disgusting because there is always someone who doesn't understand how git
works...

So, here are some options that can prevent 99% of merge problems.

* `merge.ff = false` because when you merge, you want to see the merge branch.
  In case it was a temporary branch, you can force a fast-forward using `--ff`
  option.
* `pull.ff = only` because when you pull, you don't want to merge to keep a
  clean and straight history.
* `pull.rebase = merges` because when you pull, if a fast-forward is not
  possible, you want to rebase to keep a clean and straight history, too.

### Your identity

Your name must be set in the `~/.gitconfig.local` file.
```
[user]
email = you@tld.com
```

The purpose of `user.useConfigOnly = true` is to force you to define
`user.name` and `user.email`. I only have one name, so I define it in the
`~/.gitconfig.local`. As I have personal and professional mails, I define
`user.email` for each project. So, with `user.useConfigOnly = true`, git tells
me to set an email for each project. The first thing to do when you initialize
your git repository is to set your email locally:

```bash
git config user.email "me@tld.com"
```

### aliases

* `a`: add
* `aliases`: list aliases
* `amend`: commit and amend in verbose mode
* `ap`: add in patch mode
* `bl`: blame
* `br`: list branches in verbose mode
* `ci`: commit in verbose mode
* `co`: checkout
* `contrib`: show contributors and their numbers of commits
* `conflicts`: show files in conflict state
* `cp`: cherry-pick and append a line that says "cherry picked from commit"
* `credit`: amend the last commit with "A Name" "an.email@tld.com"
* `d`: make a diff
* `dc`: make a diff in cached mode
* `dl`: make a diff of the last commit
* `dt`: start difftool
* `dtg`: start difftool in GUI mode
* `ec`: edit your global gitconfig
* `f`: fetch
* `fc`: find commits by source code
* `fm`: find commits by commit message
* `g`: make a grep but does not search in binary files
* `l`: show logs
* `lg`: show logs in graph mode
* `lga`: show all logs in graph mode
* `ll`: show last logs
* `lp`: show log in patch mode
* `lrb`: list remotes branches
* `m`: merge
* `mt`: start mergetool
* `mtg`: start mergetool in GUI mode
* `nb`: switch to a branch or create it first
* `pl`: pull
* `ps`: push
* `r`: rebase
* `rc`: continue rebase
* `rp`: reset in patch mode
* `recentbr`: get list of branches ordered by most recent commit
* `rlast`: rebase the given number of latests commits
* `rlc`: remove the given number of last commits, the last by default
* `rt`: list remotes in verbose mode
* `s`: show short status
* `sa`: apply a stash
* `sd`: drop a stash
* `sl`: list stashes
* `sp`: pop a stash
* `ss`: stash
* `st`: show status
* `ulc`: undo the given number of last commits, the last by default
* `unstage`: unstage files
* `wd`: make a word diff
* `wdc`: make a word diff in cached mode

### Other things

It treats spaces before tabs and all kinds of trailing whitespace as errors.
It define mnemonicPrefix, autoStash, autoSquash... There are many other things,
you can see the gitconfig content, it is well documented.

## vim

This is a work in progress.

Plugins are managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug).
This plugin is downloaded at first launch, `curl` command is required.

Some directories are created on first launch with permissions set to 700.

* `~/.vim/plugged` to store plugins
* `~/.vim/tmp/backup` to store backup files
* `~/.vim/tmp/undo` to store undo files
* `~/.vim/tmp/swap` to store  swap files

The mapleader key is set to the spacebar.

### Themes

* [ayu-theme/ayu-vim](https://github.com/ayu-theme/ayu-vim)
* [cormacrelf/vim-colors-github](https://github.com/cormacrelf/vim-colors-github)
* [morhetz/gruvbox](https://github.com/morhetz/gruvbox)
* [tomasr/molokai](https://github.com/tomasr/molokai)

### Plugins

* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
* [honza/vim-snippets](https://github.com/honza/vim-snippets)
* [jmcantrell/vim-virtualenv](https://github.com/jmcantrell/vim-virtualenv)
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
* [mbbill/undotree](https://github.com/mbbill/undotree)
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
* [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch)
* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)

### Mapping

* `<space>bi`: install plugins
* `<space>bu`: update plugins
* `<space>bc`: clean unused plugins

#### vim-unimpaired

Because `[` and `]` are hard to type on french keyboard, especially on Apple
keyboard, I added mappings `<F1>` and `<F2>` to `[` and `]`.

So, you can use these mappings.

* `n<F1>s`: get on the nth previous misspelled word
* `n<F2>s`: get on the nth next misspelled word
* `n<F1>c`: get on the nth previous start of diff change
* `n<F2>c`: get on the nth next start of diff change
* `<F1>z`: move to start of open fold
* `<F2>z`: move to end of open fold
* `n<F1>a`: edit the nth previous file in argument list (:previous)
* `n<F2>a`: edit the nth next file in argument list (:next)
* `<F1>A`: edit the first file in the argument list (:first)
* `<F2>A`: edit the last file in the argument list (:last)
* `n<F1>b`: go to the nth previous buffer in the buffer list (:bprevious)
* `n<F2>b`: go to the nth next buffer in the buffer list (:bnext)
* `<F1>B`: go to the first buffer in the buffer list (:bfirst)
* `<F2>B`: go to the last buffer in the buffer list (:blast)
* `n<F1>l`: go to the nth previous location (:lprevious)
* `n<F2>l`: go to the nth next location (:lnext)
* `<F1>L`: go to the fist location (:lfirst)
* `<F2>L`: go to the last location (:llast)
* `n<F1>q`: go to the nth previous quickfix (:cprevious)
* `n<F2>q`: go to the ntn next quickfix (:cnext)
* `<F1>Q`: go to the first quickfix (:cfirst)
* `<F2>Q`: go to the last quickfix (:clast)
* `n<F1>f`: go to the nth file preceding the current one alphabetically in the
  current file's directory
* `n<F2>f`: go to the nth file succeeding the current one alphabetically in the
  current file's directory
* `n<F1>n`: go to the nth previous SCM conflict marker or diff/patch hunk
* `n<F2>n`: go to the nth next SCM conflict marker or diff/patch hunk

### Options On / Off /Toggle

* `<F1>`: on
* `<F2>`: off
* `y`: switch

Option names:
* `ob`: 'background' (dark is off, light is on)
* `oc`: 'cursorline'
* `od`: 'diff' (actually :diffthis / :diffoff)
* `oh`: 'hlsearch'
* `oi`: 'ignorecase'
* `ol`: 'list'
* `on`: 'number'
* `or`: 'relativenumber'
* `os`: 'spell'
* `ou`: 'cursorcolumn'
* `ov`: 'virtualedit'
* `ow`: 'wrap'
* `ox`: 'cursorline' 'cursorcolumn' (x as in crosshairs)

So, to enable hlsearch, you have to type `<F1>oh`.
To disable it, you have to type `<F2>oh`.
To switch it, you have to type `yoh`.

### Pasting

* `>p`: paste after linewise, increasing indent
* `>P`: paste before linewise, increasing indent
* `<p`: paste after linewise, decreasing indent
* `<P`: paste before linewise, decreasing indent
* `=p`: paste after linewise, reindenting
* `=P`: paste before linewise, reindenting
* `<F1>p`: paste before linewise, using target indent
* `<F2>p`: paste after linewise, using target indent

### Toggle paste mode

A toggle has not been provided for paste because the typical use case of
wrapping of a solitary insertion is inefficient: You toggle twice, but you only
paste once.

To go in insert mode with paste set, press:

* `<F1>`op to invoke `O`
* `<F2>`op to invoke `o`
* `yop` to invoke `0C`

Leaving insert mode sets nopaste automatically.

### Functions

#### VirtualEnv

Activate a python virtualenv within Vim.

* `:VirtualEnvList`: List all available virtualenvs
* `:VirtualEnvDeactivate`: Deactivate the current virtualenv
* `:VirtualEnvActivate [name]`: Activate a virtualenv

#### CtrlP

* `<c-d>`: toggle between full-path search and filename only search, prompt's
  base becomes '>d>' instead of '>>>'
* `<c-r>`: toggle between the string mode and full regexp mode, prompt's base
  becomes 'r>>' instead of '>>>'
* `<c-f>`: scroll to the 'next' search mode in the sequence
* `<c-b>`: scroll to the 'previous' search mode in the sequence
* `<tab>`: auto-complete directory names under the current working directory
  inside the prompt
* `<s-tab>`: toggle the focus between the match window and the prompt
* `<esc>`: exit CtrlP
* `<c-j>`: move selection down
* `<c-k>`: move selection up
* `<c-a>`: move the cursor to the 'start' of the prompt
* `<c-e>`: move the cursor to the 'end' of the prompt
* `<c-h>,`: move the cursor one character to the 'left'
* `<c-l>,`: move the cursor one character to the 'right'
* `<c-w>`: delete a preceding inner word
* `<c-u>`: clear the input field
* `<c-n>`: next string in the prompt's history
* `<c-p>`: previous string in the prompt's history
* `<cr>`: open the selected file in the 'current' window if possible
* `<c-t>`: open the selected file in a new 'tab'
* `<c-v>`: open the selected file in a 'vertical' split
* `<c-x>,`: open the selected file in a 'horizontal' split
* `<c-y>`: create a new file and its parent directories
* `<c-z>`: mark/unmark a file to be opened with <c-o> or a file to create in
  its directory using <c-y>
* `<c-o>`: open files marked by <c-z>
* `<F5>`: refresh and purge the cache
* `<F7>`: in mru mode, wipe the list, or delete entries marked by <c-z>, in
  buffer mode, delete entry under the cursor or delete multiple entries marked
  by <c-z>
* `<space>pq`: search for an entry in the current quickfix errors and jump to it
* `<space>pl`: search for a line in all listed buffers or in the specified [buffer]
* `<space>pc`: search for and jump to a recent change in the current buffer
* `<space>pa`: search for and jump to a recent change in in all listed buffers

When opening one file, add :n to go to the nth line.

#### vim-eunuch

* `:Delete[!]`: :bdelete, and, if successful, delete the file from disk, if a
  bang is given, it is passed along to :bdelete
* `:Unlink[!]`: delete the file from disk and reload the buffer, if a bang is
  given, discard unsaved changes
* `:Move[!] {file}`: like :saveas, but delete the old file afterwards
* `:Rename[!] {file}`: like :Move, but relative to the current file's
  containing directory
* `:Chmod {mode}`: change the permissions of the current file
* `:Mkdir {dir}`: create directory {dir} with mkdir()
* `:Mkdir! {dir}`: create directory {dir} with mkdir() passing the "p"
  argument, as `mkdir -p`
* `:SudoEdit [file]`: edit a file using sudo. This overrides any read
  permission issues, plus allows you to write the file with :w!
* `:SudoWrite`: use sudo to write the file to disk. Handy when you forgot to
  use sudo to invoke Vim. This uses :SudoEdit internally, so after the first
  invocation you can subsequently use :w!

#### vim-surround

* `ds"`: remove surrounding `""`
* `ds)`: remove surrounding `()`
* `dst`: remove surrounding tag
* `cs"'`: change surrounding `""` to `''`
* `cs)"`: change surrounding `()` to `""`
* `cs)<tag attr="val">`: change surrounding `()` to `<tag attr="val"></tag>`
* `cst<b>`: change surrounding tag to `<b>`
* `ys<motion>)`: surround text covered by the motion with `)`
* `yss>`: surround entire line with `>`
* `viwS'`: in visual mode, surround inner word with `'`

#### tagbar

Press `<F3>` to open or close tagbar.
Available keybindings from the tagbar window:

* `<CR>`: jump to tag definition
* `p`: as above, but stay in tagbar window
* `P`: show tag in preview window
* `<C-N>`: go to next top-level tag
* `<C-P>`: go to previous top-level tag
* `<Space>`: display tag prototype
* `v`: hide non-public tags
* `+, zo`: open fold
* `-, zc`: close fold
* `o, za`: toggle fold
* `*, zR`: open all folds
* `=, zM`: close all folds
* `zr`: increment fold level by 1
* `zm`: decrement fold level by 1
* `zj`: go to next fold
* `zk`: go to previous fold
* `s`: toggle sort
* `i`: toggle case insensitive sort option
* `c`: toggle autoclose option
* `t`: toggle pause
* `x`: zoom window in/out
* `q`: close window
* `?`: toggle help

#### undotree

Press `<F5>` to open or close undotree.
Available keybindings from the undotree window:

* `<cr>: `move to the current state
* `u: `undo
* `<c-r>: `redo
* `<: `move to the previous saved state
* `>: `move to the next saved state
* `J: `move to the previous undo state
* `K: `move to the next undo state
* `D: `toggle the diff panel
* `T: `toggle relative timestamp
* `C: `clear undo history (with confirmation)
* `<tab>: `set Focus back to the editor
* `q: `close undotree panel
* `?: `toggle quick help

Undotree markers:

* Every change has a sequence number and it is displayed before timestamps
* The current state is marked as `>number<`
* The next state which will be restored by `:redo` or `<c-r>` is marked as
  `{number}`
* The `[number]` marks the most recent change
* The undo history is sorted by timestamps
* Saved changes are marked as `s` and the big `S` indicates the most recent
  saved change

#### startify

You can either navigate to a certain menu entry and hit `<cr>` or just
enter the index (the index is whatever is written between the square
brackets on that line). You can even double-click anywhere on the line.

In addition, `e` creates an empty buffer, `i` creates an empty buffer and
jumps into insert mode, `q` quits either the buffer or, if there is no
other listed buffer left, Vim itself.

Moreover, you can open multiple buffers at once. Navigate to an entry and
hit either `b` (open in same window), `s` (open in split), `v` (open in
vertical split) or `t` (open in tab). You can do that for multiple entries.
You can also mix them. The order of the selections will be remembered.
Afterwards execute these actions via `<cr>`.

The uppercase variants of b/s/v/t enable the batchmode which lets you
select any entries without navigating there first. Every following index
will be opened in the currently active mode. E.g. to open the buffers with
the indices 0, 2, and 4, use `B024` instead of `bjjbjjb`. To disable
batchmode, just use the same uppercase key again, or any of the lowercase
variants.

When the selection is finished, Startify will close automatically. You can
reopen the screen via `:Startify`.

The plugin eases the handling of loading and saving sessions by putting
sessions in a central directory.

* `:SLoad`: load a session
* `:SSave[!]`: save a session
* `:SDelete[!]`: delete a session
* `:SClose`: close a session

If `!` is given, you won't get prompted.

It also supports session persistence, so once a session is loaded, it gets
saved automatically when Vim exits.

#### vim-indent-guides

Indent guides are disabled by default.

Use `<space>ii` to toggle indent guides.

#### nerdcommenter

* `[count]<space>cc`: comment out the current line or text selected in visual
  mode
* `[count]<space>ci`: toggles the comment state of the selected line(s)
  individually
* `[count]<space>cy`: same as `<space>cc` except that the commented line(s) are
  yanked first
* `<space>c$`: comments the current line from the cursor to the end of line
* `<space>cA`: adds comment delimiters to the end of line and goes into insert
  mode between them
* `[count]<space>cu`: uncomments the selected line(s)

#### nerdtree

* `<space>nf`: find and reveal the file for the active buffer in the NERDTree
  window
* `<space>nm`: share an existing NERDTree, from another tab, in the current
  tab, changes made to one tree are reflected in both as they are actually the
  same buffer
* `<space>nn`: toggle NERDTree window
* `<space>nv`: try to find the top of the version control system repository,
  and roots the NERDTree there
* `<space>nc`: close the NERDTree in the current tab

File node mappings
* `o`: open in prev window
* `go`: preview
* `t`: open in new tab
* `T`: open in new tab silently
* `middle-click,
* `i`: open split
* `gi`: preview split
* `s`: open vsplit
* `gs`: preview vsplit
* `<CR>`: custom open

Directory node mappings
* `o`: open & close node
* `O`: recursively open node
* `t`: open in new tab
* `T`: open in new tab silently
* `<CR>`: custom open
* `x`: close parent of node
* `X`: close all child nodes of current node recursively
* `e`: explore selected dir

Bookmark table mappings
* `o`: open bookmark
* `go`: preview file
* `go`: find dir in tree
* `t`: open in new tab
* `T`: open in new tab silently
* `<CR>`: custom open
* `D`: delete bookmark

Tree navigation mappings
* `P`: go to root
* `p`: go to parent
* `K`: go to first child
* `J`: go to last child
* `<C-j>`: go to next sibling
* `<C-k>`: go to prev sibling

Filesystem mappings
* `C`: change tree root to the selected dir
* `u`: move tree root up a dir
* `U`: move tree root up a dir but leave old root open
* `r`: refresh cursor dir
* `R`: refresh current root
* `m`: Show menu
* `cd`:change the CWD to the selected dir
* `CD`:change tree root to CWD

Tree filtering mappings
* `I`: hidden files (on)
* `f`: file filters (on)
* `F`: files (on)
* `B`: bookmarks (on)

Other mappings
* `q`: Close the NERDTree window
* `A`: Zoom (maximize-minimize) the NERDTree window
* `?`: toggle help

Bookmark commands
* `:Bookmark [<name>]`: Bookmark the current node as `<name>`. If there is
  already a <name> bookmark, it is overwritten. `<name>` must not contain
  spaces. If `<name>` is not provided, it defaults to the file or directory
  name. For directories, a trailing slash is present.
* `:BookmarkToRoot <name>`: Make the directory corresponding to `<name>` the
  new root. If a treenode corresponding to `<name>` is already cached somewhere
  in the tree then the current tree will be used, otherwise a fresh tree will
  be opened. Note that if `<name>` points to a file then its parent will be
  used instead.
* `:RevealBookmark <name>`: If the node is cached under the current root then
  it will be revealed (i.e. directory nodes above it will be opened) and the
  cursor will be placed on it.
* `:OpenBookmark <name>`: The Bookmark named `<name>` is opened as if `o` was
  applied to its entry in the Bookmark table. If the Bookmark points to a
  directory, it is made the new root of the current NERDTree. If the Bookmark
  points to a file, that file is opened for editing in another window.
* `:ClearBookmarks [<names>]`: Remove all the given bookmarks. If no bookmarks
  are given then remove all bookmarks on the current node.
* `:ClearAllBookmarks`: Remove all bookmarks.
* `:EditBookmarks`: Opens the bookmarks file for manual editing, for removing
  invalid bookmarks.
* `:ReadBookmarks`: Re-read the bookmarks in the NERDTree bookmarks file.

#### Custom

* `:FormatJSON`: format a JSON file
* `:FormatXML`: format an XML file

## shell

Made with zsh and ohmyzsh framework.

### aliases by plugin

#### bgnotify

Cross-platform background notifications for long running commands.
Need to install `terminal-notifier` on macOS, nothing on Debian.

#### colored-man-pages

This plugin adds colors to man pages.

You can also try to color other pages by prefixing the respective command with
colored:

```zsh
colored git help clone
```

#### copybuffer

This plugin binds `ctrl-o` to a command that copies the text that is currently
typed in the command line before you hit enter to execute it.

#### copydir

`copydir` copies the path of your current folder to the system clipboard.

#### copyfile

`copyfile <filename>` puts the contents of filename in your system clipboard so
you can paste it anywhere.

#### direnv

This plugin creates the [direnv](https://direnv.net/) hook.

```zsh
$ mkdir ~/my-project
$ cd ~/my-project
$ echo ${FOO-nope}
$ echo export FOO=foo > .envrc
.envrc is not allowed
$ direnv allow .
direnv: reloading
direnv: loading .envrc
direnv export: +FOO
$ echo ${FOO-nope}
foo
$ cd ..
direnv: unloading
$ echo ${FOO-nope}
nope
```

[A guide to manage your environment variables in a better way using
direnv](https://shivamarora.medium.com/a-guide-to-manage-your-environment-variables-in-a-better-way-using-direnv-2c1cd475c8e).

#### dirhistory

This plugin adds keyboard shortcuts for navigating directory history and hierarchy.

| Shortcut                          | Description                                               |
|-----------------------------------|-----------------------------------------------------------|
| <kbd>Alt</kbd> + <kbd>Left</kbd>  | Go to previous directory                                  |
| <kbd>Alt</kbd> + <kbd>Right</kbd> | Go to next directory                                      |
| <kbd>Alt</kbd> + <kbd>Up</kbd>    | Move into the parent directory                            |
| <kbd>Alt</kbd> + <kbd>Down</kbd>  | Move into the first child directory by alphabetical order |

To print the directory stack, type `dirs -v`.

#### encode64

Alias plugin for encoding or decoding using `base64` command.

| Function   | Alias | Description                    |
| ---------- | ----- | ------------------------------ |
| `encode64` | `e64` | Encodes given data to base64   |
| `decode64` | `d64` | Decodes given data from base64 |

#### extract

This plugin defines a function called `extract` that extracts the archive file
you pass it, and it supports a wide variety of archive filetypes.

#### fancy-ctrl-z

Hit `ctrl-z` once again to get back to Vim or any other background process.

#### fasd

[`fasd`](https://github.com/clvv/fasd) offers quick access to files and
directories.

Remove default aliases: v, o and j and add some aliases and bind keys.

```zsh
alias v='f -e "$EDITOR" -B viminfo' # complete files from history and viminfo
# v pass would open /etc/password for example
# v alone would list recent opened files

alias a='fasd -a'                   # any
alias s='fasd -si'                  # show search and select
alias d='fasd -d'                   # directory
alias f='fasd -f'                   # file
alias sd='fasd -sid'                # interactive directory selection
alias sf='fasd -sif'                # interactive file selection
alias z='fasd_cd -d'                # cd
alias zz='fasd_cd -d -i'            # cd with interactive selection

bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (files and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)
```

#### fd

This plugin adds completion for the file search tool
[`fd`](https://github.com/sharkdp/fd).

#### genpass

This plugin provides three unique password generators for ZSH. Each generator
has at least a 128-bit security margin and generates passwords from the
cryptographically secure /dev/urandom. Each generator can also take an optional
numeric argument to generate multiple passwords.

* `genpass-apple` generates a pronounceable pseudoword passphrase of the
  "cvccvc" consonant/vowel syntax, inspired by Apple's iCloud Keychain password
  generator. Each password has exactly 1 digit placed at the edge of a "word"
  and exactly 1 capital letter to satisfy most password security requirements.

* `genpass-monkey` generates visually unambiguous random meaningless strings
  using Crockford's base32.

* `genpass-xkcd` generates passphrases from /usr/share/dict/words inspired by
  the famous (and slightly misleading) XKCD comic. Each passphrase is prepended
  with a digit showing the number of words in the passphrase to adhere to
  password security requirements that require digits. Each word is 6 characters
  or less.

#### gh

This plugin adds completion for the [GitHub CLI](https://cli.github.com/).

#### git-flow-avh

This plugin adds completion for the
[git-flow](https://github.com/petervanderdoes/gitflow-avh).

#### gitignore

This plugin enables you the use of [gitignore.io](https://www.gitignore.io/)
from the command line.

* `gi list` lists all the currently supported gitignore.io templates.
* `gi [TEMPLATENAME]` shows git-ignore output on the command line, e.g. gi java
  to exclude class and package files.
* `gi [TEMPLATENAME] >> .gitignore` appends programming language settings to
  .gitignore.

#### globalias

Expands all glob expressions, subcommands and aliases (including global). Just
press <kbd>space</kbd> to trigger the expansion of a written command. To insert
a space without expanding the command line, press <kbd>ctrl</kbd> +
<kbd>space</kbd>. To filter out any values from expanding set
`GLOBALIAS_FILTER_VALUES` to an array of said values.

#### gnu-utils

This plugin binds GNU coreutils to their default names, so that you don't have
to call them using their prefixed name, which starts with g.

#### invoke

This adds completion for python [invoke](https://www.pyinvoke.org/) plugin.

#### isodate

This plugin adds aliases for the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date.

| Alias           | Command                       | Description                                                                 |
|-----------------|-------------------------------|-----------------------------------------------------------------------------|
| `isodate`       | `date +%Y-%m-%dT%H:%M:%S%z`   | Display the current date with UTC offset and ISO 8601-2 extended format     |
| `isodate_utc`   | `date -u +%Y-%m-%dT%H:%M:%SZ` | Display the current date in UTC and ISO 8601-2 extended format              |
| `isodate_basic` | `date -u +%Y%m%dT%H%M%SZ`     | Display the current date in UTC and ISO 8601 basic format                   |
| `unixstamp`     | `date +%s`                    | Display the current date as a Unix timestamp (seconds since the Unix epoch) |
| `date_locale`   | `date +"%c"`                  | Display the current date using the default locale's format                  |

#### iterm2

This plugin adds a few functions that are useful when using [iTerm2](https://www.iterm2.com/).

* `_iterm2_command <iterm2-command>` executes an arbitrary iTerm2 command via
  an escape code sequence. See [escape codes
  documentation](https://iterm2.com/documentation-escape-codes.html) for all
  supported commands.
* `iterm2_profile <profile-name>` changes the current terminal window's profile
  (colors, fonts, settings, etc). `profile-name` is the name of another iTerm2
  profile. The profile name can contain spaces.
* `iterm2_tab_color <red> <green> <blue>` changes the color of iTerm2's
  currently active tab. `red`/`green`/`blue` are on the range 0-255.
* `iterm2_tab_color_reset` resets the color of iTerm2's current tab back to
  default.

#### jump

This plugin allows to easily jump around the file system by manually adding marks.

* `jump <mark-name>` jumps to the given mark.
* `mark [mark-name]` creates a mark with the given name or with the name of the current directory if none is provided.
* `unmark <mark-name>` removes the given mark.
* `marks` lists the existing marks and the directories they point to.

<kbd>ctrl</kbd> + <kbd>g</kbd> substitutes the written mark name for the full
path of the mark.

`j` is an alias for `jump`.

#### keychain

This plugin starts automatically [`keychain`](https://www.funtoo.org/Keychain)
to set up and load whichever credentials for ssh connections. It tries to load
several identities in quiet mode and will ignore missing identities.

#### macos

This plugin provides a few utilities to make it more enjoyable on macOS.

| Command       | Description                                              |
| :------------ | :------------------------------------------------------- |
| `tab`         | Open the current directory in a new tab                  |
| `split_tab`   | Split the current terminal tab horizontally              |
| `vsplit_tab`  | Split the current terminal tab vertically                |
| `ofd`         | Open the current directory in a Finder window            |
| `pfd`         | Return the path of the frontmost Finder window           |
| `pfs`         | Return the current Finder selection                      |
| `cdf`         | `cd` to the current Finder directory                     |
| `pushdf`      | `pushd` to the current Finder directory                  |
| `quick-look`  | Quick-Look a specified file                              |
| `man-preview` | Open a specified man page in Preview app                 |
| `showfiles`   | Show hidden files in Finder                              |
| `hidefiles`   | Hide the hidden files in Finder                          |
| `music`       | Control Apple Music. Use `music -h` for usage details    |
| `rmdsstore`   | Remove .DS_Store files recursively in a directory        |
| `btrestart`   | Restart the Bluetooth daemon                             |
| `freespace`   | Erases purgeable disk space with 0s on the selected disk |

#### mosh

This plugin allows SSH tab completion for
[`mosh`](https://github.com/mobile-shell/mosh) hostnames.

#### pip

This plugin adds completion for [pip](https://pip.pypa.io/en/latest/), the
Python package manager.

To reset the cache, run `zsh-pip-clear-cache` and it will be rebuilt the next
time you autocomplete `pip install`.

| Alias      | Description                                   |
| :--------- | :-------------------------------------------- |
| `pipreq`   | Create requirements file                      |
| `pipir`    | Install packages from `requirements.txt` file |
| `pipupall` | Update all installed packages                 |
| `pipunall` | Uninstall all installed packages              |

#### ripgrep

This plugin adds completion for the text search tool
[`ripgrep`](https://github.com/BurntSushi/ripgrep).

#### rsync

This plugin adds aliases for frequent [`rsync`](https://rsync.samba.org/)
commands.

| Alias               | Command                                          |
| :------------------ | :----------------------------------------------- |
| `rsync-copy`        | `rsync -avz --progress -h`                       |
| `rsync-move`        | `rsync -avz --progress -h --remove-source-files` |
| `rsync-update`      | `rsync -avzu --progress -h`                      |
| `rsync-synchronize` | `rsync -avzu --delete --progress -h`             |

#### sudo

Easily prefix your current or previous commands with `sudo` by pressing
<kbd>ESC</kbd> twice.

#### terraform

This plugin adds completion for [`terraform`](https://www.terraform.io/).

`tf` is an alias for `terraform`.

#### zsh-syntax-highlighting

Syntax highlighting for Zsh.

Must be sourced at the end of plugin list, but just before
zsh-history-substring-search.

#### zsh-history-substring-search

Must be sourced after zsh-syntax-highlighting plugin.

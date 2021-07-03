## setup

```bash
DOTFILES_DEST=~/.dotfiles
git clone git@github.com:uldissturms/dotfiles $DOTFILES_DEST
$DOTFILES_DEST/init.sh
```

run ```chsh -s /bin/zsh``` to set zsh as default shell

## structure

```
.
├── atom.sh               // install atom plugins
├── vim.sh                // install vim dependencies
├── README.md
├── init.sh
├── macos
│   └── brew.sh
├── oh-my-zsh
│   └── custom
│       └── aliases.zsh
└── windows
    └── settings.json
```

## vim

### frequently used files

`.local.vimrc` - local vimrc settings per folder, more info - https://vimawesome.com/plugin/localrc-vim

### frequently used key bindings

* `SQL`
  * `<leader>sel` - execute line
  * `<leader>se` - execute selection
  * `:DBSetOption profile=staging` - set SQL profile to staging where profile defined as:
    ```vim
    let g:dbext_default_profile_staging = 'type=MYSQL:user=root:passwd=root:port=3306:host=localhost'
    ```
* `Code`
  * unimpaired (`:h unimpaired`)
    * `[q` and `]q` - next and previous quickfix (unimpaired)
    * `[e` and `]e` - exchange the current line with one above or below it
    * `[n` and `]n` - git conflict markers
  * fzf (`:h fzf`)
    * `<C-p>` - files
    * `<C-b>` - buffers
    * `<leader>hc` - command history
    * `<leader>hs` - search history

### hacks

* `vim -u NONE` - open vim with no plugins loaded

## applications

### networking

* proxies
  * https://proxyman.io/
  * http://anyproxy.io/
  * https://mitmproxy.org/
* shells
  * https://mosh.org/ (more reliable than ssh on poor connections - e.g., when roaming)

### system

* osquery

### time management

* pomodoro
  * https://github.com/schmich/marinara - chrome

## references

* cli
  * https://www.wezm.net/technical/2019/10/useful-command-line-tools/
* vim
  * https://sanctum.geek.nz/arabesque/vim-anti-patterns/
* tmux
  * http://cheat.errtheblog.com/s/tmux

### clipboard

* `copyq` - https://github.com/hluk/CopyQ

### cloud storage

* google drive
* icloud
* dropbox
* mega.nz

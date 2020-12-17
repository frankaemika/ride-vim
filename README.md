# ride-vim

LF syntax highlighting for `vim`.

## Installation

### Plugin manager (recommended)

The recommended way to install this plugin is to use a plugin manager like [vim-plug](https://github.com/junegunn/vim-plug).

Add the following to your `vimrc` and follow the instructions of the plugin manager.

```
Plug 'frankaemika/ride-vim'
```

### Alternative method

Clone the repository to a temporary location.

To install the plugin for current user, for linux e.g. to `~/.vim`:

```
make install PREFIX=~/.vim
```

or globally, for all users with a vim install location of e.g. `/usr/share/vim/vim81`:

```
sudo make install PREFIX=/usr/share/vim/vim81
```

### Enable syntax highlighting

Make sure syntax highlighting is enabled and the file type is detected, e.g. in your `vimrc`:

```
syntax on
```

## License

`ride-vim` is licensed under the [Apache 2.0 license][apache-2.0]

[apache-2.0]: https://www.apache.org/licenses/LICENSE-2.0.html

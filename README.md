## Installation

Example installation to `~/.vim`:

```
make install PREFIX=$HOME/.vim
```

Make sure syntax highlighting is enabled and the file type is detected, e.g. in your `vimrc`:

```
syntax on
filetype plugin indent on

au BufNewFile,BufRead *.race set filetype=race
```



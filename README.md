![Demo](http://i.andrewradev.com/eac0069b7057625134bd42fae838db69.gif)

## Usage

You need either:

- A GUI Vim like `gvim` or `mvim` (I've only tested with gvim)
- Neovim with `set termguicolors`

After that, running the following command should open a new tab and show the animation:

``` vim
:Dealwithit
```

If you're using a Vim GUI, you can set `guifont` to something smaller to get it to fit the image better by preparing the variable `g:dealwithit_guifont`:

``` vim
let g:dealwithit_guifont = 'Fantasque Sans Mono 8'
```

When you `:quit` the image buffer, the font should be restored to its previous value. There's no default value, because the syntax of `guifont` depends on the OS, but also it depends on your current font, monitor size etc.

If the animation is running too fast, you can set `g:dealwithit_sleep` to a number of milliseconds to sleep between frames:

``` vim
let g:dealwithit_guifont = 20
```

## Internals

Vim has support for opening XPM files and the `resources/frames` folder has a bunch of them. These are images where the pixels are encoded using ASCII. The "syntax highlighting" parses the image and applies the right colors to the right symbols, effectively drawing an image. Tim Pope's [afterimage](https://github.com/tpope/vim-afterimage) plugin works by converting other image types to XPMs and relying on the same thing.

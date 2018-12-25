# vim-smooth-scroll

## About
This plugin makes scrolling in Vim nice and smooth. Find yourself completely lost every time you use `Ctrl-f` or  `Ctrl-b`? You might want to give this plugin a try.

## Installation
Install using [vim-plug], [minpac] or your favorite Vim package manager.

Alternatively, copy `autoload/smooth_scroll.vim` into an `autoload` folder in Vim's `runtimepath` e.g. `~/.vim` or `~\vimfiles`.

## Quick Start
Map your favorite keys like below:

```vim
nnoremap <silent> <C-u> :call smooth_scroll#scroll('u', &scroll, 10, 2)<CR>
nnoremap <silent> <C-d> :call smooth_scroll#scroll('d', &scroll, 10, 2)<CR>
nnoremap <silent> <C-b> :call smooth_scroll#scroll('u', &scroll*2, 10, 4)<CR>
nnoremap <silent> <C-f> :call smooth_scroll#scroll('d', &scroll*2, 10, 4)<CR>
```

## Function
`smooth_scroll#scroll` takes the following 4 parameters. Customize it however you like
- __Direction__: This is the direction you want to scroll, `'u'` for up and `'d'` for down
- __Distance__: This is the total number of lines you want to scroll
- __Duration__: This is how long you want each frame of the scrolling animation to last in __milliseconds__. Each frame will take _at least_ this amount of time. It could take more if Vim's scrolling itself is slow
- __Speed__: This is how many lines to scroll during each frame of the scrolling animation

## This fork
This is a fork of the original [vim-smooth-scroll by terryma]. Has a fix for [stopping scrolling at the document edges], some small optimizations and more concise code.

[vim-plug]: https://github.com/junegunn/vim-plug
[minpac]: https://github.com/k-takata/minpac
[vim-smooth-scroll by terryma]: http://github.com/terryma/vim-smooth-scroll
[stopping scrolling at the document edges]: https://github.com/terryma/vim-smooth-scroll/issues/6

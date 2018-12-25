" ==============================================================================
" File: smooth_scroll.vim
" Original Author: Terry Ma
" Description: Scroll the screen smoothly to retain better context. Useful for
" replacing Vim's default scrolling behavior with CTRL-D, CTRL-U, CTRL-B, and
" CTRL-F
" Original Created On: April 04, 2013
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

" Scroll the scroll smoothly
" dir: Direction of the scroll. 'd' is downwards, 'u' is upwards
" dist: Distance, or the total number of lines to scroll
" duration: How long should each scrolling animation last. Each scrolling
" animation will take at least this long. It could take longer if the scrolling
" itself by Vim takes longer
" speed: Scrolling speed, or the number of lines to scroll during each scrolling
" animation
function! smooth_scroll#scroll(dir, dist, duration, speed) abort
  for i in range(a:dist / a:speed)
    let start = reltime()
    if a:dir ==# 'd'
      if line('.') == line('$')
        break
      endif
      execute "normal! " . a:speed . "\<C-e>" . a:speed . "j"
    else
      if line('.') == 1
        break
      endif
      execute "normal! " . a:speed . "\<C-y>" . a:speed . "k"
    endif
    redraw
    let elapsed = reltimefloat(reltime(start)) * 1000.0
    let snooze = float2nr(a:duration - elapsed)
    if snooze > 0
      execute "sleep " . snooze . "m"
    endif
  endfor
endfunction

let &cpoptions = s:save_cpo

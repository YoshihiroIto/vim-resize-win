"=============================================================================
" FILE: resize_win.vim
" AUTHOR: Yoshihiro Ito <yo.i.jewelry.bab@gmail.com@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

function! resize_win#resize_win()

  let d1 = 4
  let d2 = 4

  let t = &titlestring
  let x = &columns
  let y = &lines
  let k = 'k'

  if x == -1 || y == -1
    echoerr 'Can not get window position'
  else
    while stridx('hjklHJKL', k) >= 0
      let &titlestring = 'Resizeing window: (' . x . ', ' . y . ')'
      redraw

      let k = nr2char(getchar())

      if k ==? 'h'
        let x = x - d1
        if k == 'h'
          let x = x - d2
        endif
      endif

      if k ==? 'j'
        let y = y + d1
        if k == 'j'
          let y = y + d2
        endif
      endif

      if k ==? 'k'
        let y = y - d1
        if k == 'k'
          let y = y - d2
        endif
      endif

      if k ==? 'l'
        let x = x + d1
        if k == 'l'
          let x = x + d2
        endif
      endif

      let &columns = x
      let &lines = y
    endwhile
  endif

  let &titlestring = t
endfunction

" vim: set ts=2 sw=2 sts=2 et : 

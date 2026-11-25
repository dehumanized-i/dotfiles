set number
syntax on
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

" --- Cursor shape per mode (DECSCUSR; tmux understands these natively) ---
let &t_SI = "\e[6 q"   " insert:  bar
let &t_SR = "\e[4 q"   " replace: underline
let &t_EI = "\e[2 q"   " normal:  block

" Set the shape on enter and restore it on exit. Guarded so re-sourcing the
" vimrc doesn't append the same sequence again and again.
" On exit, "\e[0 q" would restore the terminal's own default instead of a bar.
let s:cur_enter = "\e[2 q"
let s:cur_exit  = "\e[6 q"
if stridx(&t_ti, s:cur_enter) < 0 | let &t_ti .= s:cur_enter | endif
if stridx(&t_te, s:cur_exit)  < 0 | let &t_te .= s:cur_exit  | endif

" Key-code timeout (too low can misparse split escape sequences in tmux)
set ttimeout ttimeoutlen=50

" --- Mode names and colors (ANSI palette: 1=red 2=green 3=yellow 4=blue 5=magenta) ---
let g:mode_map = {
      \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE',
      \ 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
      \ 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK',
      \ 'c': 'COMMAND', 't': 'TERMINAL' }
let g:mode_color = {
      \ 'n': 4, 'i': 2, 'R': 1,
      \ 'v': 5, 'V': 5, "\<C-v>": 5,
      \ 's': 5, 'S': 5, "\<C-s>": 5,
      \ 'c': 3, 't': 2 }

" --- Statusline: whole bar is recolored per mode ---
" mode()[0] collapses 'no', 'niI', 'Rv', 'cv', 'nt', ... to their base mode.
set laststatus=2
set noshowmode
let &statusline = ' %{get(g:mode_map, mode()[0], mode())}  %f %m%r%=%y %l:%c %p%% '

let s:last_color = -1

function! s:ModeColor(m, force) abort
  let l:c = get(g:mode_color, a:m[0], 4)
  " Same color as before: skip the redundant :highlight and redraw.
  if !a:force && l:c == s:last_color
    return
  endif
  let s:last_color = l:c
  execute 'highlight StatusLine ctermfg=0 ctermbg=' . l:c . ' cterm=bold'
  highlight StatusLineNC ctermfg=7 ctermbg=8 cterm=NONE
  " :terminal windows use their own groups
  highlight! link StatusLineTerm   StatusLine
  highlight! link StatusLineTermNC StatusLineNC
  " :redraw, not :redrawstatus: the latter shows the new text but keeps the
  " old color while you're typing on the command line.
  redraw
endfunction

augroup mode_color
  autocmd!
  autocmd VimEnter,ColorScheme * call s:ModeColor(mode(), 1)
  if exists('##ModeChanged')
    autocmd ModeChanged * call s:ModeColor(v:event.new_mode, 0)
  endif
augroup END

" Re-sourcing after startup: VimEnter won't fire again, so apply now.
if v:vim_did_enter
  call s:ModeColor(mode(), 1)
endif

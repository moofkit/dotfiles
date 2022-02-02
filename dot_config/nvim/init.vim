set mouse=

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'thoughtbot/vim-rspec'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Fzf.vim
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <C-p> :GFiles<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" RSpec.vim mappings
map <C-t> :call RunCurrentSpecFile()<CR>
map <C-s> :call RunNearestSpec()<CR>
map <C-l> :call RunLastSpec()<CR>
map <C-a> :call RunAllSpecs()<CR>

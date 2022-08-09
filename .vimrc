syntax on

set number
set incsearch
set hlsearch

set tabstop=2
set shiftwidth=2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set laststatus=2

" NERDTree
nnoremap <leader>f :NERDTreeFocus<CR>

augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi cursorline gui=underline
  autocmd BufLeave NERD_tree_* highlight clear cursorline
  autocmd BufAdd * highlight clear cursorline
augroup END

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

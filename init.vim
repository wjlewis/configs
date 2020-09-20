filetype plugin indent on
syntax enable
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=80

set number relativenumber

let mapleader="\<Space>"

inoremap jk <Esc>

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

" See github.com/joshdick/onedark.vim
if (empty($TMUX))
  if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has('termguicolors'))
    set termguicolors
  endif
endif

" Color scheme
colorscheme onedark

" Lightline
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

" Python configuration
let g:python3_host_prog='/usr/bin/python3'

" Format on save
autocmd BufWrite * :Autoformat
autocmd BufWrite * :PrettierAsync

" Disable vim's default formatting
let g:autoformat_autoindent=0
let g:autoformat_retab=0
let g:autoformat_remove_trailing_spaces=0

" Formatting for specific filetypes
autocmd FileType yaml setlocal tabstop=2 sts=2 shiftwidth=2 expandtab

" See github.com/neoclide/coc.nvim, specifically the
" 'Example vim configuration section' for an explanation
" of these:
set hidden

set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300

set shortmess+=c

" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Always show the signcolumn
if has('patch-8.1.1564')
    set signcolumn=number
else
    set signcolumn=yes
endif

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)

" Toggle Tree
nnoremap <leader>b :NERDTreeToggle<CR>

" Close tree if it is the last open buffer
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

filetype plugin indent on
syntax enable
set expandtab
set tabstop=4
set shiftwidth=4

set number relativenumber

let mapleader="\<Space>"

inoremap jk <Esc>

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Color scheme
colorscheme dracula

" Lightline
let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ }

" Python configuration
let g:python3_host_prog='/usr/bin/python3'

" Format on save
autocmd BufWrite * :Autoformat

" Disable vim's default formatting
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

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

" Always show the signcolumn
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)

filetype plugin indent on
syntax enable
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=72
set nowrap

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
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'cespare/vim-toml'
Plug 'fidian/hexmode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'chrisbra/unicode.vim'
Plug 'wlangstroth/vim-racket'
Plug 'airblade/vim-gitgutter'

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
set background=dark
colorscheme onedark

" Lightline
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

" Python configuration
let g:python3_host_prog='/usr/bin/python3'

" Disable vim's default formatting
let g:autoformat_autoindent=0
let g:autoformat_retab=0
let g:autoformat_remove_trailing_spaces=0

autocmd BufWrite * :Autoformat

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

nmap <Leader>rn <Plug>(coc-rename)

" Configure tree
nnoremap <leader>b :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap <Leader>r :NERDTreeFocus<CR>:normal R<CR><C-w><C-p>

" Close tree if it is the last buffer open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Language-specific overrides/settings
autocmd FileType asm,c setlocal shiftwidth=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType asm,c iunmap <Tab>

autocmd FileType js,ts,jsx,tsx,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ##################
" #     .vimrc     #
" #       by       #
" #   devaneyJE    #
" ##################

" #################
" plugin management
" #################

" # Vundle setup
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" # plugins
call vundle#begin()
"Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'zefei/simple-dark'
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-repeat'
Plugin 'glts/vim-radical'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-capslock'
Plugin 'tc50cal/vim-terminal'

call vundle#end()
filetype plugin indent on

" # plugin settings
" ## NERDTree
" open
" autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
" close vim with NT only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ## lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" ## easyclip
set clipboard=unnamed,unnamedplus

" ############
" vim settings
" ############

" setting editor visuals
set number
"set rnu
syntax on
set t_Co=256
colorscheme simple-dark
set tabstop=4
set splitbelow
set splitright

set tabstop=4
set shiftwidth=4

" error audio
" set visualbell

" last line
set showcmd
set showmode

" search the things
set hlsearch
set ignorecase

" copy/paste
set mouse=v
"set paste


" ############
" # keybinds #
" ############

" navigation
map { <Nop>
map } <Nop>
noremap K {
noremap J }
nnoremap Y y$

"imap <Up>    <Nop>
"imap <Down>  <Nop>
"imap <Left>  <Nop>
"imap <Right> <Nop>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" testing: 

" remap capslock through X mapping while in vim
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

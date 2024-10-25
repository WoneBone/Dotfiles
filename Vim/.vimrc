"Line numbers
set number
set relativenumber
set mouse=a

"Tabs and sintax
set tabstop=4
set noexpandtab 
set smarttab 
set cindent 
set shiftwidth=4
set autoindent

"Folding
set foldmethod=indent
set foldlevel=20

"Searching
set ignorecase 
set smartcase
set hlsearch

"Misc
set scrolloff=5

"VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

	" List your plugins here
	Plug 'sheerun/vim-polyglot'
    Plug 'sainnhe/everforest'

call plug#end()

set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1

colorscheme everforest


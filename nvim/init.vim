set noesckeys

syntax enable
filetype plugin indent on

set rtp+=/usr/local/opt/fzf

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Settings
"

let mapleader=','

set nobackup
set noswapfile
set nowritebackup

set ttimeout
set ttimeoutlen=50
set shiftround
set autoindent
set complete-=i
set nrformats-=octal
set hidden
set splitbelow
set number
set ruler
set autoread
set lazyredraw
set nocursorline
set background=dark

" Plugins
"

call plug#begin('~/.config/nvim/plugged')

	" Colorscheme
	Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}

	" Languages/Syntax
	Plug 'mxw/vim-jsx'
	Plug 'fatih/vim-go'
	Plug 'dag/vim-fish'
	Plug 'othree/html5.vim'
	Plug 'vim-ruby/vim-ruby'
	Plug 'StanAngeloff/php.vim'
	Plug 'slim-template/vim-slim'
	Plug 'pangloss/vim-javascript'
	Plug 'kchmck/vim-coffee-script'

	" Utilities
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-repeat'
	Plug 'mhinz/vim-grepper'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'Raimondi/delimitMate'

	" Linting
	Plug 'benekastah/neomake'

	" Testing
	Plug 'janko-m/vim-test'

call plug#end()

" Plugin settings
"

" Dracula
colorscheme dracula

" Vim test
let test#strategy = "neovim"

" Vim jsx
let g:jsx_ext_required=0

" Autocommands
"
autocmd! BufWritePost * Neomake

" Mappings
"
map Q :quit<CR>
inoremap § <Esc>
cnoremap § <C-c>
tnoremap § <C-\><C-n>
nnoremap <Leader>ve :edit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>f :Grepper<CR>
nnoremap <silent> <Leader>cp :let @+=expand("%:p")<CR>
nnoremap <C-P> :FZF -m<CR>
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

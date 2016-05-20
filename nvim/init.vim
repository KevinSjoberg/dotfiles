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

" Use ',' as leader key
let mapleader=','

" Use The Silver Searcher (AG) for grepping
set grepprg=ag\ --vimgrep

" Do not write swap or backup files
set noswapfile
set nowritebackup

" Reduce wait time for key code sequences to complete
set ttimeout
set ttimeoutlen=50

" Copy indent from current line when starting a new line
set autoindent

" Hiden buffers when abandoned
set hidden

" Split below current buffer
set splitbelow

" Show line numbers
set number

" Show the line and column number of the cursor position
set ruler

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again
set autoread

" Do not redraw while executing macros, registers and other commands that have
" not been typed. Also, updating the window title is postponed
set lazyredraw

" Do not highlight the current line
set nocursorline

" Use dark background
set background=dark

" Set completion mode when autocompleting with <Tab>
set wildmode=list:longest,full

" Plugins
"
call plug#begin('~/.config/nvim/plugged')

	" Colorscheme
	Plug 'chriskempson/base16-vim'

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
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-dispatch'
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
" Base16
let base16colorspace=256
colorscheme base16-default

" Vim test
let test#strategy='dispatch'

" Vim jsx
let g:jsx_ext_required=0

" Neomake
"
let g:neomake_verbose=0
autocmd! BufWritePost * Neomake

" Netrw
let g:netrw_localrmdir='rm -r'

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

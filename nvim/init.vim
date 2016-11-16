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
let mapleader=","
let maplocalleader=","

" 24-bit color support
set termguicolors

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

" Do not show mode messages
set noshowmode

" Plugins
"
call plug#begin('~/.config/nvim/plugged')

	" Colorscheme & statusline
	Plug 'dracula/vim'
	Plug 'itchyny/lightline.vim'

	" Languages
	Plug 'sheerun/vim-polyglot'

	" Go
	Plug 'fatih/vim-go'

	" Other
	Plug 'MarcWeber/vim-addon-local-vimrc'
	Plug 'benekastah/neomake'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'janko-m/vim-test'
	Plug 'rizzatti/dash.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-vinegar'

call plug#end()

" Plugin settings
"

" Dracula
colorscheme dracula

" Lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \ }
      \ }

" Vim test
let g:test#strategy='neovim'

" Neomake
"
autocmd! BufWritePost * Neomake

" Netrw
let g:netrw_localrmdir='rm -r'

" Vim Go
let g:go_fmt_command='goimports'

" Mappings
"
nmap <Leader>q  <Plug>(choosewin)
inoremap § <Esc>
cnoremap § <C-c>
tnoremap § <C-\><C-n>
nnoremap <Leader>ve :edit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Space> :nohlsearch<CR>
nnoremap <silent> <Leader>cpf :let @+=expand("%:p")<CR>
nnoremap <silent> <Leader>cpr :let @+=expand("%")<CR>
nnoremap <C-p> :FZF -m<CR>
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <Leader>d :Dash<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

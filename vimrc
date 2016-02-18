""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Vim more useful
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow backspace in insert mode
set backspace=indent,eol,start

" Ignore case when searching
set ignorecase
set smartcase

" Show search matches while typing
set incsearch

set smartindent

set mouse=

set foldlevelstart=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if !has("nvim")
  call plug#begin('~/.vim/plugged')
else
  call plug#begin('~/.config/nvim/plugged')
endif

Plug 'airblade/vim-gitgutter'
Plug 'albfan/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'chriskempson/base16-vim'
Plug 'corntrace/bufexplorer'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'docunext/closetag.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'geekjuice/vim-mocha', { 'for': 'javascript' }
Plug 'gilsondev/searchtasks.vim'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'heavenshell/vim-jsdoc'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-gtfo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'juvenn/mustache.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-node'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'scrooloose/nerdtree'
Plug 'shime/vim-livedown'
Plug 'shinokada/dragvisuals.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Crunch'
Plug 'vim-scripts/directionalWindowResizer'
Plug 'vim-scripts/bash-support.vim'
Plug 'vim-scripts/gitignore.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/tComment'
Plug 'w0ng/vim-hybrid'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ryanoasis/vim-devicons' " Must load last

if !has('nvim')
  Plug 'scrooloose/syntastic'
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  Plug 'benekastah/neomake', { 'commit': 'cfd24b0' }
  Plug 'kassio/neoterm'
  Plug 'Shougo/deoplete.nvim'
endif

call plug#end()

" Install plugins if this is the first run
if !isdirectory(expand(g:plug_home))
  PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background color to dark
set background=dark

" Draw a vertical ruler at column 80
execute "set colorcolumn=" . join(range(81,335), ',')

" Highlight current line
set cursorline

" Adds - as a word separator
set iskeyword-=-

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Highlight unwanted whitespace
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Show whitespace
set list

" For regular expressions turn magic on
set magic

" Disables annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set line numbers
set number

" Show ruler
set ruler

" Minimum of 5 lines above and below cursor must be visible
set scrolloff=5

" Don't show short message when starting Vim
set shortmess=atI

" Show the (partial) command as it’s being typed
set showcmd

" Show matching brackets
set showmatch

" Override 'ignorecase' if search pattern containers uppercase characters
set smartcase

" Lowers timeout length between commands
set timeoutlen=250

" Optimize for fast terminals
set ttyfast

" Enables autocomplete menu
set wildmode=longest:full
set wildmenu

" Wrap long lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on
colorscheme hybrid_reverse

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match OverLength /\%126v.*/
highlight OverLength ctermbg=black guibg=black
autocmd ColorScheme * highlight OverLength ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don't add empty newlines at the end of files
set noeol

" Ignore certain files
set wildignore+=
  \.git,
  \*/node_modules,
  \*/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

compiler ruby

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd FileType ruby runtime ruby_mappings.vim

if version >= 700
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
  autocmd FileType tex setlocal spell spelllang=en_us
endif

autocmd FileType markdown setlocal spell spelllang=en_us

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Autoremove trailing spaces when saving the buffer
autocmd FileType css,html,javascript,markdown,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=mustache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces
set expandtab

" Use 2 characters per indent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Disable maximum text width
set textwidth=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>q :q<cr>

" Fast save + quit
nmap <leader>wq :wqa!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1

" Devicons
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:DevIconsEnableFolderPatternMatching = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsEnableFoldersOpenClose = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" ESLint
let g:syntastic_javascript_checkers = ['eslint']

" FZF
if !has('nvim')
  let g:fzf_height = 20
  map <C-p> :FZF<CR>
else
  map <C-p> :call fzf#run({
  \ 'sink': 'e',
  \ 'window': 'topleft 20new'})<CR>
endif

" Hybrid

let g:hybrid_custom_term_colors = 1

" JSDOC
nmap <silent> <C-m> <Plug>(jsdoc)
let g:jsdoc_enable_es6 = 1

" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : ""

" neomake
if has('nvim')
  let g:neomake_javascript_enabled_makers = ['eslint']
  nmap <leader>t :let g:neomake_javascript_enabled_makers = ['jshint']<cr>:Neomake<cr>
  nmap <leader>f :let g:neomake_javascript_enabled_makers = ['eslint']<cr>:Neomake<cr>
  autocmd! BufWritePost * Neomake
endif

" NERDTree
let NERDTreeIgnore=['.git', 'coverage', 'node_modules', 'tmp']
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" Tagbar
map <silent> <LocalLeader>s :Tagbar<CR>

" TComment
map <silent> <LocalLeader>cc :TComment<CR>

" Markdown

let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'bash=sh']

" Mustache
let g:mustache_abbreviations = 1

" DragVisuals
runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#javascript#mocha#options = '--recursive -R spec -b'

function! TestStrategy(cmd)
  execute 'T '.a:cmd
endfunction

let g:test#custom_strategies = {'test_strategy': function('TestStrategy')}
let g:test#strategy = 'test_strategy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trim trailing whitespace
function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reload vimrc when changed
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC
augroup END

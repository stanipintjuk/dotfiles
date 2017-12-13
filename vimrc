"NeoBundle Scripts-----------------------------
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))


" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ============ GENERAL PURPOSE PLUGINS ================

" Snippet plugins
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" for finding filetype by context
NeoBundle 'Shougo/context_filetype.vim'

" file tree
NeoBundle 'scrooloose/nerdtree'
" file tree git support
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
" comment stuff
NeoBundle 'scrooloose/nerdcommenter'

" enhanced status bar
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" git plugin for vim
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" Syntax checker
NeoBundle 'vim-syntastic/syntastic'

" Highlight letters on  same row
NeoBundle 'unblevable/quick-scope'

" Eunich vim
NeoBundle 'tpope/vim-eunuch'

" Fuzzy file search
NeoBundle 'ctrlpvim/ctrlp.vim'

" Distraction free writing
NeoBundle 'junegunn/goyo.vim'

" Terminal emulator for vim
NeoBundle 'oplatek/Conque-Shell'
" =========== LANGUAGE SPECIFIC PLUGINS ================
" Nix (the package manager)
" NeoBundle 'MarcWeber/vim-addon-nix'

" Golang stuff 
NeoBundle 'fatih/vim-go' "Make sure to run :GoInstallBinaries
NeoBundle 'nsf/gocode'

" typescript syntax highlighting
NeoBundle 'leafgarland/typescript-vim'
" react JSX syntax highlighting, and a base JS highligher
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'

" typescript autocompletions and more
" NeoBundle 'Shougo/vimproc.vim', {
"       \ 'build' : {
"       \     'windows' : 'tools\\update-dll-mingw',
"       \     'cygwin' : 'make -f make_cygwin.mak',
"       \     'mac' : 'make -f make_mac.mak',
"       \     'linux' : 'make',
"       \     'unix' : 'gmake',
"       \    },
"       \ }
" I guess that this is a typescript linter?
NeoBundle 'Quramy/tsuquyomi'

" Elm plugin
NeoBundle "lambdatoast/elm.vim"

" rust
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'
" =========== FUN STUFF =============================
NeoBundle('dermusikman/sonicpi.vim')

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts ------------------------

" VIM CONFIGURATIONS ==========================

"set term=ansi
syntax on

set relativenumber
set number

" Preferred indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" to make colors work no matter what
set t_Co=256
set laststatus=2
"colorscheme janah
"colorscheme Monokai

set autoread
set completeopt=longest,menuone
set hlsearch

"KEY MAPS =====================================

nnoremap ä :
let mapleader='ö'
nmap ; ö
nnoremap <leader>n :NERDTreeToggle<Return>
nnoremap <leader>o :NERDTreeFocus<Return>:set relativenumber<Return>

nnoremap <leader><leader> :
nnoremap <leader>vim :source ~/.vimrc<cr>
nnoremap <leader>r :checktime<cr>


" navigation
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l
nnoremap gh <C-w>h
" movement
nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gL <C-w>L
nnoremap gH <C-w>H
nnoremap gr <c-w>r
nnoremap gR <c-w>R
" creating new
nnoremap gn :split<cr>
nnoremap gv :vsplit<cr>
" Go back after 'gd' with gb
nnoremap <C-o> gb

nnoremap <leader>= mmgg=G`m
nnoremap cin F(c%()<esc>i
nnoremap <f5> :checktime<CR>
nnoremap <leader>rc :tabnew ~/.vimrc<cr>
nnoremap <leader>s /
nnoremap <leader>w :w<cr>

" PLUGIN CONFIGURATIONS =======================

" Airline -------------------------------------
" Set the theme nad font
let g:airline_powerline_fonts=1
autocmd vimenter * AirlineTheme wombad

" NERDTree ------------------------------------
" close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" CtrlP ---------------------------------------
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](doc|tmp|node_modules|target)',
\ 'file': '\v\.(exe|so|dll|bin)$',
\ }
let g:ctrlp_map = '<leader><space>'

" Vim-JSX -------------------------------------

" this is required to make JSX highlighting work for .js files
let g:jsx_ext_required = 0 

" Syntastic -----------------------------------
" to make vimgo work with syntastic
let g:syntastic_go_checkers = ['golint']
let g:go_version_warning = 0


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" you have to install these to be able to use syntax checking for react, JS
" and JSX
"npm install -g eslint babel-eslint eslint-plugin-react eslint_d
" also add this config to ~/.eslintrc
"{
"    "parser": "babel-eslint",
"    "env": {
"        "browser": true,
"        "node": true
"    },
"    "settings": {
"        "ecmascript": 6,
"        "jsx": true
"    },
"    "plugins": [
"        "react"
"    ],
"    "rules": {
"        "strict": 0,
"        "quotes": 0,
"        "no-unused-vars": 0,
"        "camelcase": 0,
"        "no-underscore-dangle": 0
"    }
"}
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

"tsuquyomi is a faster ts linter for VIM
let g:syntastic_typescript_checkers = ['tsuquyomi']
"But if you want tslint instead then do this 
" npm install -g typescript tslint
"let g:syntastic_typescript_checkers = ['tslint']

" rust
"let g:syntastic_rust_rustc_args = '-Z no-trans'
"let g:syntastic_rust_rustc_args = ['-Z no-trans']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_exec = 'cargo-check'

" NeoComplete ---------------------------------

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"Use smartcase.
let g:neocomplete#enable_smart_case = 1
"Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" NeoSnippet ----------------------------------
let g:neosnippet#snippets_directory="~/.vim/bundle/neosnippet-snippets/neosnippets"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Goyo --------------------------------------
let g:goyo_width=120
function! s:goyo_enter()
  colorscheme 256-grayvim
  set relativenumber
  set number
endfunction

function! s:goyo_leave()
  colorscheme Monokai
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Racer -----------------------------------------
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
" For showing more stuff in the completions
"let g:racer_experimental_completer = 1

" ConqueTerm ------------------------------------
let g:ConqueTerm_TERM = 'xterm-256color'

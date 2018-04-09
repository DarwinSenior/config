" reasonable settings {{{
set laststatus=2
set wildmenu
set lazyredraw
set showmatch
set number
set guitablabel=%N\ %t
set whichwrap+=<,>,h,l
set clipboard+=unnamedplus
set nowrap
set hidden
" }}}

if has('mouse')
  set mouse=a
endif

if has('termguicolors')
  set termguicolors
endif

set ignorecase
set smartcase
set hlsearch
set incsearch
if exists('&inccommand')
  set inccommand=nosplit
endif

set autoread
set noswapfile
set nobackup
set nowritebackup

nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>
cabbrev w!! w !sudo tee > /dev/null %
if has('nvim')
  tnoremap <C-j> <C-\><C-n><C-W><C-j>
  tnoremap <C-k> <C-\><C-n><C-W><C-k>
  tnoremap <C-l> <C-\><C-n><C-W><C-l>
  tnoremap <C-h> <C-\><C-n><C-W><C-h>
  autocmd BufEnter term://* startinsert
endif

set wrap
set linebreak
set nolist
set iskeyword+=-
set iskeyword-=/

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nosmartindent

call plug#begin('~/.config/nvim/plug')

" tpope plugins {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
" }}}

" for apperance {{{
Plug 'rakr/vim-one'
let g:one_allow_italics = 1
let g:enable_bold_font = 1
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'one'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ariline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#vimtex#enabled = 1
Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'
Plug 'miyakogi/seiya.vim'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'qstrahl/vim-matchmaker'
let g:matchmaker_enable_startup = 1
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" }}}

" for text manipulation {{{
" enhancement
Plug 'christoomey/vim-sort-motion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
Plug 'benjifisher/matchit.zip'
Plug 'sickill/vim-pasta'
Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace
Plug 'airblade/vim-matchquote'
" operator
Plug 'tommcdo/vim-exchange'
Plug 'justinmk/vim-sneak'
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
Plug 'kana/vim-operator-replace'
map gr <Plug>(operator-replace)
Plug 'haya14busa/vim-asterisk'
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
Plug 'haya14busa/vim-poweryank'
map <leader>y <Plug>(operator-poweryank-osc52)
" text object
Plug 'kana/vim-operator-user'
Plug 'reedes/vim-textobj-sentence', {'for': ['tex', 'markdown', 'pandoc', 'text']}
Plug 'junegunn/vim-after-object'
Plug 'michaeljsmith/vim-indent-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
Plug 'wellle/targets.vim'
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
Plug 'FooSoft/vim-argwrap'
nmap <silent> <leader>s :ArgWrap<CR>
" }}}

" navigation {{{
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/vim-slash'
Plug 'google/vim-searchindex'
Plug 'kopischke/vim-stay'
Plug 'dyng/ctrlsf.vim'
nmap <C-f> <Plug>CtrlSFPrompt
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_auto_close = 0
let g:ranger_map_keys = 0
nnoremap <C-p>f :Files<CR>
nnoremap <C-p>b :Buffers<CR>
nnoremap <C-p>g :GFiles<CR>
nnoremap <C-p>r :Ranger<CR>
nnoremap <C-p>m :Marks<CR>
Plug 'qpkorr/vim-bufkill'
let g:BufKillCreateMappigs = 0
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'roman/golden-ratio'
" let g:golden_ratio_autocommand = 0
" nmap <C-W>g <Plug>(golden_ratio_resize)
" }}}

" utils {{{
Plug 'majutsushi/tagbar'
Plug 'kassio/neoterm'
Plug 'jreybert/vimagit'
nmap <F10> :rightbelow Ttoggle<CR>
tmap <F10> <C-\><C-n>:Ttoggle<CR>
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_automap_keys = "<C-x><C-x>"
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)
for i in ['', 1, 2, 3, 4, 5, 6, 7, 8, 9]
  execute "nnoremap ".i."! :".i."T<space>"
endfor
Plug 'SirVer/ultisnips'
Plug 'jceb/emmet.snippets'
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
let g:UltiSnipsEditSplit = 'vertical'
" Plug 'pgilad/vim-skeletons'
" let skeletons#skeletonsDir = '~/.config/nvim/snippets/skeletons'
" let skeletons#autoRegister = 1
Plug 'diepm/vim-rest-console'
" }}}

" file syntax {{{
Plug 'Shougo/context_filetype.vim'
Plug 'vyzyv/vimpyter', { 'for': ['ipynb'] }
Plug 'jparise/vim-graphql', { 'for': ['javascript', 'typescript', 'vue'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'vue'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'vue'] }
Plug 'digitaltoad/vim-pug', {'for': ['pug', 'vue']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'vue']}
Plug 'kh3phr3n/python-syntax', {'for': ['python']}
let g:python_highlight_all = 1
Plug 'rust-lang/rust.vim', {'for': ['rust']}
let g:rust_fold = 1
Plug 'posva/vim-vue', {'for': ['vue']}
Plug 'dart-lang/dart-vim-plugin', {'for': ['dart']}
Plug 'wavded/vim-stylus', {'for': ['vue', 'stylus']}
Plug 'cespare/vim-toml', {'for': ['toml']}
Plug 'tikhomirov/vim-glsl', {'for': ['glsl']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': ['i3']}
Plug 'stephpy/vim-yaml', {'for': ['yaml']}
Plug 'dzeban/vim-log-syntax', {'for': ['log']}
Plug 'neomutt/neomutt.vim', {'for': ['mutt']}
Plug 'keith/tmux.vim', {'for': ['tmux']}
Plug 'chrisbra/NrrwRgn'
" }}}

" coding {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
nmap <leader><leader><leader> :Neoformat<CR>
Plug 'roxma/nvim-completion-manager'
let g:cm_refresh_length = 1
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<c-n>'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-syntax'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'w0rp/ale'
" }}}

" writing {{{
Plug 'vimscript/VOoM'
Plug 'vim-pandoc/vim-pandoc', {'for': ['markdown']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['markdown']}
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
let g:pandoc#folding#use_foldtext = 1
augroup pandoc_syntax
  autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
Plug 'matze/vim-tex-fold', {'for': ['tex']}
Plug 'lervag/vimtex', {'for': ['tex']}
let g:vimtex_view_method = 'mupdf'
" }}}

call plug#end()
filetype plugin indent on
syntax on

" highlight {{{
set background=dark
silent! colorscheme one
call one#highlight('Folded', '888888', 'none', 'bold')
call one#highlight('Matchmaker', 'none', '444444', 'none')
call one#highlight('Conceal', 'none', 'none', 'bold')
call one#highlight('ExtraWhiteSpace', 'none', '000000', 'none')
" }}}

augroup folding
  autocmd!
  autocmd BufEnter * set foldtext=util#FoldText()
augroup END

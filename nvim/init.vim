let mapleader=' '

let g:newtrw_browserx_viewer = 'xdg-open'
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

set wrapscan
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
set showcmd

nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>
call util#cabbrev('w!!', 'w !sudo tee > /dev/null %')
if has('nvim')
  tnoremap <C-j> <C-\><C-n><C-W><C-j>
  tnoremap <C-k> <C-\><C-n><C-W><C-k>
  tnoremap <C-l> <C-\><C-n><C-W><C-l>
  tnoremap <C-h> <C-\><C-n><C-W><C-h>
  autocmd BufEnter term://* startinsert
endif
nnoremap Q @q
nnoremap gV `[v`]
map q: <nop>
map q/ <nop>
map q? <nop>

set wrap
set linebreak
set list
set listchars=trail:·,tab:‣\ ,extends:…
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
cabbrev gw Gwrite
cabbrev gr Gread
cabbrev gs Gstatus
cabbrev gc Gcommit
cabbrev gp Gpull
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
let g:projectionist_heuristics = json_decode(join(readfile(expand('~/.config/nvim/projection.json'))))
call util#cabbrev('a', 'A')
call util#cabbrev('as', 'AS')
call util#cabbrev('at', 'AT')
call util#cabbrev('av', 'AV')
Plug 'tpope/vim-dispatch'
call util#cabbrev('d', 'Dispatch')
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
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
nnoremap <F2> :call util#synstack()<cr>

Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'qstrahl/vim-matchmaker'
let g:matchmaker_enable_startup = 1
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" }}}

" for text manipulation {{{
" enhancement
Plug 'kana/vim-niceblock' " I gI and A in visual mode
Plug 'jiangmiao/auto-pairs'
nmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
Plug 'sickill/vim-pasta'
Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace
Plug 'airblade/vim-matchquote'
Plug 'rhysd/conflict-marker.vim' " [x ]x ct co
" operator
Plug 'arecarn/vim-selection'
Plug 'christoomey/vim-sort-motion' " gs
Plug 'junegunn/vim-easy-align' " ga
Plug 'arecarn/vim-crunch' " g=
Plug 'kana/vim-operator-user'
Plug 'tommcdo/vim-exchange' " cx
Plug 'justinmk/vim-sneak'
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
Plug 'kana/vim-operator-replace' "gr
map gr <Plug>(operator-replace)
Plug 'haya14busa/vim-asterisk'
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
Plug 'haya14busa/vim-poweryank'
map <leader>y <Plug>(operator-poweryank-osc52)
" text object
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'glts/vim-textobj-comment' " ic ac
Plug 'reedes/vim-textobj-sentence', {'for': ['tex', 'markdown', 'pandoc', 'text']}
Plug 'michaeljsmith/vim-indent-object' "ii ai iI aI
Plug 'Julian/vim-textobj-variable-segment' "iv av
Plug 'sgur/vim-textobj-parameter' "i, a,
Plug 'junegunn/vim-after-object' "a= a: a- a# a<space>
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
Plug 'FooSoft/vim-argwrap'
nmap <silent> <leader>s :ArgWrap<CR>
" }}}

" navigation {{{
Plug 'Konfekt/FastFold'
let g:fastfold_fold_movement_commands = [']z', '[z']
Plug 'arecarn/vim-fold-cycle'
let g:fold_cycle_default_mapping = 0 "disable default mappings
nmap <Tab><Tab> <Plug>(fold-cycle-open)
nmap <S-Tab><S-Tab> <Plug>(fold-cycle-close)
Plug 'hecal3/vim-leader-guide'
nnoremap <silent> <leader> :<c-u>LeaderGuide '<space>'<cr>
nnoremap <silent> <C-p> :<c-u>LeaderGuide '<C-p>'<cr>
Plug 'junegunn/vim-slash'
Plug 'google/vim-searchindex'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kopischke/vim-stay'
Plug 'airblade/vim-rooter'
let g:rooter_manual_only = 1
Plug 'dyng/ctrlsf.vim'
nmap <C-f> <Plug>CtrlSFPrompt
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_auto_close = 0
let g:ranger_map_keys = 0
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p>f :Files<CR>
nnoremap <C-p>b :Buffers<CR>
nnoremap <C-p>g :GFiles<CR>
nnoremap <C-p>r :Ranger<CR>
nnoremap <C-p>m :Marks<CR>
Plug 'qpkorr/vim-bufkill'
let g:BufKillCreateMappings = 0
call util#cabbrev('bd', 'BD')
call util#cabbrev('bun', 'BUN')
Plug 'francoiscabrol/ranger.vim'
Plug 'roman/golden-ratio'
" let g:golden_ratio_autocommand = 0
" nmap <C-W>g <Plug>(golden_ratio_resize)
" }}}

" utils {{{
Plug 'majutsushi/tagbar'
call util#cabbrev('tb', 'TagbarToggle')
Plug 'jreybert/vimagit'
call util#cabbrev('m', 'Magit')
Plug 'cohama/agit.vim'
call util#cabbrev('ag', 'Agit')
Plug 'benmills/vimux'
Plug 'kassio/neoterm'
nmap <F10> :rightbelow Ttoggle<CR>
tmap <F10> <C-\><C-n>:Ttoggle<CR>
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_automap_keys = "<C-x><C-x>"
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir='~/.config/nvim/snippets/ultisnips'
let g:UltiSnipsSnippetDirectories=['plug/vim-snippets/UltiSnips' , 'plug/emmet.snippets/ultisnips']
Plug 'honza/vim-snippets'
Plug 'jceb/emmet.snippets'
Plug 'diepm/vim-rest-console', {'for': ['rest']}
Plug 'metakirby5/codi.vim'
let g:codi#autocmd = 'BufferWritePost'
let g:codi#rightalign = 0
" }}}

" file syntax {{{
Plug 'vim-scripts/SyntaxRange'
Plug 'Shougo/context_filetype.vim'
Plug 'vim-pandoc/vim-pandoc', {'for': ['markdown']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['markdown']}
let g:pandoc#folding#use_foldext = 0
augroup pandoc_syntax
  autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
Plug 'vyzyv/vimpyter', { 'for': ['ipynb'] }
Plug 'jparise/vim-graphql', { 'for': ['javascript', 'typescript', 'vue'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] }
Plug 'bbchung/Clamp', {'for': ['c', 'cpp']}
Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'vue'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'vue'] }
Plug 'digitaltoad/vim-pug', {'for': ['pug', 'vue']}
Plug 'othree/yajs.vim', {'for': ['javascript']}
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
Plug 'chiphogg/vim-prototxt', {'for': ['prototxt']}
Plug 'neomutt/neomutt.vim', {'for': ['mutt']}
Plug 'keith/tmux.vim', {'for': ['tmux']}
Plug 'chrisbra/NrrwRgn' "<leader>nr
Plug 'neomutt/neomutt.vim'
let g:airline#extensions#nrrwrgn#enabled = 1
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
let g:LanguageClient_serverCommands = {
      \ 'lua': ['lua-lsp'],
      \ 'dart': ['dart_language_server'],
      \ 'ruby': ['language_server-ruby'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'json': ['json-languageserver', '--stdio'],
      \ 'haskell': ['hie', '--lsp'],
      \ 'go': ['go-langserver'],
      \ 'python': ['pyls'],
      \ 'vue': ['vls'],
      \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
      \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
      \ 'cuda': ['cquery', '--log-file=/tmp/cq.log'],
      \}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
" }}}

" writing {{{
Plug 'arecarn/vim-spell-utils'
Plug 'mechatroner/rainbow_csv', {'for': ['csv', 'tsv']}
Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch',
      \ 'org',
      \]
Plug 'vimscript/VOoM'
" Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
let g:pandoc#folding#use_foldtext = 1
Plug 'matze/vim-tex-fold', {'for': ['tex']}
Plug 'lervag/vimtex', {'for': ['tex']}
let g:airline#extensions#vimtex#enabled = 1
let g:vimtex_view_method = 'mupdf'
let g:vimtex_fold_enabled = 1
Plug 'KeitaNakamura/tex-conceal.vim', {'for': ['tex', 'markdown']}
set conceallevel=2
let g:tex_conceal="abdgm"
" }}}

call plug#end()
filetype plugin indent on
syntax on

" highlight {{{
set background=dark
silent! colorscheme one
call one#highlight('Folded', '888888', 'none', 'bold')
call one#highlight('Matchmaker', 'none', '444444', 'none')
call one#highlight('Conceal', 'none', 'none', 'none')
call one#highlight('ExtraWhiteSpace', 'none', 'none', 'none')
" }}}

augroup folding
  autocmd!
  autocmd BufEnter * set foldtext=util#foldtext()
augroup END

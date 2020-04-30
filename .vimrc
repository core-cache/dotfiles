set nocompatible              " be iMproved, required
filetype off
runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

if has('macunix')
  set rtp+=/usr/local/opt/fzf
else
  set rtp+=~/.fzf
endif

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" languages
" all
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'
Plugin 'valloric/youcompleteme'

" javascript
Plugin 'pangloss/vim-javascript', {'for': 'javascript'}
" Plugin 'walm/jshint.vim', {'for': 'javascript'}
Plugin 'eslint/eslint', {'for': 'javascript'}
Plugin 'moll/vim-node', {'for': 'javascript'}
Plugin 'elzr/vim-json'

" typescript
Plugin 'leafgarland/typescript-vim', {'for': 'typescript'}
Plugin 'quramy/tsuquyomi', {'for': 'typescript'}

" haskell
Plugin 'neovimhaskell/haskell-vim', {'for': 'haskell'}

" html
Plugin 'docunext/closetag.vim'

" sql
Plugin 'Align'
Plugin 'dbext.vim'
Plugin 'SQLUtilities'

" terraform
Plugin 'hashivim/vim-terraform'
.
" productivity
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-utils/vim-husk'
Plugin 'tpope/vim-dispatch'
Plugin 'machakann/vim-swap'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-eunuch'

"snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" formating
Plugin 'godlygeek/tabular'
Plugin 'prettier/vim-prettier'

" config
Plugin 'thinca/vim-localrc'

" themes - colourtokens
Plugin 'rakr/vim-one'
Plugin 'chriskempson/base16-vim'

" metrics
Plugin 'wakatime/vim-wakatime'

" repl
Plugin 'jpalardy/vim-slime'

" status
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'

" crazies
Plugin 'ashisha/image.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" indentation stuff
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" quirks
set backspace=2 " make backspace work like most other apps

set complete+=k " dictionary autocomplete
set completeopt-=preview " disable preview window

set number " view line numbers
set ruler " view current position
highlight LineNr ctermfg=grey

set listchars=tab:▸▸,trail:~ " nicer whitespace chars
set list " show whitespace
set mouse=nv " allow mouse

" skip backup & swap files
set nobackup
set nowritebackup
set noswapfile

" save readonly files with sudo using w!!
cmap w!! %!sudo tee > /dev/null %

set exrc " allow per folder configs
set secure " disallow dangerous commands in per folder configs

syntax enable
set background=dark

" safely set colorscheme
try
  " colorscheme one
  colorscheme base16-default-dark
catch
endtry
if (has("termguicolors"))
  set termguicolors
endif

hi Normal guibg=black

" custom key mappings

" fuzzy-finder
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>hc :History:<CR>
nnoremap <leader>hs :History/<CR>

" navigation

" windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" last two files
nnoremap <leader><leader> <C-^>

" general
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' " expand %% to current dir
vnoremap <C-c> "+y " use os copy shortcut
let mapleader=","
map <leader>g :Ack<space>
map <leader>r :source ~/.vimrc<CR>
map <leader>e :e ~/.vimrc<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>

" repeat last command with the same params
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" formatting
map <leader>pj :%!jq '.'<CR>
map <leader>px :%!xmllint --format -<CR>

" open new split panes to right and bottom
set splitbelow
set splitright

" do not redraw screen in the middle of a macro
set lazyredraw

" smart search
set ignorecase
set smartcase
set incsearch

" case intelligent auto complete
set infercase

set hls " highlight search results
nnoremap <space> :let @/ = ""<CR><space> " clear last used search pattern

set pastetoggle=<f5>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/log,*/logs,tags,*/.nyc_output,*/lcov-report,*/.cache-loader,*/.webpack,*/.serverless
set wildmenu
set wildmode=full

set history=200 " increase command history
set laststatus=2

" folds
set foldmethod=syntax
set foldlevel=20

" ctags
nnoremap <f5> :!ctags -R<CR>

" quick-fix
nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <leader>x :cclose<CR>

" code navigation
nnoremap <leader>cd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>cr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ts :TsuSearch

" linting
nnoremap <leader>ln :ALENext<CR>
nnoremap <leader>lp :ALEPrevious<CR>
nnoremap <leader>lt :ALEToggle<CR>
nnoremap <leader>lf :ALEFix<CR>

" plugins

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntastic
" disable linting
let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = []
let g:syntastic_typescript_checkers = []

" typecript
" let g:tsuquyomi_disable_quickfix = 1

" haskell
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_in = 0
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2

" ale
let g:ale_linters = {
  \'javascript': ['prettier'],
  \'typescript': ['tsuquyomi', 'tslint'],
  \'python': ['flake8']
\}
let g:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
  \'javascript': ['standard'],
  \'typescript': ['tslint'],
  \'python': ['autopep8', 'isort']
\}
let g:ale_lint_on_text_changed = 'always'
" let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

" prettier
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1

" youcompleteme
let g:ycm_key_list_select_completion = []

" slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_dont_ask_default = 1

" sql
let g:dbext_default_profile_localhost = 'type=MYSQL:user=root:passwd=root:port=3306:host=localhost'
let g:dbext_default_profile = 'localhost'
let g:sqlutil_align_where = 0
let g:sqlutil_align_comma = 1

" lightline
let g:lightline = { 'colorscheme': 'one' }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [
      \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \ [ 'lineinfo' ],
      \ [ 'percent' ],
      \ [ 'fileformat', 'fileencoding', 'filetype' ],
      \ ] }
" lightline ale icons
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

let g:terraform_fmt_on_save=1

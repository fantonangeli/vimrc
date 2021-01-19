" GENERAL CONFIGS {{{

set nocompatible
syntax on
"set nowrap
set wrap linebreak nolist
set encoding=utf8
" set guifont=DroidSansMono_NF:h10:cANSI:qDRAFT
set guifont=FuraMono_NF:h10:cANSI:qDRAFT
set ffs=unix,dos

"Language
language en_US

set undofile
set undodir=~/.vim/undo

set wildignore+=*.o,*.obj,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.woff,*.eof,*.woff2,*.ttf,*.doc,*.docx,*.pdf,node_modules/**,bower_components/**,.git/**,package-lock.json,build/**,dist/**,backstop_data/**

"highlight all occurrence of a selected word
set hlsearch

set incsearch "Incremental search

set nofoldenable    " disable folding. 'zi' to toggle

"set visualbell	" Use visual bell (no beeping)

set showcmd

"increment 0X numbers as decimals
set nrformats-=octal

"preserve my cursor position within a line when switching buffers
autocmd BufEnter * silent! normal! g`"

"Switch buffers in vim without saving to a currently modified file
:set hidden

"case sensitive search
" :set ic

"To allow backspacing over everything in insert mode (including automatically inserted indentation, line breaks and start of insert)
:set backspace=indent,eol,start

"Setting 'scrolloff' to a large value causes the cursor to stay in the middle line when possible:
:set so=999
"To restore normal behavior, enter:
":set so=0

" "vim put swap files in a special location instead of the working directory of the file being edited
set directory=~/.vim/swap

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace

if has("win32")
    "Clipboard
    set clipboard=unnamed

    " grep program
    set grepprg=$HOME\Desktop\standalone\cygwin\bin\grep.exe\ -n\ $*
else
    "Clipboard
    set clipboard=unnamedplus

    " grep program
    set grepprg=grep\ -n\ $*
endif

" }}}

" VIM-PLUG CONFIGURATION {{{

call plug#begin('~/.vim/plugged')

" Utility 
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab' "allows you to use <Tab> for all your insert completion needs
Plug 'schickling/vim-bufonly'
" Plug 'wesQ3/vim-windowswap'
Plug 'MarcWeber/vim-addon-mw-utils' "required by vim-snipmate
Plug 'tomtom/tlib_vim' "required by vim-snipmate
Plug 'garbas/vim-snipmate'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-dispatch'
" Plug 'rhysd/devdocs.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'drmikehenry/vim-fontsize' "Adjust font size via keypresses
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-abolish'

" Plug 'ajh17/VimCompletesMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Generic Programming Support 
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale' "Check syntax in Vim asynchronously
" Plug 'maximbaz/lightline-ale' "ALE indicator for the lightline vim plugin.
Plug 'Chiel92/vim-autoformat'
Plug 'maksimr/vim-jsbeautify'
Plug 'metakirby5/codi.vim'


" Markdown / Writting

" Git Support
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' "lightweight and powerful git branch viewer that integrates with fugitive
Plug 'idanarye/vim-merginal'
Plug 'mhinz/vim-signify'

" PHP Support
"Plug 'phpvim/phpcd.vim'
"Plug 'tobyS/pdv'

" Theme / Interface
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline' "provides bufferline functionality for the lightline
" Plug 'sjl/badwolf'
" Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
" Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
" Plug 'junegunn/limelight.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'romainl/Apprentice'
" Plug 'Lokaltog/vim-distinguished'
" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'AlessandroYorba/Sierra'
Plug 'daylerees/colour-schemes'
" Plug 'effkay/argonaut.vim'
" Plug 'ajh17/Spacegray.vim'
" Plug 'atelierbram/Base2Tone-vim'
Plug 'colepeters/spacemacs-theme.vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'

" Javascript
Plug 'heavenshell/vim-jsdoc'
" Plug 'othree/jsdoc-syntax.vim'
" Plug 'ternjs/tern_for_vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'leafgarland/typescript-vim'
" Plug 'agarrharr/consolation-vim'

"HTML
" Plug 'Valloric/MatchTagAlways'  "too slow

"Typo3
" Plug 'elmar-hinz/vim.typoscript'

" JSON
Plug 'vim-scripts/JSON.vim'




call plug#end()
" }}}

" FILETYPE SPECIFIC CONFIGS {{{

" VIMRC
augroup vimrc
    au!
    au BufNewFile,BufRead vimrc setlocal foldmethod=marker
augroup END

" SCSS
augroup scss
    au!
    au BufNewFile,BufRead *.scss setlocal filetype=scss
augroup END

" SASS
augroup sass
    au!
    au BufNewFile,BufRead *.sass setlocal filetype=sass
augroup END

" HTML
augroup html
    au!
    au BufNewFile,BufRead *.html setlocal filetype=html
augroup END

" json
augroup json
    au!
    au BufNewFile,BufRead *.json setlocal filetype=json
augroup END

" Javascript
augroup javascript
    au!
    au BufNewFile,BufRead *.gs,*.js setlocal filetype=javascript
augroup END

" typescript
augroup typescript
    au!
    au BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END

" }}}

" MAPPINGS CONFIGURATIONN {{{
"
" map <C-m> :TagbarToggle<CR>
" noremap <C-m> :CtrlPFunky<CR>


" Mapping selecting Mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)

" Vim-Test Mappings
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" Vim-PDV Mappings
" autocmd FileType php inoremap <C-p> <ESC>:call pdv#DocumentWithSnip()<CR>i
" autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})" }}}

" MY CMD {{{
"Windows commands
if has("win32")
    command Vimrc e $HOME\.vim\vimrc\vimrc | setfiletype vim
    command JsSnips e $HOME\.vim\snippets\javascript.snippets
    command HtmlSnips e $HOME\.vim\snippets\html.snippets
    command TsSnips e $HOME\.vim\snippets\typescript.snippets
"Linux commands
else
    command Vimrc e $HOME/.vim/vimrc/vimrc | setfiletype vim
    command JsSnips e $HOME/.vim/snippets/javascript.snippets
    command HtmlSnips e $HOME/.vim/snippets/html.snippets
    command TsSnips e $HOME/.vim/snippets/typescript.snippets

    autocmd SessionLoadPost * silent !master-notify.sh & xterm &
endif

command WriteRandomNum :r! echo $RANDOM
command Time put =strftime('%Y-%m-%d %H:%M')
command PutTodoText :normal Vp$xxx^df:x0dw
command TODOS VGFE "(TODO\|BUG)" 
command -nargs=1 VGALL VG <args> *
command JsExec :w !node
command GPOG :Gpush origin | Gpush github

" Grep commands
command -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts,json}
command -nargs=1 VG grep -R --exclude-dir={bower_components,node_modules,.git,dist,build,backstop_data}* --exclude="package-lock.json" -E <args> | copen | cc1 | ex

" Vimgrep commands
" command -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts}
" command -nargs=1 VG noautocmd vimgrep <args> | copen | cc1 | ex


command -nargs=1 SFT setfiletype <args>
command ThisFunctions /this\.\w\+\s*=\s*function
command Backtick :normal a``
command Tilde :normal a~
command -nargs=1 TSF tabnew | setfiletype <args> 

" Windows
command Explorer !start explorer %:p:h:gs?\/?\\\\\\?
command Cmd !start cmd
command Cygwin !silent C:\cygwin64\bin\mintty.exe

" Linux
command Dolphin silent !dolphin "%:p:h" &
command Xterm silent !xterm &
command Meld silent !meld . &

command U UndotreeToggle 
command PU PlugUpdate 
command Spell setlocal spell spelllang=en_us<CR>
command SpellOff set nospell<CR>
command CopyFileRelPath let @+=expand("%:.")
command CopyFileFullPath let @+=expand("%:p")
" command -nargs=1 OS OpenSession <args> | Cmd

"MY JsBeautify CMD
command JsBeautify call JsBeautify()
command JsonBeautify call JsonBeautify()
command JsxBeautify call JsxBeautify()
command HtmlBeautify call HtmlBeautify()
command CSSBeautify call CSSBeautify()

"Overwrite a class from "c changing the name to the current one 
command OverClass exe 'normal G"cpgg/classwyenwvepNNjva{Voggd'

"Overwrite an angular component from "c changing the name to the current one 
command OverComponent exe 'normal gg/@Component(f{ya"vya{:OverClass/@Component(f{va{"vp'


"show environments diff
command EnvDiff e src/environments/environment.ts | vert diffsplit src/environments/environment.prod.ts

"Git stage everyting and open Gstatus
command GA :wa | :Git add . | :G
command F :Flog
command M :Merginal

"MY KEYS---------------------------------------------------------- 

"Switch between Vim window splits easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


"save
nnoremap <c-s> :update<cr>
inoremap <c-s> <Esc>:update<cr>


"Move entire line up and down in Vim
noremap <c-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-down> ddp
" map <C-d> :bd<CR>
" noremap <C-c> :TComment<CR>

"Switching buffers 
nnoremap <C-PageUp> :bp<cr>
inoremap <C-PageUp> <Esc>:bp<cr>
nnoremap <C-PageDown> :bn<cr>
inoremap <C-PageDown> <Esc>:bn<cr>

"quickfix
map <C-j> :cn<cr>
map <C-k> :cp<cr>



"With leader-------------

nnoremap <Leader>P :CtrlP<Cr>

"CtrlPFunky
nnoremap <Leader>f :CtrlPFunky<Cr>
"select function
nnoremap <Leader>vf va{V<Cr>
"copy function
nnoremap <Leader>yf va{Vy<Cr>
"copy all 
nnoremap <Leader>ya ggVGy'.<cr>
"paste+indent
nnoremap <Leader>p p=`]<cr>
"paste before+indent
nnoremap <Leader>P P=`]<cr>
"paste over all
nnoremap <Leader>pa ggVGp<cr>
"close buffer
nnoremap <Leader>d :bd<CR>

"save current buffer
" nnoremap <Leader>s :update<cr>
" inoremap <Leader>s <Esc>:update<cr>

"TComment
noremap <Leader>c :TComment<CR>

" }}}

" PLUGINS SETTINGS {{{

" Colorscheme{{{
    "
" colorscheme holokai
" colorscheme spacegray
colorscheme solarized8_light
" colorscheme spacemacs-theme

" }}}

" Spacegray  {{{
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
" }}}

" Lightline {{{

" lightline with ALE
" let g:lightline = {
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' },
"       \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
"       \   'right': [ [ 'lineinfo' ],
"       \              [ 'percent' ],
"       \              [ 'fileformat', 'fileencoding', 'filetype'],[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ 'component_expand': {
"       \  'buffers': 'lightline#bufferline#buffers',
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ },
"       \ 'component_type': {
"       \     'buffers': 'tabsel',
"       \     'linter_checking': 'right',
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'right',
"       \ }
"       \ }

" lightline without ALE
let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type': {'buffers': 'tabsel'},
      \ }
set showtabline=2
" }}}

" Vim-Supertab Configuration {{{
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" coc.nvim config {{{
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" }}}

" CtrlP config {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
" }}} 

" vim-snipmate config {{{
let g:snipMate = { 'snippet_version' : 1 } "parser versio" }}}

" jsdoc {{{
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
"}}}

" ALE {{{
let g:ale_fixers = ['prettier', 'eslint']

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

set omnifunc=ale#completion#OmniFunc
"}}}

" gutentags {{{
set tags=./.tags,.tags
let g:gutentags_ctags_tagfile=".tags"
let g:gutentags_ctags_exclude = ['bower_components', 'node_modules', 'build', 'dist']
" }}}

" CtrlP {{{
let g:ctrlp_extensions = ['tag']

"ctrlp ignore node_modules
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git\|dist\|backstop_data'
" }}}

" vim-session {{{
let g:session_autosave = 'yes'
let g:session_command_aliases = 1
let g:session_default_to_last= 1
let g:session_autoload = 'no'
" }}}

" }}}

" UNUSED PLUGINS SETTINGS {{{

" Syntastic Configuration {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" " let g:syntastic_check_on_wq = 0
" "
" let g:syntastic_javascript_checkers = ['eslint']
" }}}

" Tagbar {{{
" let g:tagbar_autofocus=1
" }}}

" }}}


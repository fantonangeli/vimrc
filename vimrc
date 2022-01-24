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

set wildignore+=*.o,*.obj,*.bak,*.exe,*.svg,*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.woff,*.eof,*.woff2,*.ttf,*.doc,*.docx,*.pdf,node_modules/**,bower_components/**,.*/**,yarn.lock,package-lock.json,build/**,dist/**,backstop_data/**

"highlight all occurrence of a selected word
set hlsearch

set incsearch "Incremental search

" set nofoldenable    " disable folding. 'zi' to toggle
set foldmethod=indent
set foldlevel=20

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
set tabstop=4   "number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4	"number of space characters inserted for indentation
set smarttab	"affects how <TAB> key presses are interpreted depending on where the cursor is
set expandtab   "To insert space characters whenever the tab key is pressed

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Automatically change the current directory
" set autochdir

" Theme and Styling 
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

set timeoutlen=3000 "make vim leader key persist for longer

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
" Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab' "allows you to use <Tab> for all your insert completion needs
Plug 'schickling/vim-bufonly'
" Plug 'wesQ3/vim-windowswap'
" Plug 'MarcWeber/vim-addon-mw-utils' "required by vim-snipmate
" Plug 'tomtom/tlib_vim' "required by vim-snipmate
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-dispatch'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'drmikehenry/vim-fontsize' "Adjust font size via keypresses
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'
Plug 'chrisbra/Recover.vim' "adds a diff option when Vim finds a swap file

" Theme / Interface
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline' "provides bufferline functionality for the lightline
" Plug 'daylerees/colour-schemes'
" Plug 'colepeters/spacemacs-theme.vim'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'

" Generic Programming Support 
Plug 'tomtom/tcomment_vim'

" Develop profile
if g:profile == "develop"
    " Utility
    Plug 'tpope/vim-abolish'
    Plug 'vim-test/vim-test' "Vim wrapper for running tests on different granularities
    Plug 'rhysd/devdocs.vim'

    " Coc 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} "Html language server extension for coc.nvim
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} "neoclide/coc-json
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'} "Css language server extension for coc.nvim
    Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'} "Snippets solution for coc.nvim
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} "Tsserver language server extension for coc.nvim
    Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'} "markdownlint extension for coc.nvim
    Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'} "client for TabNine, the all-language autocompleter
    Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'} "Yaml language server extension for coc.nvim

    " Generic Programming Support 
    Plug 'honza/vim-snippets'
    Plug 'Townk/vim-autoclose'
    Plug 'dense-analysis/ale' "Check syntax in Vim asynchronously
    Plug 'maximbaz/lightline-ale' "ALE indicator for the lightline vim plugin.
    Plug 'Chiel92/vim-autoformat'
    Plug 'maksimr/vim-jsbeautify' "This extension allows you to use jsbeautifier inside vim
    Plug 'metakirby5/codi.vim' "an interactive scratchpad for hackers, with a similar interface to Numi


    " Markdown / Writting

    " Git Support
    Plug 'tpope/vim-fugitive'
    Plug 'rbong/vim-flog' "lightweight and powerful git branch viewer that integrates with fugitive
    Plug 'idanarye/vim-merginal'
    Plug 'mhinz/vim-signify' "Signify (or just Sy) uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)

    " PHP Support
    "Plug 'phpvim/phpcd.vim'
    "Plug 'tobyS/pdv'

    " Javascript
    Plug 'heavenshell/vim-jsdoc', {
                \ 'for': ['javascript', 'javascript.jsx','typescript'],
                \ 'do': 'make install'
                \}
    " Plug 'ternjs/tern_for_vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty' "The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file
    " Plug 'agarrharr/consolation-vim'

    "Typo3
    " Plug 'elmar-hinz/vim.typoscript'

    " JSON
    Plug 'vim-scripts/JSON.vim'

endif



call plug#end()
" }}}

" FILETYPE SPECIFIC CONFIGS {{{

" VIMRC
augroup vimrc
    au!
    au BufNewFile,BufRead vimrc setlocal foldmethod=marker
augroup END

" BASH
augroup bash
    au!
    au BufNewFile,BufRead *.sh setlocal filetype=bash
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
    au BufNewFile,BufRead *.json,.eslintrc setlocal filetype=json
augroup END

" Javascript
augroup javascript
    au!
    au BufNewFile,BufRead *.gs,*.js setlocal filetype=javascript
    au BufNewFile,BufRead *.gs,*.js let g:jsdoc_formatter = 'jsdoc'
augroup END

" typescript
augroup typescript
    au!
    au BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript tabstop=2 shiftwidth=2 softtabstop=0 expandtab 
    au BufNewFile,BufRead *.ts,*.tsx let g:jsdoc_formatter = 'tsdoc'
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
if has("win32")
    "Windows commands
    command Vimrc e $HOME\.vim\vimrc\vimrc | setfiletype vim
    command JsSnips e $HOME\.vim\snippets\javascript.snippets
    command HtmlSnips e $HOME\.vim\snippets\html.snippets
    command TsSnips e $HOME\.vim\snippets\typescript.snippets

    command Explorer !start explorer %:p:h:gs?\/?\\\\\\?
    command Cmd !start cmd
    command Cygwin !silent C:\cygwin64\bin\mintty.exe
else
    "Linux commands
    command Vimrc e $HOME/.vim/vimrc/vimrc | setfiletype vim
    command JsSnips e $HOME/.vim/snippets/javascript.snippets
    command HtmlSnips e $HOME/.vim/snippets/html.snippets
    command TsSnips e $HOME/.vim/snippets/typescript.snippets

    command Dolphin silent !dolphin "%:p:h" &
    command Nautilus silent !nautilus "%:p:h" &
    command Xterm silent !xterm &
    command Gterm silent !gnome-terminal --working-directory="%:p:h" &
    command Konsole silent !konsole &
    command Yakuake silent !yakuake &
    command Meld silent !meld . &
    command Gitg silent !gitg &
endif

command WriteRandomNum :r! echo $RANDOM
command Time :normal a<C-R>=strftime('%F %H:%M:%S')<CR>
command Date :normal a<C-R>=strftime('%F')<CR>
command PutTodoText :normal Vp$xxx^df:x0dw
command JsExec :w !node
command EditSessionConfig execute 'edit' xolox#session#name_to_path(xolox#session#find_current_session()."x")

" Grep commands
"search in current project
command -nargs=1 VG grep -R --exclude-dir={bower_components,node_modules,dist,build,backstop_data,.}* --exclude="*.prod.js*" --exclude=".*" --exclude="yarn.lock" --exclude="package-lock.json" --exclude="*.svg" --exclude="*-bundle.js" --exclude="*-bundle.js" --exclude="*.js.map" -E <args> | call OpenQuickfix()
"execute VG only on frontend files
command -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts,json,tsx}
"find current word in the project
command VGWord :normal yiw:VG <c-r>"<cr>
"search and list all TODOS, BUGS, FIXME
command TODOS VGFE 'TODO\|BUG\|FIXME '
command TODOSBUFFERS call TodosBuffers()
"search this file in the project
command FindThisFile VG %:t

" Vimgrep commands
" command -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts}
" command -nargs=1 VG noautocmd vimgrep <args> | copen | cc1 | ex

command! Difft windo diffthis
command! Diffo windo diffoff

command -nargs=1 SFT setfiletype <args>
command ThisFunctions /this\.\w\+\s*=\s*function
command Backtick :normal a``
command Tilde :normal a~
command -nargs=1 TSF tabnew | setfiletype <args> 


command UpdateAll PlugUpgrade | PlugUpdate
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

"remove console.something()
command RemoveConsoleSomething :%s/.*console\.\w\+(.*\n//gc

"paste in a todo comment
command PasteInTodo exe 'normal O/* TODO: pA */'

"Subvert "f to "t
command -range AutoSubvert exe '<line1>,<line2>:Subvert/'.getreg("f").'/'.getreg("t").'/gc'

"show environments diff
command EnvDiff e src/environments/environment.ts | vert diffsplit src/environments/environment.prod.ts

"Git stage everyting and open Gstatus
command! GA :wa | sleep 1 | Git add . | G
command! -nargs=* F :Git fetch | Flog -all <args>
command! FL :F -date=local
command M :Merginal
"Write a commit from a yanked todo
command! CommitFromTODO exe 'normal VpV<ESC>:s/.*\(TODO\|FIXME\): \(.*\)\*\//\2/'


" }}}

"MY KEYS {{{

"Use gx with firefox instead the default wget
nmap gx :silent execute "!firefox " . shellescape("<cWORD>")<CR>

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
map <C-k> :cp<cr>"}}}

"MY LEADER KEYS{{{

nnoremap <Leader>P :CtrlP<Cr>

"CtrlPFunky
nnoremap <Leader>f :CtrlPFunky<Cr>
"select function
nnoremap <Leader>vf va{V<Cr>
"select function with jsdoc
nnoremap <Leader>vjf va{o?\/\*\*Vk<Cr>
"copy function
" nnoremap <Leader>yf va{Vy<Cr>
nnoremap <Leader>yf va{o?\/\*\*Vky<Cr>
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
"undotree
nnoremap <Leader>u :UndotreeToggle<CR>
" Git push
nnoremap <Leader>gps :Git push<CR>
" Git pull
nnoremap <Leader>gpl :Git pull<CR>
" Lint
nnoremap <Leader>l :call Lint()<CR>
" ALEHover
nnoremap <Leader>ah :ALEHover<CR>
" ALEPrev
nnoremap <Leader>ap :ALEPrevious<CR>
" ALENext
nnoremap <Leader>an :ALENext<CR>
" ALEFix
nnoremap <Leader>af :ALEFix<CR>
" ALEToggle
nnoremap <Leader>at :ALEToggle<CR>
" ALEToggle twice
nnoremap <Leader>a2t :ALEToggle \| ALEToggle<CR>
" ALEGoToDefinition
nnoremap <Leader>gd :ALEGoToDefinition<CR>
" ALEDetail
nnoremap <Leader>ad :ALEDetail<CR>
" ALEOrganizeImports
nnoremap <Leader>ao :ALEOrganizeImports \| sleep 1 \| ALEFix<CR>
" write param type
nnoremap <Leader>pt yiw/<C-r>":\s\?\w\+veeeyvep
" JsDoc
nnoremap <Leader>jd :JsDoc<CR>
" write param doc
nnoremap <Leader>jp 0f}wye/\* @param .*} <C-r>" <cr>yyVp<cr>
" search with google
vnoremap <Leader>sg "gy<Esc>:call GoogleSearch()<CR>
" search with DevDocs
vnoremap <Leader>sd "gy<Esc>:call DevDocsSearch()<CR>

" vim-test
nnoremap <Leader>tn :w \| TestNearest<CR>
nnoremap <Leader>tf :w \| TestFile<CR>
nnoremap <Leader>ts :wa \| TestSuite<CR>
nnoremap <Leader>tl :w \| TestLast<CR>


"save current buffer
" nnoremap <Leader>s :update<cr>
" inoremap <Leader>s <Esc>:update<cr>

"TComment
noremap <Leader>c :TComment<CR>"}}}

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
let g:lightline = {
      \ 'tabline': {'left': [['buffers']], 'right': [['tabs']]},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'],[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
      \ }

" lightline without ALE
" let g:lightline = {
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' },
"       \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
"       \ 'component_type': {'buffers': 'tabsel'},
"       \ }
set showtabline=2
" }}}

" Vim-Supertab Configuration {{{
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" coc.nvim config {{{
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_user_config = {     
    \'diagnostic.displayByAle': v:true,
    \'snippets.extends': {
        \'typescript': ['javascript']
        \}
\}
" }}}

" CtrlP config {{{
let g:ctrlp_cmd = 'CtrlPCurWD'
" }}} 

" vim-snipmate config {{{
" let g:snipMate = { 'snippet_version' : 1 } "parser version 
" }}}

" jsdoc {{{
" let g:jsdoc_allow_input_prompt = 1
" let g:jsdoc_input_description = 1
" let g:jsdoc_enable_es6 = 1
" let g:jsdoc_return = 1
" let g:jsdoc_formatter = 'jsdoc'
"}}}

" ALE {{{
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_set_highlights=0 "When this option is set to `1`, highlights will be set for problems.
let g:ale_lint_on_enter = 0 "When this option is set to `1`, the |BufWinEnter| and |BufRead| events will be used to apply linters when buffers are first opened

" use eslint_d
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

" use the quickfix list instead of the loclist
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

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
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|build\|dist\|backstop_data'
" }}}

" vim-session {{{
let g:session_autosave = 'yes'
let g:session_command_aliases = 1
let g:session_default_to_last= 1
let g:session_autoload = 'no'

if has("unix")
    autocmd SessionLoadPost * silent !master-notify.sh & 
endif

" }}}

" vim-merginal {{{
let g:merginal_windowWidth=90
" }}}

" }}}

" FUNCTIONS {{{

" lint code and open location list with mappings
function! Lint()
    ALELint
    lopen 25
    map <C-j> :lnext<cr>
    map <C-k> :lprev<cr>
    nnoremap <Leader>x :lcl<Cr>
endfunction

" open quickfix with mappings
function! OpenQuickfix()
    copen
    cc1
    ex
    map <C-j> :cn<cr>
    map <C-k> :cp<cr>
    nnoremap <Leader>x :ccl<Cr>
endfunction

" search with google
function! GoogleSearch()
     let searchterm = getreg("g")
     silent! exec "silent! !firefox --new-window \"http://google.com/search?q=" . searchterm . "\" &"
endfunction

" search with devdocs
function! DevDocsSearch()
     let searchterm = getreg("g")
     silent! exec "DevDocs " . searchterm 
endfunction

" search TODOS in all open buffers
function! TodosBuffers()
    " bufdo :args ## %
    " vimgrep TODO\|BUG\|FIXME ##
    cexpr []
    bufdo vimgrepadd TODO\|BUG\|FIXME %
    call OpenQuickfix()
endfunction

" }}}


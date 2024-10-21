" GENERAL CONFIGS {{{

set nocompatible
syntax on
syntax sync minlines=10000 " fixes syntax highlighting breaks for big file after jump or search
"set nowrap
set wrap linebreak nolist
set encoding=utf8
set ffs=unix,dos

"Language
language en_US

set undofile
set undodir=~/.vim/undo

set wildignore+=*.o,*.obj,*.bak,*.exe,*.svg,*.jpg,*.jpeg,*.png,*.gif,*.tiff,*.woff,*.eof,*.woff2,*.ttf,*.doc,*.docx,*.pdf,node_modules/**,bower_components/**,.*/**,yarn.lock,package-lock.json,build/**,dist/**,backstop_data/**,*/target/*

"highlight all occurrence of a selected word
set hlsearch

set incsearch "Incremental search

" set nofoldenable    " disable folding. 'zi' to toggle
set foldmethod=indent
set foldlevel=20

set visualbell	" Use visual bell (no beeping)

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

"ignore all white space in diff mode
set diffopt+=iwhiteall

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
" Plug 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope 
" Plug 'ervandew/supertab' "allows you to use <Tab> for all your insert completion needs
Plug 'schickling/vim-bufonly' "Delete all the buffers except the current buffer.
" Plug 'wesQ3/vim-windowswap' "Swap your windows without ruining your layout 
" Plug 'MarcWeber/vim-addon-mw-utils' "required by vim-snipmate
" Plug 'tomtom/tlib_vim' "required by vim-snipmate
" Plug 'ctrlpvim/ctrlp.vim' "Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "A command-line fuzzy finder
Plug 'junegunn/fzf.vim' "fzf 4 vim
" Plug 'tpope/vim-dispatch' "dispatch.vim: Asynchronous build and test dispatcher
Plug 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session' "Extended session management
Plug 'drmikehenry/vim-fontsize' "Adjust font size via keypresses
Plug 'mbbill/undotree' "The undo history visualizer for VIM
" Plug 'ludovicchabant/vim-gutentags' "A Vim plugin that manages your tag files 
Plug 'chrisbra/Recover.vim' "adds a diff option when Vim finds a swap file

" Theme / Interface
Plug 'itchyny/lightline.vim' "A light and configurable statusline/tabline plugin
Plug 'mengelbrecht/lightline-bufferline' "provides bufferline functionality for the lightline
" Plug 'daylerees/colour-schemes' "Colour schemes for a variety of editors
" Plug 'colepeters/spacemacs-theme.vim' "Spacemacs-flavoured colorscheme for Vim and iTerm 
Plug 'flazz/vim-colorschemes' "one colorscheme pack to rule them all! 
Plug 'xolox/vim-colorscheme-switcher' "Makes it easy to quickly switch between color schemes
Plug 'sainnhe/everforest' "Comfortable & Pleasant Color Scheme for Vim 
Plug 'lifepillar/vim-solarized8' "Solarized colorschemes

" Generic Programming Support 
Plug 'tomtom/tcomment_vim' "An extensible & universal comment vim-plugin that also handles embedded filetypes

" Develop profile
if g:profile == "develop"
    " Utility
    Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'nicwest/vim-camelsnek' "Convert between camel and snek case
    Plug 'vim-test/vim-test' "Vim wrapper for running tests on different granularities
    Plug 'rhysd/devdocs.vim' "This is a Vim plugin for devdocs

    " Coc 
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Custom popup menu with snippet support
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'} "Html language server extension for coc.nvim
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'} "neoclide/coc-json
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'} "Css language server extension for coc.nvim
    Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'} "Snippets solution for coc.nvim
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} "Tsserver language server extension for coc.nvim
    Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'} "markdownlint extension for coc.nvim
    Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'} "client for TabNine, the all-language autocompleter
    Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'} "Yaml language server extension for coc.nvim
    " Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'} "Java language server extension for coc.nvim

    " Generic Programming Support 
    Plug 'honza/vim-snippets' "snippets files for various programming languages
    Plug 'mlaursen/vim-react-snippets' "A collection of common Javascript and Typescript vim snippets for developing React applications
    Plug 'dense-analysis/ale' "Check syntax in Vim asynchronously
    Plug 'maximbaz/lightline-ale' "ALE indicator for the lightline vim plugin.
    Plug 'Chiel92/vim-autoformat' "Format code with one button press (or automatically on save)
    Plug 'maksimr/vim-jsbeautify' "This extension allows you to use jsbeautifier inside vim
    " Plug 'metakirby5/codi.vim' "an interactive scratchpad for hackers, with a similar interface to Numi
    Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.


    " Markdown / Writting

    " Git Support
    Plug 'tpope/vim-fugitive'  "A Git wrapper so awesome, it should be illegal 
    Plug 'rbong/vim-flog' "lightweight and powerful git branch viewer that integrates with fugitive
    Plug 'idanarye/vim-merginal' "nice interface for dealing with Git branches
    Plug 'mhinz/vim-signify' "Signify (or just Sy) uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)
    Plug 'ruanyl/vim-gh-line' "opens a link to the current line on GitHub 

    " PHP Support
    "Plug 'phpvim/phpcd.vim'
    "Plug 'tobyS/pdv' "PHP Documentor for VIM - Generates PHP docblocks 

    " Javascript
    Plug 'heavenshell/vim-jsdoc', {
                \ 'for': ['javascript', 'javascript.jsx','typescript'],
                \ 'do': 'make install'
                \} "Generate JSDoc to your JavaScript code. 
    " Plug 'ternjs/tern_for_vim' "Tern plugin for Vim
    " Plug 'tacahiroy/ctrlp-funky' "A super simple function navigator for ctrlp.vim 
    Plug 'leafgarland/typescript-vim' "Syntax file and other settings for TypeScript
    Plug 'maxmellon/vim-jsx-pretty' "The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file
    " Plug 'agarrharr/consolation-vim' "A vim plugin for JavaScript to console.log out whatever you have in the register. 

    "Typo3
    " Plug 'elmar-hinz/vim.typoscript' "Syntax highlighting for the unbeatable vim text editor

    " JSON
    Plug 'vim-scripts/JSON.vim' "A syntax highlighting file for JSON

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
    au BufNewFile,BufRead *.sh,*.bats setlocal filetype=bash
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
    au BufNewFile,BufRead *.ts setlocal filetype=typescript tabstop=2 shiftwidth=2 softtabstop=0 expandtab 
    au BufNewFile,BufRead *.ts let g:jsdoc_formatter = 'tsdoc'
augroup END

" typescript tsx
augroup typescripttsx
    au!
    au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx tabstop=2 shiftwidth=2 softtabstop=0 expandtab 
    au BufNewFile,BufRead *.tsx let g:jsdoc_formatter = 'tsdoc'
augroup END

augroup jenkins
    au!
    au BufNewFile,BufRead *.jenkinsfile,*.Jenkinsfile,Jenkinsfile,jenkinsfile,Jenkinsfile.* setf groovy
augroup END

" noundo
augroup noundo txt
    au!
    au BufNewFile,BufRead *.noundo.txt setlocal noundofile
augroup END

" Apply custom cursor color only in dark mode
augroup MyColors
    autocmd!
    autocmd ColorScheme * if &background == "dark" | highlight iCursor guifg=bg guibg=green | endif
    autocmd ColorScheme * if &background == "light" | highlight iCursor guifg=bg guibg=#943A20 | endif
augroup END

" }}}

" MAPPINGS CONFIGURATIONN {{{
"
" map <C-m> :TagbarToggle<CR>
" noremap <C-m> :CtrlPFunky<CR>


" FZF current project
" nnoremap <c-l> :execute 'GFiles '.getcwd()<CR>
nnoremap <c-p> :FZF<CR>
nnoremap <c-l> :call fzf#run(fzf#wrap({'source': 'git ls-files', 'options': '--multi'}))<CR>

" Mapping selecting Mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

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
    command Gterm silent !GNOME_TERMINAL_SCREEN="" gnome-terminal --working-directory="%:p:h" &
    command Konsole silent !konsole &
    command Yakuake silent !yakuake &
    command Meld silent !meld . &
    command Gitg silent !gitg &
endif

command WriteRandomNum :r! echo $RANDOM
command Time :normal a<C-R>=strftime('%F %H:%M:%S')<CR>
command Date :normal a<C-R>=strftime('%F')<CR>
command PutTodoText :normal Vp$xxx^df:x0dw
command PutPRComment :normal iFixes comment: p:x<CR>
command JsExec :w !node
command EditSessionConfig execute 'edit' xolox#session#name_to_path(xolox#session#find_current_session()."x")
command! Json2yaml execute 'r ! echo -e | yq -p j -o y '.shellescape(@",1)
command! FileOpenInNewWindow !gvim % &
command! GotoFileAtPosition call GotoFileAtPosition() 
command! ShowCursor highlight iCursor guifg=red guibg=green

" Grep commands
"search in current project
command! -nargs=1 VG execute 'grep -IR --exclude-dir={bower_components,node_modules,dist,build,backstop_data,target,.}* --exclude={*.prod.js*,.*,yarn.lock,package-lock.json,pnpm-lock.yaml,graph.dot,*.svg,*-bundle.js,*.js.map,*.base64png} '. get(g:, 'vg_grep_extra_options', '') .' -P ' . <q-args> . ' | call OpenQuickfix()'
"execute VG only on frontend files
command! -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts,json,tsx}
"execute VG only on typescript files
command! -nargs=1 VGTS VG <args> --include=*.{ts,tsx}
"find current word in the project
command VGWord :normal yiw:VG <c-r>"<cr>
"find current word in typescript files, showing only exports
command! FindExports :normal yiw:VGTS export.*\\W<c-r>"\\W<cr>
"find current word in typescript files, showing only imports
command! FindImports :normal yiw:VGTS import.*\\W<c-r>"\\W.*from<cr>
"search with git grep
command! -nargs=1 GG Ggrep -Ir -E <q-args> | call OpenQuickfix()
"search and list all TODOS, BUGS, FIXME
command TODOS VGFE 'TODO\|BUG\|FIXME'
command TODOSBUFFERS call TodosBuffers()
command! PRFindDirtyLines VGFE 'TODO\|BUG\|FIXME\|console\.log\|debugger;'
"search this file in the project
command FindThisFile VG %:t

" Vimgrep commands
" command -nargs=1 VGFE VG <args> --include=*.{html,js,css,ts}
" command -nargs=1 VG noautocmd vimgrep <args> | copen | cc1 | ex

command ThisFunctions /this\.\w\+\s*=\s*function
command Backtick :normal a``
command Tilde :normal a~
command -nargs=1 TSF tabnew | setfiletype <args> 


command UpdateAll PlugUpgrade | PlugUpdate
command Spell setlocal spell spelllang=en_us<CR>
command SpellOff set nospell<CR>
"prints the current file path
command! WhereAmI echo expand('%:p') 
command! CPFilenameAndContent :call CPFilenameAndContent() "copy the filename (non the path) and the content of the current buffer
command! CPFileRelPath let @+=expand("%:.") "Copy the relative path of the current file
command! CPFileFullPath let @+=expand("%:p") "Copy the full path of the current file
command! CPFileCoordinates let @+=expand("%:.").":".line(".").":".col(".") "Copy the relative path of the current file and the line number
command! CPFileFullPathCoordinates let @+=expand("%:p").":".line(".").":".col(".")  "Copy the full path of the current file and the line number
command! CPSessionName let @+=xolox#session#find_current_session()
command! CPBranchName call CPBranchName()
command! -range GdiffSince execute "silent! !git difftool -d " . @* . "&"
command! SetWorkingDirectory :cd %:p:h
command! LexploreHere :Lexplore %:p:h

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

"Git 
command! G :cclose | Git
"Git stage everyting and open G
command! GA :wa | sleep 1 | Git add . | G
command! -nargs=* F :Git fetch --all -p | Flog -all -date=local <args>
command! FL :F -date=local
"Write a commit from a yanked todo
command! CommitFromTODO exe 'normal VpV<ESC>:s/.*\(TODO\|FIXME\): \(.*\)\*\//\2/'


" }}}

"MY MAPPINGS {{{

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
map <C-k> :cp<cr>

"}}}

"MY LEADER KEYS{{{

" nnoremap <Leader>P :CtrlP<Cr>

"CtrlPFunky
nnoremap <Leader>f :CtrlPFunky<Cr>
" list all useCallbacks in the current buffer
nnoremap <Leader>rc :vimgrep 'const .*useCallback' % \| call OpenQuickfix()<CR>
" list all useState and useMemo in the current buffer
nnoremap <Leader>rs :vimgrep "const .*\(useState\\|useMemo\)" % \| call OpenQuickfix()<CR>
"select function
nnoremap <Leader>vf va{V<Cr>
"select function with jsdoc
nnoremap <Leader>vjf va{o?\/\*\*Vk<Cr>
"copy function
" nnoremap <Leader>yf va{Vy<Cr>
nnoremap <Leader>yf va{o?\/\*\*Vky<Cr>
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
nnoremap <Leader>gpl :Git pull \| Flog<CR>
" Merginal
nnoremap <Leader>m :Merginal<CR>
" Lint
nnoremap <Leader>l :call Lint()<CR>
" ALEHover
nnoremap <Leader>ah :ALEHover<CR>
" ALEPrev
nnoremap <Leader>ap :ALEPrevious -error<CR>
" ALENext
nnoremap <Leader>an :ALENext -error<CR>
" ALEFix
nnoremap <Leader>af :ALEFix<CR>
" ALEToggle
nnoremap <Leader>at :ALEToggle<CR>
" ALEGoToDefinition
nnoremap <Leader>gd :ALEGoToDefinition<CR>
" ALEDetail
nnoremap <Leader>ad :ALEDetail<CR>
" write param type
nnoremap <Leader>pt yiw/<C-r>":\s\?\w\+veeeyvep
" JsDoc
nnoremap <Leader>jd :JsDoc<CR>
" write param doc
nnoremap <Leader>jp 0f}wye/\* @param .*} <C-r>" <cr>yyVp<cr>
" write param doc for typescript
nnoremap <Leader>tp 0f@Wye/@param + yyVp<cr>
" search with google
vnoremap <Leader>sg "gy<Esc>:call GoogleSearch()<CR>
" search with DevDocs
vnoremap <Leader>sd "gy<Esc>:call DevDocsSearch()<CR>
" Run bash command in terminal
vnoremap <Leader>tb :terminal bash<CR>

" vim-test
nnoremap <Leader>tn :w \| TestNearest<CR>
nnoremap <Leader>tf :w \| TestFile<CR>
nnoremap <Leader>ts :wa \| TestSuite<CR>
nnoremap <Leader>tl :w \| TestLast<CR>


"save current buffer
" nnoremap <Leader>s :update<cr>
" inoremap <Leader>s <Esc>:update<cr>

"TComment
noremap <Leader>c :TComment<CR>
"}}}

" PLUGINS SETTINGS {{{

" Colorscheme{{{
    "
" colorscheme holokai
" colorscheme spacegray
" colorscheme solarized8_light
" colorscheme spacemacs-theme

" Everforest
set background=light
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
colorscheme sonoma

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
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'modified', 'session_name'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'],[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'session_name': 'xolox#session#find_current_session'
      \ },
      \ 'component_expand': {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_infos': 'right',
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
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" coc.nvim config {{{
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_user_config = {     
    \'diagnostic.displayByAle': v:true,
    \'snippets.extends': {
        \'typescript': ['javascript']
        \}
\}

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" " xmap <leader>f  <Plug>(coc-format-selected)
" " nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" }}}

" CtrlP config {{{
" let g:ctrlp_cmd = 'CtrlPCurWD'
" let g:ctrlp_follow_symlinks = 1
" let g:ctrlp_by_filename = 1 
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
let g:ale_fixers = {'javascript': ['prettier', 'eslint'],'typescript': ['prettier', 'eslint'],'java':['uncrustify']}
let g:ale_set_highlights=0 "When this option is set to `1`, highlights will be set for problems.
let g:ale_lint_on_enter = 0 "When this option is set to `1`, the |BufWinEnter| and |BufRead| events will be used to apply linters when buffers are first opened
let g:ale_virtualtext_cursor = 'disabled' "controls how ALE will display problems

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_javascript_eslint_executable = 'eslint'

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
" set tags=./.tags,.tags
" let g:gutentags_ctags_tagfile=".tags"
" let g:gutentags_ctags_exclude = ['node_modules', 'build', 'dist']
" let g:gutentags_project_root = ['package.json']
" let g:gutentags_ctags_extra_args = ['--options='.expand('~/.ctags')]
" }}}

" CtrlP {{{
" let g:ctrlp_extensions = ['tag']

"ctrlp ignore node_modules
" let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|build\|dist\|backstop_data\|target'
" }}}

" vim-session {{{
let g:session_autosave = 'yes'
let g:session_command_aliases = 1
let g:session_default_to_last= 1
let g:session_autoload = 'no'
set sessionoptions-=buffers " Don't save hidden and unloaded buffers in sessions.

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

" copy branch name
function! CPBranchName()
    execute ':let @+="' . FugitiveHead() . '"'
endfunction

"copy the filename (non the path) and the content of the current buffer
function! CPFilenameAndContent()
    let filename = expand('%:.')
    let content = join(getline(1, '$'), "\n")
    let result = "File: " . filename . "\n-------------------------------------------------------\n" . content
    let @+ = result
    echo "Formatted content yanked to clipboard."
endfunction

" open a file at a specific position, reading the position from the line under
" the cursor
" eg. path/tofile:5:10
function GotoFileAtPosition()
  let filePathWithCoordinatesSplit = split(expand('<cWORD>'), ':')
  let filePath = filePathWithCoordinatesSplit[0]
  let lineNumber = filePathWithCoordinatesSplit[1]
  let columnNumber = filePathWithCoordinatesSplit[2]

  " Open the file at the specified position
  exec 'e +'.lineNumber.' '.filePath
  exec 'normal '.columnNumber.'|'
endfunction

" }}}


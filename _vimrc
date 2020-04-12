set runtimepath+=~/.vim/

call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'justinmk/vim-sneak'
Plug 'ledger/vim-ledger'
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tinykeymap_vim/'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'idbrii/vim-focusclip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-expand-region'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/clever-f.vim'
Plug 'ChesleyTan/wordCount.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rails'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-git'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-outline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasr/molokai'
Plug 'elixir-lang/vim-elixir'
Plug 'ahw/vim-pbcopy'
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
Plug '~/vim-dotfiles/bundles/random_colorschemes'
Plug 'Firef0x/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'andyl/vim-textobj-elixir'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
Plug 'nielsmadan/harlequin'
Plug 'svermeulen/vim-easyclip'
Plug 'Konfekt/FastFold'
Plug 'ajmwagar/vim-deus'
Plug 'bluz71/vim-moonfly-colors'
Plug 'KeitaNakamura/neodark.vim'
Plug 'romainl/vim-qf'
Plug 'tpope/tpope-vim-abolish'
Plug 'jnurmine/Zenburn'
Plug 'dracula/vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'moll/vim-bbye'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'junegunn/goyo.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'aquach/vim-http-client'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-utils/vim-husk'
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-mix-format'
Plug 'mcchrish/nnn.vim'
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete' }
Plug 'tpope/vim-projectionist'
Plug 'sophacles/vim-processing'
Plug 'skywind3000/asyncrun.vim'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'kassio/neoterm'

if has("macunix")
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
elseif has("unix")
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
  Plug 'junegunn/fzf.vim'
endif

call plug#end()

let g:processing_no_default_mappings=1

" async make
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:fsharp_interactive_bin = '/usr/bin/fsharpi'
let g:fsharp_xbuild_bin = '/usr/bin/xbuild'

let g:fsharp_only_check_errors_on_write = 1

let mapleader = ","
let g:mapleader = ","

let g:nnn#set_default_mappings = 0

map <silent> <leader>n <Plug>VinegarUp

let g:gutentags_cache_dir = '~/.tags_cache'

let g:projectionist_heuristics = {}
let g:projectionist_heuristics['mix.exs'] = {
            \ 'apps/*/mix.exs': { 'type': 'app' },
            \ 'lib/*.ex': {
            \     'type': 'lib',
            \     'alternate': 'test/{}_test.exs',
            \     'template': ['defmodule {camelcase|capitalize|dot} do', 'end'],
            \ },
            \ 'lib/*_controller.ex': {
            \     'type': 'controller',
            \     'alternate': 'test/{}_controller_test.exs',
            \     'template': ['defmodule {camelcase|capitalize|dot} do', '  use ReplacemeWeb, :controller', '', 'end'],
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', '', '  alias {camelcase|capitalize|dot}, as: Subject', '', 'end'],
            \ },
            \ 'mix.exs': { 'type': 'mix' },
            \ 'config/*.exs': { 'type': 'config' },
            \ '*.ex': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ },
            \ '*.exs': {
            \   'makery': {
            \     'lint': { 'compiler': 'credo' },
            \     'test': { 'compiler': 'exunit' },
            \     'build': { 'compiler': 'mix' }
            \   }
            \ }
            \ }

nmap <silent> <leader>a :A<CR>

if has("gui_win32")
  let g:python_host_prog="C:/Python27/python.exe"
elseif has("macunix")
  let g:python_host_prog="/usr/local/bin/python"
elseif has("unix")
  let g:python_host_prog="/usr/bin/python"
endif

" 2017/04/12 09:40:06, AA: Had to force the mapping again here
" because for some reason it was set (use `:verbose map %` to check)
" but it didn't work
" autocmd VimEnter because the _vimrc is parsed before loading the plugins
" and I want this to run after everything
autocmd VimEnter * map % <Plug>Matchit-%

let g:UltiSnipsSnippetsDir=$HOME.'/vim-dotfiles/bundles/mysnippets'
let g:UltiSnipsSnippetDirectories=['UltiSnips', g:UltiSnipsSnippetsDir]

set nocompatible

set noshowmode

" Remap VIM 0 to first non-blank character
" 2015/08/03 14:43:50, AA: 0 equals ^ only in normal mode
noremap 0 ^

" 2017/05/09 10:01:45, AA: Tslime + Neoterm + vim-test stuff
nmap <silent> Q <Plug>SetTmuxVars
nmap <silent> qt :call ChangeTestStrategy()<CR>

nmap <silent> <leader>Ts :TestSuite<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <F8> :TestLast<CR>

let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1

function! ChangeTestStrategy()
    if !exists("g:test#strategy") || g:test#strategy == 'neoterm'
        " With tslime, we want to run things in a tmux pane
        let g:test#strategy = 'tslime'

        nmap <silent> qq V<Plug>SendSelectionToTmux
        nmap <silent> qa ggVG<Plug>SendSelectionToTmux<C-o>
        vmap <silent> Q <Plug>SendSelectionToTmux
        nmap <silent> <F6> :Tmux <Up><CR>

        echo 'Using tslime/Tmux'
    else
        let g:test#strategy = 'neoterm'

        nmap <silent> qq :TREPLSendLine<CR>
        nmap <silent> qa :TREPLSendFile<CR>
        vmap <silent> Q :TREPLSendSelection<CR>

        echo 'Using neoterm/Term'
    endif
endfunction

call ChangeTestStrategy()

let test#elixir#exunit#executable = 'MIX_ENV=test mix test'
let test#ruby#rspec#executable = 'RAILS_ENV=test bundle exec rspec'

" 2015/09/12 17:44:38, AA:
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
" 2018/01/28 21:29:17, AA: Delete goes to the next closing thing (bracket, parenthesis, quote, etc.)
" AltGr + x = ξ
imap ξ <Plug>delimitMateS-Tab
imap <expr> <Del> delimitMate#ShouldJump() == 1 ? '<Plug>delimitMateS-Tab' : '<Del>'

" easy xml editing
let g:xml_syntax_folding = 1
set foldmethod=syntax
" 2016/11/11 16:53:42, AA: To start with all the folds opened
set foldlevelstart=20

" Fast saving
nmap <leader>w :w!<cr>

" 2016/11/11 18:01:42, AA: copy the contents of the file to the clipboard (OSX)
" nmap <leader>c :%w !pbcopy<cr>
" now using vim-pbcopy, normal mode: cy{motion}, visual mode: cy
let g:vim_pbcopy_local_cmd = "pbcopy"
let g:vim_pbcopy_escape_backslashes = 1

inoremap jk <Esc>
tnoremap <C-\> <C-\><C-n>

" 2014-06-19, AA: http://vim.wikia.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" Ctrl+BS Apaga previous word
" imap <C-BS> <C-W>
inoremap <C-BS> <C-\><C-o>db
inoremap <C-Del> <C-\><C-o>dw

" expands %% to current file's directory in command-line mode
cnoremap %% <C-R>=fnameescape(expand('%'))<CR>
cnoremap %p <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <leader>C :! cp <C-R>=fnameescape(expand('%'))<CR> <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <leader>M :! mv <C-R>=fnameescape(expand('%'))<CR> <C-R>=fnameescape(expand('%:h')).'/'<CR>

" 2017/04/11 09:28:57, AA: visually select the last paste or change
nnoremap <expr> ge '`[' . strpart(getregtype(), 0, 1) . '`]'

" 2017/05/26 11:08:17, AA: paste from pb above and below
nnoremap gP k:read !pbpaste<CR>
nnoremap gp :read !pbpaste<CR>

" switch to last buffer, like alt+tab
nnoremap <Leader><Tab> :b#<CR>

" Fast editing of the .vimrc
map <leader>e :tabnew! ~/vim-dotfiles/_vimrc<cr>

" * 2015/12/16 10:31:16, AA: Fast closing of window
map <leader>z :close<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $MYVIMRC

" Set 7 lines to the cursors - when moving vertical..
set scrolloff=7

" Keep some spacing.
set sidescrolloff=1

" 2015/08/19 10:01:29, AA: To toggle the editing line to be always
" centered on the screen
nnoremap <Leader>ss :let &scrolloff=999-&scrolloff<CR>

set wildmenu
set wildmode=list:longest,full

set cmdheight=2 "The commandbar height

set hidden "Change buffer - without saving

" Set backspace config
set whichwrap+=<,>,h,l
set backspace=indent,eol,start

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

" 2017/08/10, AA: Neovim search wrap
set wrapscan

set ttyfast
set lazyredraw "Don't redraw while executing macros

" 2017/11/12 16:09:24, AA: From https://github.com/jessfraz/.vim/blob/master/vimrc#L84
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

set nocursorline

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" 2017/02/21 11:54:48, AA: better split opening
set splitbelow
set splitright

" 2018/01/15 14:28:07, AA: Prettier vertical split
set fillchars+=vert:│

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set font according to system
" set guifont=Courier_New:h12 " :cANSI
if has ("gui_running")
    " 2014-12-08 10:59:50, AA: latex config for Gvim
    " let g:Tex_ViewRule_pdf='C:/Program\ Files\ (x86)/SumatraPDF/SumatraPDF.exe'
    " 2015/11/08 23:19:26, AA: The full path didn't work, had to put
    " the sumatrapdf folder in the $PATH
    let g:Tex_ViewRule_pdf='sumatrapdf'
    set guioptions=

    if has("gui_gtk2")
        set guifont=Envy\ Code\ R\ for\ Powerline\ 14
        let g:airline_powerline_fonts = 1
        let g:airline_symbols = {}
        let g:airline_symbols.space = "\ua0"
    elseif has("gui_win32")
        set guifont=Envy\ Code\ R\ for\ Powerline:h10:cANSI
    elseif has("macunix")
        set guifont=Envy\ Code\ R\ for\ Powerline:h13
    endif
else
    " 2014-12-08 10:59:50, AA: latex config for shell
    let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
    let g:Tex_ViewRule_pdf = 'run /cygdrive/c/dados/programas/sumatraPDF/SumatraPDF'
endif

" abrir utf-8 the right way
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " 2013-12-27, AA: comentei para usar o ucs-bom e o latin1
  " setglobal bomb
  set fileencodings=utf-8
  set penc=utf-8
  " set fileencodings=ucs-bom,utf-8,latin1
endif

" 2014-09-30, AA: Copied from
" http://www.reddit.com/r/vim/comments/1rzr72/how_do_i_work_with_different_file_encodings_in_vim/
function! CheckFileEncoding()
  if exists('b:fenc_at_read') && &fileencoding != b:fenc_at_read
    exec 'e! ++enc=' . &fileencoding
    unlet b:fenc_at_read
  endif
endfunction
au BufRead let b:fenc_at_read=&fileencoding
au BufWinEnter call CheckFileEncoding()

function! ChangeSchemeWithIndex(index)
    let l:favourite_schemes = ["PaperColor", "molokai", "harlequin", "atom-dark-256", "railscasts", "deus", "moonfly", "neodark", "zenburn", "dracula", "seoul256"]
    let l:to_use = l:favourite_schemes[a:index % len(l:favourite_schemes)]

    if l:to_use == "deus" || l:to_use == "PaperColor"
        set background=dark
    endif
    if l:to_use == "zenburn"
        let g:zenburn_high_Contrast=1
    endif
    if l:to_use == "seoul256"
        let g:seoul256_background=233

        " Cool colors of seoul256 tabline
        " hi TabLine term=underline cterm=underline ctermfg=245 ctermbg=237 gui=underline guibg=#4B4B4B
        " hi TabLineFill term=reverse cterm=reverse ctermfg=235 gui=reverse guifg=#333233
        " hi TabLineSel term=bold cterm=bold ctermfg=187 ctermbg=23 gui=bold guifg=#DFDEBD guibg=#007173
    endif

    execute "colorscheme " . l:to_use

    if l:to_use == "railscasts"
        highlight ColorColumn term=reverse ctermbg=236 guibg=#232526
    endif
    if l:to_use == "moonfly"
        highlight Visual ctermbg=237
    endif

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " air-line
    let g:airline_powerline_fonts = 1

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.space = "\ua0"

    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''

    " let g:airline_theme='minimalist'
    let g:airline_theme='papercolor'
endfunction

" 2014-11-04, AA: using seoul256
" instead of molokai
if has("gui_running")
  set t_Co=256
  set background=dark
  colorscheme seoul256
else
  " setting always PaperColer by default
  call ChangeSchemeWithIndex(0)
endif

set colorcolumn=81

" Turn backup off, since most stuff is in SVN, git anyway...
if has("gui_win32")
  set directory=%TMP%
  set backupdir=%TMP%

  "Persistent undo
  try
      set undodir=%TMP%
      set undofile
  catch
  endtry

elseif has("macunix")
  set directory=$TMPDIR
  set backupdir=$TMPDIR
  "Persistent undo
  try
      set undodir=$TMPDIR
      set undofile
  catch
  endtry
endif

set nobackup
set nowb
set noswapfile

" spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

set lbr

set smartindent "Smart indet
set cindent "Use C-style indent
set wrap "Wrap lines
set textwidth=1000 "por defeito sao 500 apenas

" 2014-11-07, AA: using https://github.com/haya14busa/incsearch.vim.git
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" 2015/09/02 14:41:35, AA: using vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" 2017/08/10, AA: visual $ doesn't select the newline
vmap $ g_

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

map <C-f><C-f> :call ChangeScheme()<CR>

let g:font_index_to_use = 0
function! ChangeWindowsFont()
    let l:favourite_fonts = ["Raize:h12", "Courier_New:h12", "Envy\\ Code\\ R\\ for\\ Powerline:h10"]
    let g:font_index_to_use += 1
    let l:to_use = l:favourite_fonts[g:font_index_to_use % len(l:favourite_fonts)]
    execute "set guifont=" . l:to_use
endfunction

" Choosing a different scheme
let g:scheme_index_to_use = 0
function! ChangeScheme()
    let g:scheme_index_to_use += 1
    call ChangeSchemeWithIndex(g:scheme_index_to_use)
endfunction

" 2016/08/18 18:55:36: function to clean esttab .csv output from stata
function! CleanStataCSV()
    " Remove = -> It's needed
    " execute "%s/=//g"
    " Remove " -> They are needed
    " execute "%s/\"//g"
    " Replace , by ;
    execute "%s/,/;/g"
endfunction

" 2013-03-07, AA: Copia as matches (mesmo multiline) para os registers
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Smart mappings on the command line
cno $h ~/
cno $d ~/Desktop/
cno $j ./
cno $c <C-R>=expand("%:h")<cr>
cno $p <C-R>=expand("%:p")<cr>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

" 2014-12-08 12:28:07, AA: Center screen on next/prev search:
nmap n nzzzv
nmap N Nzzzv

" 2015-03-31 14:12:30, AA: Map ; to : (command)
nnoremap ; :

" 2015/06/17 15:56:51, AA: Map Backspace to Toggle between current file and previous
nnoremap <BS> <C-^>
map <silent> <leader><leader> :noh<cr>:ALEToggle<cr>:GitGutterAll<cr>

" From https://elixirforum.com/t/vim-interfering-with-phoenix-recompile-after-saving/10039/20
let $MIX_ENV = 'test'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_elixir_elixir_ls_release = '/home/andre/projs/personal/elixir-ls/rel'
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_linters = {
\    'elixir': ['mix'],
\    'javascript': ['prettier', 'eslint'],
\    'ruby': ['rubocop'],
\ }

let g:ale_fixers = {
\    'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
\    'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint'],
\ }

" nnoremap Kl :ALELint<CR>
" nnoremap Kf :ALEFix<CR>
" nnoremap Kd :ALEGoToDefinition<CR>
" nnoremap Kr :ALEFindReferences<CR>

" Tinykeymap now associates by default the windows mode with <mapleader>W
let g:tinykeymap#map#windows#map = "<C-W>"

call tinykeymap#EnterMap('ale', 'K', {'name': 'ALE mode'})
call tinykeymap#Map('ale', 'l', 'ALELint')
call tinykeymap#Map('ale', 'f', 'ALEFix')
call tinykeymap#Map('ale', 'd', 'ALEGoToDefinition')
call tinykeymap#Map('ale', 'r', 'ALEFindReferences')
call tinykeymap#Map('ale', 'i', 'ALEInfo')

" 2016/11/08 11:41:14, AA: From http://tex.stackexchange.com/a/3655/65117
" Because IMAP_JumpForward was taking the C-j mapping
" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" Smart way to move btw. windows
" 2018/04/14 22:15:55, AA: Done by tmux-navigator
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Close the current buffer (uses Bdelete from bbye)
map <leader>bd :Bdelete<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" When <leader>P copia a path do ficheiro actual para o clipboard
map <leader>P :let @+=expand("%:p")<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" 2014-11-03, AA: From http://stackoverflow.com/a/4952200/687420
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev xdate <c-r>=strftime("%Y/%m/%d")<cr>
inoreabbrev xtime <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

"Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

""""""""""""""""""""""""""""""""""
" Log files
""""""""""""""""""""""""""""""""""
au Filetype conf set foldmethod=manual
au Filetype log set foldmethod=manual

""""""""""""""""""""""""""""""""""
" Cenas dos plug-ins
""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 2014-11-04, AA: From http://robots.thoughtbot.com/vim-you-complete-me
" imap <Tab> <C-P>
" 2015/08/03 14:40:08, AA: Using snipmate from the actual repository
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

imap <C-Tab> <C-X><C-O>
set complete=.,w,b,u,t,]
set completeopt=longest,menuone

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""
" C# stuff added by me, 31/07/11 12:04:47,
" http://arun.wordpress.com/2009/04/10/c-and-vim/
" use za to toggle open/close fold under cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2

" Quickfix mode: command line msbuild error format
au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m

" Colocar o caminho do ficheiro de tags gerado com o Ctags
set tag=$VIMRUNTIME\ctags\alltags

""""""""""""""""""""""""""""""
" => yankRing with Unite
""""""""""""""""""""""""""""""
" 2015/07/27 13:04:49, AA: replaced YankRing with Unite
" 2016/11/08 11:47:03, AA: Now depends on a external neoyank.vim
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1
let g:unite_source_history_yank_limit = 10000
let g:unite_source_history_yank_file = $HOME.'/.vim/yankring.txt'
" 2016/11/10 10:38:08, AA: From https://github.com/Shougo/unite.vim/issues/986
let g:unite_source_rec_async_command = [ 'ag', '-l', '-g', '', '--nocolor'  ]
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank register history/yank<cr>

""""""""""""""""""""""""""""""
" => Easyclip stuff
""""""""""""""""""""""""""""""
" 2017/05/22 10:24:29, AA: We now have `m` on normal mode to cut, so
" we map `set mark` to `gm`
nnoremap gm m
" similar to what D does and what I'm used to Y doing
nmap M <Plug>MoveMotionEndOfLinePlug
map Y yy

map <silent> <C-n> :NnnPicker %:p:h<CR>

function! NetrwBuf()
  nmap <buffer> <C-N> -
  nmap <buffer> M R
  nmap <buffer> h -
  nmap <buffer> l <CR>
  " Y inside Netrw allows to easily duplicate the current file
  nmap <buffer> Y 0"zy$:! cp <C-R>z <C-R>z
endfunction

augroup FILETYPES
  autocmd FileType netrw call NetrwBuf()
augroup END

let g:netrw_gx="<cWORD>"

nnoremap <silent> <leader>< :call QuickFixOrLocationNext()<CR>
nnoremap <silent> <leader>> :call QuickFixOrLocationPrev()<CR>

" σ = AltGr + S
" δ = AltGr + D
nnoremap σ :GitGutterPrevHunk<CR>
nnoremap δ :GitGutterNextHunk<CR>

function! QuickFixOrLocationNext()
    if len(getloclist(0))>0
        try
            execute "lnext"
        catch
            execute "lfirst"
        endtry
      elseif len(getqflist())>0
        try
            execute "cnext"
        catch
            execute "cfirst"
        endtry
    else
        echo "No Locations or Errors"
    endif
endfunction

function! QuickFixOrLocationPrev()
    if len(getloclist(0))>0
        try
            execute "lprev"
        catch
            execute "llast"
        endtry
      elseif len(getqflist())>0
        try
            execute "cprev"
        catch
            execute "clast"
        endtry
    else
        echo "No Locations or Errors"
    endif
endfunction


""""""""""""""""""""""""""""""
" => Ledger stuff
""""""""""""""""""""""""""""""

if has('win32') || has('win64')
      let g:ledger_bin = 'C:/dados/programas/ledger/ledger.exe'
  else
      let g:ledger_bin = '/usr/local/bin/ledger'
endif

let g:ledger_maxwidth = 66
autocmd FileType ledger inoreabbrev con Assets:Bank:Conta Caderneta
autocmd FileType ledger inoreabbrev cas Assets:Cash:Carteira

nnoremap <F9> :call AllFoldsToggle()<CR>

function! AllFoldsToggle()
    if !exists('g:folds_open')
        let g:folds_open = 0
    endif

    if g:folds_open == 1
        " Close all folds
        execute "normal zM"
        let g:folds_open = 0
    else
        " Open all folds
        execute "normal zR"
        let g:folds_open = 1
    endif
endfunction

""""""""""""""""""""""""""""""
" => EasyAlign section
""""""""""""""""""""""""""""""
let g:easy_align_delimiters = {
\ 'x': { 'pattern': '->\|<-' },
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

xmap ga <Plug>(EasyAlign)

" call camelcasemotion#CreateMotionMappings('<leader>')
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
" sunmap ge


""""""""""""""""""""""""""""""
" => Refactor stuff
""""""""""""""""""""""""""""""
nmap X *Nvar:s///gc<Left><Left><Left>

""""""""""""""""""""""""""""""
" => Processing section
""""""""""""""""""""""""""""""
let g:showing_processing_preview = 0
function! ToggleProcessingPreview()
    if g:showing_processing_preview == 0
        let g:showing_processing_preview = 1
        execute 'w'
        execute 'Make'
    else
        let g:showing_processing_preview = 0
        execute 'AsyncStop'
    endif
endfunction
au Filetype processing nnoremap <silent> <F5> :call ToggleProcessingPreview()<CR>

""""""""""""""""""""""""""""""
" => Elixir section
""""""""""""""""""""""""""""""
au Filetype elixir nmap <Leader>p orequire IEx; IEx.pry<Esc>
au Filetype elixir nmap <silent> <leader>L :MixFormat<CR>
au Filetype elixir nmap <silent> <F5> :Tmux recompile<CR>

""""""""""""""""""""""""""""""
" => Ruby section
""""""""""""""""""""""""""""""
au FileType ruby set omnifunc=rubycomplete#Complete
au FileType ruby set shiftwidth=2
au Filetype ruby nmap <Leader>p orequire "pry"; binding.pry<Esc>
au FileType ruby iabbrev ,,P require "pry"; ["continue", "step", "next"].each do \|c\| Pry.commands.alias_command c[0], c end; binding.pry
" au FileType ruby let g:rubycomplete_buffer_loading = 1
" au FileType ruby let g:rubycomplete_classes_in_global = 1


""""""""""""""""""""""""""""""
" => Text (prose) section
""""""""""""""""""""""""""""""
" 2014-11-10, AA: From https://github.com/junegunn/limelight.vim
autocmd User GoyoEnter Limelight
autocmd User GoyoEnter colorscheme neodark
autocmd User GoyoEnter set guifont=Ubuntu\ Mono\ Regular\ 16
autocmd User GoyoEnter set guioptions=
autocmd User GoyoLeave Limelight!

" 2015/07/28 07:53:10, AA: Activate only limelight (highlight current paragraph)
" From: https://zenbro.github.io/2015/06/09/meditating-on-code.html
nmap <silent> <leader>L :Limelight!!<CR>
xmap <leader>L <Plug>(Limelight)

autocmd Filetype text set nocindent
autocmd Filetype text set formatoptions=tcqjn

let g:pencil#map#suspend_af = 'K'
let g:pencil#wrapModeDefault = 'soft'
let g:textobj#quote#educate = 0

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
                            \ | syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
                            \ | syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
                            \ | iabbrev <buffer> -- –
                            \ | iabbrev <buffer> --- —
                            \ | iabbrev <buffer> << «
                            \ | iabbrev <buffer> >> »
                            \ | setl spell spl=en_us fdl=4 noru nonu nornu
                            \ | setl fdo+=search
augroup END

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au Filetype python nmap <Leader>p oimport ipdb; ipdb.set_trace();<Esc>
au Filetype python nmap <silent> <F5> :Tmux recompile<CR>

au FileType json nmap =j :%!python -m json.tool<CR>

""""""""""""""""""""""""""""""
" => Latex section
"""""""""""""""""""""""""""""""
" 2014-10-27, AA: latex indenting
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

au FileType tex set textwidth=80
au FileType tex set sw=2
au FileType tex set iskeyword+=:
au FileType tex nmap <leader>E :call LatexEn()<CR>
" 2015/11/08 23:05:11, AA: <leader>b builds document
au FileType tex nmap <leader>b :call Tex_RunLaTeX()<CR>
au FileType tex nmap <leader>v :call Tex_ViewLaTeX()<CR>
au FileType bib set textwidth=80

function! LatexEn()
  " 2014-12-13 12:30:44, AA: To add the things I deactivated on
  " C:\Users\lejboua\.vim\bundle\vim-latex\ftplugin\latex-suite\brackets.vim
  " * 2015/12/27 22:24:03, AA: Commented this and replaced by the imap lines
  " according to: http://vim-latex.sourceforge.net/faq.shtml#faq-euro-symbols
  " call Tex_MakeMap('<M-b>', '<Plug>Tex_MathBF', 'i', '<buffer> <silent>')
  " call Tex_MakeMap('<M-c>', '<Plug>Tex_MathCal', 'i', '<buffer> <silent>')
  " call Tex_MakeMap('<M-l>', '<Plug>Tex_LeftRight', 'i', '<buffer> <silent>')
  " call Tex_MakeMap('<M-b>', '<Plug>Tex_MathBF', 'v', '<buffer> <silent>')
  " call Tex_MakeMap('<M-c>', '<Plug>Tex_MathCal', 'v', '<buffer> <silent>')
  " call Tex_MakeMap('<M-l>', '<Plug>Tex_LeftRight', 'n', '<buffer> <silent>')
    imap <C-b> <Plug>Tex_MathBF
    imap <C-c> <Plug>Tex_MathCal
    imap <C-l> <Plug>Tex_LeftRight
  " 2015/12/27 22:25:58, AA: from http://vim-latex.sourceforge.net/faq.shtml#faq-e-acute
    imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
endfunction

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript setl shiftwidth=2
au FileType javascript setl tabstop=2
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => MRU
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>r :FzfHistory<CR>

"Quickly open a buffer for scribble
map <leader>q :e ~/Dropbox/etc/scratchpad.txt<cr>
au BufRead,BufNewFile ~/Dropbox/etc/scratchpad.txt iab <buffer> xh1 ============================ <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr> ========

map <leader>bb :cd ..<cr>

"""""""""""""""""""""""""""""""""""""""""""""
" => 2015-03-31 22:41:34, AA: Vim Unite Stuff
"""""""""""""""""""""""""""""""""""""""""""""
" 2016/11/17 15:25:47, AA: unite-tag (ctags stuff)
let g:unite_source_tag_max_fname_length = 50
let g:unite_source_tag_max_name_length = 50

nnoremap <F10> :Unite -vertical -winwidth=50 outline<CR>
nnoremap <F7> :UniteWithCursorWord -immediately tag<CR>

function! s:unite_settings() "{
    " C-c to exit Unite
    imap <buffer> <C-c> <Esc><Plug>(unite_all_exit)
    nmap <buffer> <C-c> <Plug>(unite_all_exit)
    " Enable navigation with alt-j and alt-k in insert mode
    imap <buffer> <M-j>     <Plug>(unite_select_next_line)
    imap <buffer> <M-k>     <Plug>(unite_select_previous_line)
    inoremap <silent> <buffer> <expr> <C-o><C-n> unite#do_action('tabopen')
    inoremap <silent> <buffer> <expr> <C-o><C-j> unite#do_action('below')
    inoremap <silent> <buffer> <expr> <C-o><C-k> unite#do_action('above')
    inoremap <silent> <buffer> <expr> <C-o><C-h> unite#do_action('left')
    inoremap <silent> <buffer> <expr> <C-o><C-l> unite#do_action('right')
endfunction

" 2015/07/27 13:32:48, AA:
" change prompt and start NOT in insert mode
  call unite#custom#profile('default', 'context',
                          \ { 'prompt': '» ',
                          \   'start_insert' : '0'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])

autocmd Filetype unite call s:unite_settings()

" not blinking cursor
set guicursor=n:block-blinkon0-Cursor,v:block-blinkon0-VisualCursor,c-i-ci:ver25-blinkon0-Cursor,r-cr:hor16-blinkon0-Cursor

"""""""""""""""""""""""""""""""""""""""""""""
" => 2017/01/30 16:28:03, AA: CtrlP stuff, Unite is slow af
" => 2017/05/15 14:25:58, AA: Disabled CtrlP for files, fzf is the real deal
"""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <Space> :FzfBuffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""
" => 2017/05/15 14:25:58, AA: FZF is the real deal
"""""""""""""""""""""""""""""""""""""""""""""
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

function! s:rg_to_qf(line)
  let parts = split(a:line, '/')
  let filename_idx = len(parts) - 1
  return {'filename': a:line, 'lnum': '1', 'col': '1',
        \ 'text': parts[filename_idx]}
endfunction

function! s:rg_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:rg_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

let fzf_source_command = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_command_prefix = 'Fzf'
command! FzfFiles call fzf#run({
\ 'source':  fzf_source_command,
\ 'sink*':   function('<sid>rg_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

command! FzfFilesCWord call fzf#run({
\ 'source':  fzf_source_command,
\ 'sink*':   function('<sid>rg_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all -q '.SnakecaseCurrentWord().
\            ' --color hl:68,hl+:110',
\ 'down':    '50%'
\ })

command! FzfAllFiles call fzf#run({
\ 'source':  'rg --files --no-ignore --hidden --follow --glob "!.git/*"',
\ 'sink*':   function('<sid>rg_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

nmap <silent> <leader>f :FzfFiles<CR>
nmap <silent> <leader>F :FzfFilesCWord<CR>
nnoremap <leader>d :call fzf#vim#tags(expand('<cWORD>'), {'options': '--exact --select-1 --exit-0'})<CR>

nnoremap <silent> <leader>l :FzfLines<CR>

command! -nargs=* FzfAg call fzf#run({
\ 'source':  printf('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always" --glob "!.git/*" "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':   function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

nmap <leader>G :FzfAg <c-r>=expand("<cword>")<CR>
nmap <leader>g :FzfAg<Space>

" 2017/08/10, AA: Copied from tpope abolish.vim
function! SnakecaseCurrentWord()
  let word = expand('<cword>')
  let word = substitute(word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  return word
endfunction

" 2014-11-04, AA: Vim-sneak, Alternativa ao Easymotion
let g:sneak#streak = 1
let g:sneak#s_next = 1
" 2017/03/07 15:17:16, AA: Only if Sneak is being used
nmap <expr> <Tab> sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Tab>'

" 2014-11-03, AA: Easymotion plug-in
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 2014-11-03, END

set number        " always show line numbers
set list

" 2016/11/29 09:01:23, AA: Toggle zoom
" From: http://stackoverflow.com/a/26551079/687420

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap \| :ZoomToggle<CR>

function! AskCommandWithSuggestion(suggestion, ...)
  let l:suggested_command = exists('a:1') ? a:suggestion . " " . a:1 : a:suggestion

  let l:full_command = input("[default:". l:suggested_command ."] ", l:suggested_command)

  exe ":". l:full_command
endfunction

function! GitCurrentBranch()
  let l:branch = fugitive#statusline()
  return substitute(l:branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.'\1', 'g')
endfunction

function! GitPushToOrigin(...)
  let l:branch = GitCurrentBranch()
  let l:suggested_command = "Gpush origin " . l:branch

  if exists('a:1')
      call AskCommandWithSuggestion(l:suggested_command, a:1)
  else
      call AskCommandWithSuggestion(l:suggested_command)
  endif
endfunction

let g:onfido_gitlab_domain = 'https://gitlab.eu-west-1.mgmt.onfido.xyz'
let g:fugitive_gitlab_domains = [g:onfido_gitlab_domain]

function! OpenOnfidoGitlabMR()
    let l:gitlab_mr_url = GetOnfidoGitlabMergeRequestURL()
    silent execute '! xdg-open "' . l:gitlab_mr_url . '"'

    redraw!
endfunction

function! GetOnfidoGitlabMergeRequestURL()
  let l:project_command = "git remote -v | grep -Po 'git@gitlab.eu-west-1.mgmt.onfido.xyz:\\K[^.]+' | uniq | tr -d '\n'"
  let l:project = system(l:project_command)

  let l:current_branch = GitCurrentBranch()

  let l:url_template = "%s/%s/-/merge_requests/new?merge_request[source_branch]=%s&merge_request[target_branch]=master"

  return printf(l:url_template, g:onfido_gitlab_domain, l:project, l:current_branch)
endfunction

call tinykeymap#EnterMap('git', 'gj', {'name': 'Git mode'})
call tinykeymap#Map('git', '<space>', 'Gstatus')
" MR
call tinykeymap#Map('git', 'm', 'call OpenOnfidoGitlabMR()')
" pushes
call tinykeymap#Map('git', 'ps', 'call GitPushToOrigin()')
call tinykeymap#Map('git', 'pf', 'call GitPushToOrigin("--force-with-lease")')
call tinykeymap#Map('git', 'po', 'call GitPushToOrigin("--force")')
" rebases
call tinykeymap#Map('git', 'ri', 'call AskCommandWithSuggestion("Git rebase -i ")')
call tinykeymap#Map('git', 'rd', 'call AskCommandWithSuggestion("Git rebase development")')
call tinykeymap#Map('git', 'rf', 'call AskCommandWithSuggestion("Git rebase feature/")')
call tinykeymap#Map('git', 'rr', 'call AskCommandWithSuggestion("Git rebase ")')
" branches
call tinykeymap#Map('git', 'bf', 'call AskCommandWithSuggestion("Git checkout -b feature/")')
call tinykeymap#Map('git', 'bh', 'call AskCommandWithSuggestion("Git checkout -b hotfix/")')
call tinykeymap#Map('git', 'br', 'call AskCommandWithSuggestion("Git checkout -b ")')
call tinykeymap#Map('git', 'bb', 'call OpenOnfidoBitbucketPR()')
" checkouts
call tinykeymap#Map('git', 'cd', 'call AskCommandWithSuggestion("Git checkout development")')
call tinykeymap#Map('git', 'cf', 'call AskCommandWithSuggestion("Git checkout feature/")')
call tinykeymap#Map('git', 'cc', 'call AskCommandWithSuggestion("Git checkout ")')
" logs
call tinykeymap#Map('git', 'pp', 'FzfCommits')
call tinykeymap#Map('git', 'pb', 'FzfBCommits')
" hunks
call tinykeymap#Map('git', 'N', 'GitGutterPrevHunk')
call tinykeymap#Map('git', 'n', 'GitGutterNextHunk')
call tinykeymap#Map('git', 'v', 'GitGutterPreviewHunk')
call tinykeymap#Map('git', 'g', 'GitGutterStageHunk')

call tinykeymap#Map('git', 'l', 'Glog')
call tinykeymap#Map('git', 'e', 'Gedit')
call tinykeymap#Map('git', 'st', 'Git stash')
call tinykeymap#Map('git', 'sp', 'Git stash pop')
call tinykeymap#Map('git', 'bl', 'Gblame')
call tinykeymap#Map('git', 'd', 'Gdiff')

autocmd FileType gitcommit setlocal spell
" autocmd FileType gitcommit /On branch<CR>f/ly$ggoJIRA <ESC>pggO

call tinykeymap#EnterMap('window', 'gw', {'name': 'Window mode'})
call tinykeymap#Map('window', 'l', 'lopen')
call tinykeymap#Map('window', 'q', 'copen')

" 2018/03/19 10:31:00, AA: Disable the default hotkey
let g:http_client_bind_hotkey=0
nmap <silent> <leader>x :HTTPClientDoRequest<CR>

" 2017/08/03 08:17:30, AA: Disable repeated hjkl motions
" source ~/vim-dotfiles/disable_repeated_hjkl_motions.vim

" 2017/11/17 07:58:48, AA: Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" call pathogen#infect() " with this, it will search for packages on '~/.vim/bundle'
" call pathogen#infect('C:\\dados\\programas\\vim\\vim73\\bundle')
" 2014-05-30, AA: Removed configs already set on sensible.vim
" 2014-09-18, AA: Comentei as 3 seguintes linhas para funcar no cygwin
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" 2014-09-18, AA: Para fazer o autoload do pathogen do lado do windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" 2014-09-18, AA: Substitui a path por $HOME . '\\.vim\\bundle'
if has("win32")
    call pathogen#infect($HOME . '\\.vim\\bundle\\{}')
    source $VIMRUNTIME/vimrc_example.vim
    " source $VIMRUNTIME/mswin.vim
    behave mswin
else
    call pathogen#infect($HOME . '/.vim/bundle/{}')
endif

set nocompatible

" unnamed register = windows clipboard
set clipboard=unnamed

" Remap VIM 0 to first non-blank character
map 0 ^

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" easy xml editing
let g:xml_syntax_folding = 1
set foldmethod=syntax

" 2014-10-27, AA: latex indenting
let g:tex_flavor='latex'

" Fast saving
nmap <leader>w :w!<cr>

" 2014-03-20, AA: http://approache.com/blog/increase-your-productivity-with-vim-and-terminal/
" jj => nao ter de ir ao Esc
imap jj <Esc>

" 2014-06-19, AA: http://vim.wikia.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" Ctrl+BS Apaga previous word
" imap <C-BS> <C-W>
inoremap <C-BS> <C-\><C-o>db
inoremap <C-Del> <C-\><C-o>dw

" Teclado PT ` e dificil de usar
nnoremap \ `

" acabei por nao usar isto
let vimrc_file_path=expand('<sfile>:p')

" Fast editing of the .vimrc
map <leader>e :tabnew! $MYVIMRC<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $MYVIMRC

" Set 7 lines to the cursors - when moving vertical..
set scrolloff=7

set wildmode=list:longest

set cmdheight=2 "The commandbar height

set hidden "Change buffer - without saving

" Set backspace config
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set font according to system
" set guifont=Courier_New:h12 " :cANSI 
if has ("gui_running")
    if has("gui_gtk2")
        set guifont=Envy\ Code\ R\ 10
    elseif has("gui_win32")
        set guifont=Envy\ Code\ R:h10:cANSI
    endif
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

" 2014-11-04, AA: using seoul256
" instead of molokai
let g:seoul256_background = 233
if has("gui_running")
  " set guioptions-=mT
  set guioptions-=m
  set guioptions-=T
  set t_Co=256
  " colorscheme molokai
  " colorscheme seoul256
  colorscheme atom-dark
  " colorscheme peaksea
  " colorscheme ir_black
else
  " colorscheme zellner
  colorscheme seoul256
endif
set background=dark
set nonu

" Turn backup off, since most stuff is in SVN, git anyway...
set directory=%TMP%
set backupdir=%TMP%
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    " set undodir=C:\Windows\Temp
    set undodir=%TMP%
    set undofile
catch
endtry

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

" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

map <C-f><C-f> :call ChangeFont()<CR>

" 12/25/04 15:29:34: funcao que percorre fonts que eu gosto
let g:font_index_to_use = 0
function! ChangeFont()
    let l:favourite_fonts = ["Raize:h12", "Courier_New:h12", "Envy\\ Code\\ R:h10"]
    let g:font_index_to_use += 1
    let l:to_use = l:favourite_fonts[g:font_index_to_use % len(l:favourite_fonts)]
    execute "set guifont=" . l:to_use
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
cno $h e ~\
cno $d e ~\Desktop\
cno $j e .\
cno $c e <C-\>eCurrentFileDir("e")<cr>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  if g:cmd == g:cmd_edited
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" 2014-11-07, AA: Map space to : (command) 
" C-space to ? (backwards search)
map <space> :
" 2014-11-07, AA: never used it!
" map <C-space> ?
" map <silent> <leader><cr> :noh<cr>
map <silent> <leader><leader> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer (utiliza a function Bclose)
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" When <leader>P copia a path do ficheiro actual para o clipboard
map <leader>P :let @+=expand("%:p")<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Always show the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" 2014-03-19, AA: Status line nova

" composicao da status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%1*\ %{strlen(&fenc)?&fenc:&enc}%* " encoding
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5P%*             "percentage thru file
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%6*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

function! CurDir()
    " tinha isto mas tirei o substitute:
    " let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    " return curdir
    return getcwd()
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2014-11-03, AA: surround.vim faz isto com o S", ou S{, etc.
" vnoremap ?1 <esc>`>a)<esc>`<i(<esc>
" vnoremap ?2 <esc>`>a]<esc>`<i[<esc>
" vnoremap ?3 <esc>`>a}<esc>`<i{<esc>
" vnoremap ?$ <esc>`>a"<esc>`<i"<esc>
" vnoremap ?q <esc>`>a'<esc>`<i'<esc>
" vnoremap ?e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap ?1 ()<esc>i
inoremap ?2 []<esc>i
inoremap ?3 {}<esc>i
inoremap ?4 {<esc>o}<esc>O<tab>
inoremap ?q ''<esc>i
inoremap ?e ""<esc>i
inoremap ?t <><esc>i

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
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

"Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

""""""""""""""""""""""""""""""""""
" Cenas dos plug-ins
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
" 2012-04-25: Para que apare?a em cima
" let g:miniBufExplVSplit = 25
" let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 2014-11-04, AA: From http://robots.thoughtbot.com/vim-you-complete-me
imap <Tab> <C-P>
imap <C-Tab> <C-X><C-O>
set complete=.,b,u,]
set completeopt=menu,preview

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

autocmd BufEnter *.md exe 'noremap <leader>m :!start C:\Users\oiu027\AppData\Local\Google\Chrome\Application\chrome.exe %:p<CR>'

" Colocar o caminho do ficheiro de tags gerado com o Ctags
set tag=$VIMRUNTIME\ctags\alltags

""""""""""""""""""""""""""""""
" => yankRing plugin
""""""""""""""""""""""""""""""
let g:yankring_window_use_horiz = 0  " Use vertical split
let g:yankring_window_width = 30
" let g:yankring_max_element_length = 4194304 " 4M
let g:yankring_max_element_length = 262144 " 250kB
let g:yankring_min_element_length = 2 " exclude single char deletes
let g:yankring_max_history = 20
map <leader>y :YRShow<cr>
map <leader>cy :YRClear<cr>

""""""""""""""""""""""""""""""
" => Ruby section
""""""""""""""""""""""""""""""
au FileType ruby set omnifunc=rubycomplete#Complete 
" au FileType ruby let g:rubycomplete_buffer_loading = 1 
" au FileType ruby let g:rubycomplete_classes_in_global = 1


""""""""""""""""""""""""""""""
" => Text (prose) section
""""""""""""""""""""""""""""""
" 2014-11-10, AA: From https://github.com/junegunn/limelight.vim
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
au FileType text Goyo
nnoremap <Leader>G :Goyo<CR>

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
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
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>r :MRU<CR>

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste! paste?<cr>

map <leader>bb :cd ..<cr>

""""""""""""""""""""""""""""""
" => Vim Fuzzyfinder examples
""""""""""""""""""""""""""""""
" <CR> - opens in a previous window.
" <C-j> - opens in a split window.
" <C-k> - opens in a vertical-split window.
" <C-]> - opens in a new tab page. 
" 2012-04-25: Comentado porque era muito pesado (recursivo desde a raiz)
" map <leader>F :FufFile **/<CR>
" map <leader>f :FufFile<CR>
map <leader>f :FufFileWithCurrentBufferDir **/<CR>
map <leader>x :FufBuffer<CR>

" not blinking cursor
set guicursor=n:block-blinkon0-Cursor,v:block-blinkon0-VisualCursor,c-i-ci:ver25-blinkon0-Cursor,r-cr:hor16-blinkon0-Cursor

""""""""""""""""""""""""""""""
" => Vim grep: Falta instalar o grep para o Windows
""""""""""""""""""""""""""""""
" let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
" set grepprg=/bin/grep\ -nH

""""""""""""""""""""""""""""""
" => Command-T: Plug-in giro
" para abrir ficheiros com um
" search rapido, mas precisa
" de ruby instalado, etc.
""""""""""""""""""""""""""""""
" let g:CommandTMaxHeight = 15
" set wildignore+=*.o,*.obj,.git,*.pyc
" noremap <leader>j :CommandT<cr>
" noremap <leader>y :CommandTFlush<cr>

" FIM cenas copiadas do amix_ultimate_vimrc

"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

" cores para a status line
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" 2014-11-04, AA: Vim-sneak, Alternativa ao Easymotion
let g:sneak#streak = 1

" 2014-11-03, AA: Easymotion plug-in
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" 2014-11-04, AA: Substitui pelo Vim-streak
" nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 2014-11-03, END



set runtimepath+=~/.vim/

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'ledger/vim-ledger'
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tinykeymap_vim/'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'idbrii/vim-focusclip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
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
Plug 'elixir-editors/vim-elixir'
Plug 'ahw/vim-pbcopy'
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
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
Plug 'moll/vim-bbye'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'junegunn/goyo.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'aquach/vim-http-client'
Plug 'airblade/vim-gitgutter'
Plug 'vim-utils/vim-husk'
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-mix-format'
Plug 'mcchrish/nnn.vim'
Plug 'tpope/vim-projectionist'
Plug 'sophacles/vim-processing'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-rhubarb'
Plug 'kassio/neoterm'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/vim-emoji'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'ggandor/leap.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'elixir-lang/tree-sitter-elixir'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'ful1e5/onedark.nvim'
Plug 'marrub--/vim-zscript'
Plug 'jeetsukumaran/telescope-buffer-lines.nvim'

if has("macunix")
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
elseif has("unix")
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
  Plug 'junegunn/fzf.vim'
endif

call plug#end()

let mapleader = ","
let g:mapleader = ","

lua << EOF
-- getting the vimrc.lua from ~/.config/nvim/lua/vimrc.lua
local lua_stuff = require('vimrc')
vim.keymap.set('n', '<leader>n', lua_stuff.switch_to_selected_term_window, { desc = 'Switch to the selected term window', noremap = true })

local telescope = require('telescope')
local actions = require("telescope.actions")
telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["-"] = actions.toggle_selection + actions.move_selection_worse,
        ["_"] = actions.toggle_selection + actions.move_selection_better,
        -- smart means it sends everything if nothing is selected 💃
        ["Q"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
            ['<c-d>'] = require('telescope.actions').delete_buffer
        }
      }
    }
  },
}
telescope.load_extension('fzf')
telescope.load_extension('buffer_lines')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>r', builtin.oldfiles, { desc = 'Recently opened files', noremap = true })
vim.keymap.set('n', '<leader>TT', builtin.tags, { desc = '[G]o to C[T]ags (telescope)', noremap = true })
-- vim.keymap.set('n', '<leader>TE', builtin.taglist, { desc = 'Specific taglist', noremap = true })

require('onedark').setup()

require('leap').set_default_keymaps()

local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config({
  kind_labels = kind_labels,
  indicator_errors = "?",
  indicator_warnings = "!",
  indicator_info = "i",
  indicator_hint = "?",
  -- the default is a wide codepoint which breaks absolute and relative
  -- line counts if placed before airline's Z section
  status_symbol = "",
})

local cmp = require('cmp')
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end
      end,
      { "i", "s" }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp_ultisnips_mappings.jump_backwards(fallback)
        end
      end,
      { "i", "s" }
    ),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- C-Space already "fixes" the current list, to allow further refining
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp_signature_help' },
    { name = 'emoji' },
    {
       name = 'buffer',
       option = {
         get_bufnrs = function()
           return vim.api.nvim_list_bufs()
         end
       }
    },
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'treesitter' },
    { name = 'buffer' }
    -- {
    --   name = 'tags',
    --   option = {
    --     -- this is the default options, change them if you want.
    --     -- Delayed time after user input, in milliseconds.
    --     complete_defer = 100,
    --     -- Max items when searching `taglist`.
    --     max_items = 10,
    --     -- The number of characters that need to be typed to trigger
    --     -- auto-completion.
    --     keyword_length = 3,
    --     -- Use exact word match when searching `taglist`, for better search performance.
    --     exact_match = false,
    --     -- Prioritize searching result for current buffer.
    --     current_buffer_only = false,
    --   },
    -- }
  })
})

require("cmp_nvim_ultisnips").setup {
  -- filetype_source = "ultisnips_default",
  filetype_source = "treesitter",
  show_snippets = "expandable",
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local lspconfig = require('lspconfig')

if vim.loop.os_uname().sysname == "Linux" then
    language_server_cmd = "/home/andre/projs/personal/elixir-ls/build/language_server.sh"
else
    language_server_cmd = "/Users/andre/projs/personal/elixir-ls/build/language_server.sh"
end

-- Set up lspconfig.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- BEGIN LEXICAL SETUP
local configs = require("lspconfig.configs")

local lexical_config = {
  filetypes = { "elixir", "eelixir", },
  cmd = { "/home/andre/projs/personal/lexical/build/bin/start_lexical.sh" },
  settings = {},
}

if not configs.lexical then
  configs.lexical = {
    default_config = {
      filetypes = lexical_config.filetypes,
      cmd = lexical_config.cmd,
      root_dir = function(fname)
        return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
      end,
      -- optional settings
      settings = lexical_config.settings,
    },
  }
end

lspconfig.lexical.setup({})
-- END LEXICAL SETUP

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- URL handling
if vim.fn.has "mac" == 1 then
    vim.keymap.set("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', attach_opts)
elseif vim.fn.has "unix" == 1 then
    vim.keymap.set(
        "n",
        "gx",
        '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>',
        attach_opts
    )
else
    vim.keymap.set("n", "gx", function()
        print "Error: gx is not supported on this OS!"
    end, attach_opts)
end

require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex"}, -- only install parsers for elixir and heex
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
}

require'treesitter-context'.setup{
  enable = true,
  max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
}

EOF

"" surround customizations
"" ASCII 111= 'o'
"" ASCII 101= 'e'
let g:surround_111 = "{:ok, \r}"
let g:surround_101 = "{:error, \r}"

function! LspStatus() abort
  let status = luaeval('require("lsp-status").status()')
  return trim(status)
endfunction

call airline#parts#define_function('lsp_status', 'LspStatus')
call airline#parts#define_condition('lsp_status', 'luaeval("#vim.lsp.buf_get_clients() > 0")')

let g:airline#extensions#nvimlsp#enabled = 0
let g:airline_section_warning = airline#section#create_right(['lsp_status'])

let g:processing_no_default_mappings=1

let g:nnn#set_default_mappings = 0

set incsearch
set hlsearch

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

let g:python_host_prog="/usr/bin/python"
let g:python3_host_prog="/usr/bin/python3"

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

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_autoset_pane = 0

" 2017/05/09 10:01:45, AA: Tslime + Neoterm + vim-test stuff
nmap <silent> Q <Plug>SetTmuxVars
nmap <silent> qt :call ChangeTestStrategy()<CR>
nmap <silent> qp :call ChangeElixirTestExecutable()<CR>
nmap <silent> qf :Tmux mix test --failed<CR>
nmap <silent> qw :Tmux mix test.watch <C-R>=fnameescape(expand('%'))<CR><CR>

let g:only_run_changed_tests = 'mix test $(git diff --name-only master | grep _test.exs)'
let g:only_format_changed_files = "mix format $(git diff --name-only master | grep '\.ex\(s\)\?$')"
let g:only_credo_changed_files = "mix credo $(git diff --name-only master | grep '\.ex\(s\)\?$')"

nmap <silent> <leader>Tx :call SendToTmux(g:only_format_changed_files)<CR>:call Send_keys_to_Tmux('Enter')<CR>
nmap <silent> <leader>Tb :call SendToTmux(g:only_run_changed_tests)<CR>:call Send_keys_to_Tmux('Enter')<CR>
nmap <silent> <leader>Tc :call SendToTmux(g:only_credo_changed_files)<CR>:call Send_keys_to_Tmux('Enter')<CR>
nmap <silent> <leader>Ts :w<CR>:TestSuite<CR>
nmap <silent> <leader>Tf :w<CR>:TestFile<CR>
nmap <silent> <leader>t :w<CR>:TestNearest<CR>
nmap <silent> <F8> :w<CR>:TestLast<CR>

let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1
let g:neoterm_automap_keys = '<leader>TZ'

function! ChangeTestStrategy()
    if !exists('g:test#strategy') || g:test#strategy == 'tslime'
        let g:test#strategy = 'neoterm'

        nmap <silent> qq V<Plug>(neoterm-repl-send)
        nmap <silent> qa ggVG<Plug>(neoterm-repl-send)
        vmap Q <Plug>(neoterm-repl-send)
        nmap <silent> <F6> :Tredo<CR>

        echo 'Using neoterm/Term'
    else
        " With tslime, we want to run things in a tmux pane
        let g:test#strategy = 'tslime'

        nmap <silent> qq V<Plug>SendSelectionToTmux
        nmap <silent> qa ggVG<Plug>SendSelectionToTmux<C-o>
        vmap <silent> Q <Plug>SendSelectionToTmux
        nmap <silent> <F6> :call Send_keys_to_Tmux('Up')<CR>:call Send_keys_to_Tmux('Enter')<CR>

        echo 'Using tslime/Tmux'
    endif
endfunction

call ChangeTestStrategy()

function! ChangeElixirTestExecutable()
    if !exists('g:test#elixir#exunit#executable') || g:test#elixir#exunit#executable == 'MIX_ENV=test iex -S mix test --trace'
        let g:test#elixir#exunit#executable = 'MIX_ENV=test mix test'
        echo 'Using regular mix test'
    else
        let g:test#elixir#exunit#executable = 'MIX_ENV=test iex -S mix test --trace'
        echo 'Using mix test --trace w/ IEx'
    endif
endfunction

call ChangeElixirTestExecutable()

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
cnoremap GG GBrowse!
cnoremap %% <C-R>=fnameescape(expand('%'))<CR>
cnoremap %p <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <leader>C :! cp <C-R>=fnameescape(expand('%'))<CR> <C-R>=fnameescape(expand('%:h')).'/'<CR>
nnoremap <leader>M :! mv <C-R>=fnameescape(expand('%'))<CR> <C-R>=fnameescape(expand('%:h')).'/'.fnameescape(expand('%:t:r'))<CR>

" 2017/04/11 09:28:57, AA: visually select the last paste or change
nnoremap <expr> ge '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap gP `[v`]
if has("mac")
  nnoremap gp :read !pbpaste<CR>
else
  nnoremap gp :read !xclip -selection clipboard -o<CR>
endif

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

set ignorecase
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

augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

set nocursorline

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" 2017/02/21 11:54:48, AA: better split opening
set splitbelow
set splitright

set fillchars=stl:\ ,stlnc:\ ,vert:.,fold:-,diff:-

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
    let l:favourite_schemes = ["PaperColor", "neodark", "onedark", "seoul256", "molokai", "harlequin", "atom-dark-256", "railscasts", "deus", "moonfly", "zenburn", "dracula"]
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

    highlight VertSplit guibg=Orange guifg=Black ctermbg=234 ctermfg=3

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

    let g:airline#extensions#fugitiveline#enabled = 1

    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''

    let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}%{airline#util#wrap(airline#extensions#branch#get_head(),80)[0:23]}'

    let g:airline_theme='papercolor'
endfunction

" 2014-11-04, AA: using seoul256
" instead of molokai
if has("gui_running")
  set t_Co=256
  set background=dark
  colorscheme seoul256
else
  call ChangeSchemeWithIndex(1)
endif

set colorcolumn=121

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
filetype plugin indent on
set wrap "Wrap lines
set textwidth=1000 "por defeito sao 500 apenas

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
map <silent> <leader><leader> :noh<cr>:GitGutterAll<cr>

" let g:mix_format_on_save = 1

" TODO: Revise this, since emojis aren't being shown with alacritty
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')

" set completefunc=emoji#complete

" Tinykeymap now associates by default the windows mode with <mapleader>W
let g:tinykeymap#map#windows#map = "<C-W>"

call tinykeymap#EnterMap('lsp', 'K', {'name': 'LSP mode'})
call tinykeymap#Map('lsp', 'f', 'lua vim.lsp.buf.format()')
call tinykeymap#Map('lsp', 'h', 'lua vim.lsp.buf.hover()')
call tinykeymap#Map('lsp', 'r', 'lua vim.lsp.buf.references()')
call tinykeymap#Map('lsp', 'i', 'LspInfo')
call tinykeymap#Map('lsp', 's', 'lua vim.diagnostic.open_float()')
call tinykeymap#Map('lsp', 'p', 'lua vim.diagnostic.goto_prev()')
call tinykeymap#Map('lsp', 'n', 'lua vim.diagnostic.goto_next()')
call tinykeymap#Map('lsp', 'H', 'lua vim.diagnostic.hide()')
call tinykeymap#Map('lsp', 'S', 'lua vim.diagnostic.show()')

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gH <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

" 2016/11/08 11:41:14, AA: From http://tex.stackexchange.com/a/3655/65117
" Because IMAP_JumpForward was taking the C-j mapping
" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

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

au BufNewFile,BufRead *.puml nnoremap <silent> <F5> :! rm -f %:t:r.png && plantuml % && open %:t:r.png<CR>

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
set completeopt=menu,menuone,noselect

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
" Y yanks until the end (g_ = non-blank character)
map Y yg_

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

" places on the 't' register the penultimate tmux pane line
function! CopyPenultimateLineFromTmuxPane()
    " capture-pane -p captures the full pane contents
    " awk NF removes empty lines
    " tail -2 gets the last 2 lines
    " head -1 gets the first of the last 2 lines
    let l:tmux_pane = g:tslime['pane']
    let @t = system("tmux capture-pane -p -t " . l:tmux_pane . " | awk NF | tail -2 | head -1")
endfunction

au Filetype elixir nmap <leader>p orequire IEx; IEx.pry<Esc>
au Filetype elixir nmap <silent> <leader>L :MixFormat<CR>
au Filetype elixir nmap <silent> <F5> :Tmux recompile<CR>
au Filetype elixir nmap <silent> qc :call CopyPenultimateLineFromTmuxPane()<CR><C-R>"tp

""""""""""""""""""""""""""""""
" => Ruby section
""""""""""""""""""""""""""""""
au FileType ruby set omnifunc=rubycomplete#Complete
au FileType ruby set shiftwidth=2
au Filetype ruby nmap <leader>p orequire "pry"; binding.pry<Esc>
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
  autocmd FileType markdown,mkd call lexical#init()
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

au FileType json nmap =j :%!python3 -m json.tool<CR>

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

"Quickly open a buffer for scribble
map <leader>q :e ~/Dropbox/etc/scratchpad.txt<cr>
au BufRead,BufNewFile ~/Dropbox/etc/scratchpad.txt iab <buffer> xh1 ============================ <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr> ========

map <leader>bb :cd ..<cr>

"""""""""""""""""""""""""""""""""""""""""""""
" => 2015-03-31 22:41:34, AA: Vim Unite Stuff
"""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F10> :Unite -vertical -winwidth=50 outline<CR>
nnoremap <F7> :UniteWithCursorWord -immediately tag<CR>

function! UltisnipsToggleAutotrigger() abort
    if exists('#UltiSnips_AutoTrigger')
        au! UltiSnips_AutoTrigger
        aug! UltiSnips_AutoTrigger
        echom '[UltiSnips AutoTrigger] OFF'
    else
        augroup UltiSnips_AutoTrigger
            au!
            au InsertCharPre,TextChangedI,TextChangedP * call UltiSnips#TrackChange()
        augroup END
        echom '[UltiSnips AutoTrigger] ON'
    endif
endfu

nnoremap <silent> cou :<c-u>call UltisnipsToggleAutotrigger()<cr>

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
nmap <silent> <Space> <cmd>lua require('telescope.builtin').buffers()<CR>

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

let fzf_source_command = 'rg --files --hidden --follow --glob "!.git/*" --glob "!*.rbi" --glob "!.next/*" --glob "!node_modules/*"'

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
\ 'source':  'rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!*.rbi" --glob "!.next/*" --glob "!node_modules/*"',
\ 'sink*':   function('<sid>rg_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ previewer = false })<CR>
nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files({default_text = vim.fn.cWORD_lowercase(), previewer = false })<CR>
nnoremap <leader>l <cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true })<CR>

command! -nargs=* FzfAg call fzf#run({
\ 'source':  printf('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always" --glob "!.git/*" --glob "!.next/*" --glob "!node_modules/*" "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':   function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

nnoremap <leader>G <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<CR>

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

lua << EOF
  local function cword_lowercase(word)
    local word = word or vim.fn.expand("<cword>")

    -- adapted from https://codegolf.stackexchange.com/a/177958
    word = word:gsub('%f[^%l]%u','_%1')
    word = word:gsub('%f[^%a]%d','_%1')
    word = word:gsub('%f[^%d]%a','_%1')
    word = word:gsub('(%u)(%u%l)','%1_%2')

    return word:lower()
  end

  local function cWORD_lowercase()
    local word = vim.fn.expand("<cWORD>")

    local result = ""

    for part in string.gmatch(word, "([^.]+)") do
        result = result .. " " .. cword_lowercase(part)
    end

    -- trim the result
    result = string.gsub(result, "^%s*(.-)%s*$", "%1")

    print("Searching for:" .. result)

    return result
  end

  local function get_table_keys(t)
    local keys={}
    for key,_ in pairs(t) do
      table.insert(keys, key)
    end
    return keys
  end

  local function taglist_for_expr(expr)
    expr = expr or ""
    local taglist = vim.fn.taglist(expr)

    print("Searching taglist for:" .. expr)

    for k,v in pairs(taglist) do
        print("ENTRY:" .. k)
        keys = get_table_keys(v)

        for value_key, value_value in pairs(v) do
        print("VALUE (inside):" .. value_key .. "=" .. value_value)
        end
    end

    return taglist
  end

  vim.fn.cword_lowercase = cword_lowercase
  vim.fn.cWORD_lowercase = cWORD_lowercase
  vim.fn.taglist_for_expr = taglist_for_expr
EOF

" 2014-11-03, AA: Easymotion plug-in
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 2014-11-03, END

set number
set list

let g:terraform_fmt_on_save=1

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
  let l:suggested_command = "Git push origin " . l:branch

  if exists('a:1')
      call AskCommandWithSuggestion(l:suggested_command, a:1)
  else
      call AskCommandWithSuggestion(l:suggested_command)
  endif
endfunction

function! OpenRemoteGitlabMR()
    let l:gitlab_mr_url = GetRemoteGitlabMergeRequestURL()

    call jobstart(["open", l:gitlab_mr_url], {"detach": v:true})
endfunction

" https://gitlab.com/remote-com/employ-starbase/tiger/-/merge_requests/new?merge_request%5Bsource_branch%5D=feat%2F11396-permissions-dont-define-properties
" project = employ-starbase/tiger
" /-/merge_requests/new?merge_request%5Bsource_branch%5D=
" current branch = feat%2F11396-permissions-dont-define-properties
function! GetRemoteGitlabMergeRequestURL()
  let l:project_command = "git remote -v | awk '{print $2}' | sed 's/git@gitlab.com://g' | sed 's/.git//g' | uniq | tr -d '\n'"
  let l:project = system(l:project_command)

  let l:current_branch = GitCurrentBranch()

  let l:url = "https://gitlab.com/" . l:project
  let l:url = l:url . "/-/merge_requests/new?merge_request%5bsource_branch%5d="
  let l:url = l:url . l:current_branch

  return l:url
endfunction

call tinykeymap#EnterMap('git', 'gj', {'name': 'Git mode'})
call tinykeymap#Map('git', '<space>', 'Git')
" MR
call tinykeymap#Map('git', 'm', 'call OpenRemoteGitlabMR()')
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
" checkouts
call tinykeymap#Map('git', 'cd', 'call AskCommandWithSuggestion("Git checkout development")')
call tinykeymap#Map('git', 'cf', 'call AskCommandWithSuggestion("Git checkout feature/")')
call tinykeymap#Map('git', 'cc', 'call AskCommandWithSuggestion("Git checkout ")')
" logs
call tinykeymap#Map('git', 'pp', 'Telescope git_commits')
call tinykeymap#Map('git', 'pb', 'Telescope git_bcommits')
" hunks
call tinykeymap#Map('git', 'N', 'GitGutterPrevHunk')
call tinykeymap#Map('git', 'n', 'GitGutterNextHunk')
call tinykeymap#Map('git', 'v', 'GitGutterPreviewHunk')
call tinykeymap#Map('git', 'g', 'GitGutterStageHunk')

call tinykeymap#Map('git', 'l', 'Glog')
call tinykeymap#Map('git', 'e', 'Gedit')
call tinykeymap#Map('git', 'st', 'Git stash')
call tinykeymap#Map('git', 'sp', 'Git stash pop')
call tinykeymap#Map('git', 'bl', 'Git blame')
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
cmap w!! exec 'w !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'

" augroup sort_imports
"     autocmd!
"     autocmd BufWritePre /Users/andre/projs/remote/tiger/**/*.ex,/Users/andre/projs/remote/tiger/**/*.exs silent! mkview! | silent! g/^\(\(alias\)\@!.\)*$\n\s*alias/+1,/\s*alias.*$\n^\(\(alias\)\@!.\)*$/ sort i
"     autocmd BufWritePost /Users/andre/projs/remote/tiger/**/*.ex,/Users/andre/projs/remote/tiger/**/*.exs silent! loadview
" augroup end


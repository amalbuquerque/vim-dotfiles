local plugins = {
    { url = 'git@github.com:Lokaltog/vim-easymotion.git' },
    { url = 'git@github.com:Shougo/neomru.vim.git' },
    { url = 'git@github.com:Shougo/unite.vim.git' },
    { url = 'git@github.com:gosukiwi/vim-atom-dark.git' },
    { url = 'git@github.com:junegunn/limelight.vim.git' },
    { url = 'git@github.com:junegunn/seoul256.vim.git' },
    { url = 'git@github.com:ledger/vim-ledger.git' },
    { url = 'git@github.com:tomtom/tlib_vim.git' },
    { url = 'git@github.com:tomtom/tinykeymap_vim.git' },
    { url = 'git@github.com:MarcWeber/vim-addon-mw-utils.git' },
    { url = 'git@github.com:SirVer/ultisnips.git' },
    { url = 'git@github.com:honza/vim-snippets.git' },
    { url = 'git@github.com:idbrii/vim-focusclip.git' },
    { url = 'git@github.com:tpope/vim-commentary.git' },
    { url = 'git@github.com:tpope/vim-fugitive.git' },
    { url = 'git@github.com:tpope/vim-repeat.git' },
    { url = 'git@github.com:tpope/vim-sensible.git' },
    { url = 'git@github.com:tpope/vim-speeddating.git' },
    {
        'tpope/vim-surround',
        event = "VeryLazy",
        keys = {
            { "cs", "<Plug>Csurround", desc = "change surrounding #1 by #2" },
            { "ds", "<Plug>Dsurround", desc = "delete surrounding #1" },
            { "cS", "<Plug>CSurround", desc = "change surrounding #1 by #2 + new line" },
            { "ys", "<Plug>Ysurround", desc = "wraps #1 in #2 (surround)" },
            { "yS", "<Plug>YSurround", desc = "wraps #1 in #2 (surround) + new line" },
            { "yss", "<Plug>Yssurround", desc = "wraps line in #1 (surround)" },
            { "ySs", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            { "ySS", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            { "S", "<Plug>VSurround", desc = "wraps visual selection in #1 (surround)", mode = "x" },
            { "gS", "<Plug>VgSurround", desc = "wraps visual selection in #1 (surround) + new line", mode = "x" },
        },
        init = function()
            -- surround customizations
            -- ASCII 111= 'o'
            -- ASCII 101= 'e'
            vim.g.surround_111 = "{:ok, \r}"
            vim.g.surround_101 = "{:error, \r}"

            vim.g.surround_no_mappings = 1
        end
    },
    { url = 'git@github.com:pangloss/vim-javascript.git' },
    { url = 'git@github.com:terryma/vim-expand-region.git' },
    { url = 'git@github.com:Raimondi/delimitMate.git' },
    { url = 'git@github.com:rhysd/clever-f.vim.git' },
    { url = 'git@github.com:ChesleyTan/wordCount.vim.git' },
    { url = 'git@github.com:tpope/vim-unimpaired.git' },
    { url = 'git@github.com:tpope/vim-rails.git' },
    { url = 'git@github.com:Shougo/neoyank.vim.git' },
    { url = 'git@github.com:Shougo/vimproc.vim.git' },
    { url = 'git@github.com:tpope/vim-git.git' },
    { url = 'git@github.com:tsukkee/unite-tag.git' },
    { url = 'git@github.com:Shougo/unite-outline.git' },
    { url = 'git@github.com:christoomey/vim-tmux-navigator.git' },
    { url = 'git@github.com:tomasr/molokai.git' },
    { url = 'git@github.com:elixir-editors/vim-elixir.git' },
    { url = 'git@github.com:ahw/vim-pbcopy.git' },
    { url = 'git@github.com:junegunn/vim-easy-align.git' },
    { url = 'git@github.com:bkad/CamelCaseMotion.git' },
    { url = 'git@github.com:kana/vim-textobj-user.git' },
    { url = 'git@github.com:reedes/vim-textobj-sentence.git' },
    { url = 'git@github.com:reedes/vim-textobj-quote.git' },
    { url = 'git@github.com:jgdavey/tslime.vim.git' },
    { url = 'git@github.com:janko-m/vim-test.git' },
    { url = 'git@github.com:nielsmadan/harlequin.git' },
    {
        'git@github.com:svermeulen/vim-easyclip.git',
        init = function()
          vim.g.EasyClipUseGlobalPasteToggle = 0
        end
    },
    { url = 'git@github.com:Konfekt/FastFold.git' },
    { url = 'git@github.com:ajmwagar/vim-deus.git' },
    { url = 'git@github.com:bluz71/vim-moonfly-colors.git' },
    { url = 'git@github.com:KeitaNakamura/neodark.vim.git' },
    { url = 'git@github.com:romainl/vim-qf.git' },
    { url = 'git@github.com:tpope/tpope-vim-abolish.git' },
    { url = 'git@github.com:jnurmine/Zenburn.git' },
    { url = 'git@github.com:dracula/vim.git' },
    { url = 'git@github.com:EdenEast/nightfox.nvim.git' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { url = 'git@github.com:moll/vim-bbye.git' },
    { url = 'git@github.com:reedes/vim-pencil.git' },
    { url = 'git@github.com:reedes/vim-lexical.git' },
    { url = 'git@github.com:junegunn/goyo.vim.git' },
    { url = 'git@github.com:NLKNguyen/papercolor-theme.git' },
    {
        url = 'git@github.com:aquach/vim-http-client.git',
        init = function()
          vim.g.http_client_bind_hotkey = 0

          vim.keymap.set('n', '<leader>x', ':HTTPClientDoRequest<CR>', { desc = 'Perform HTTP request', noremap = true })
        end
    },
    { url = 'git@github.com:airblade/vim-gitgutter.git' },
    { url = 'git@github.com:vim-utils/vim-husk.git' },
    { url = 'git@github.com:gregsexton/gitv.git' },
    { url = 'git@github.com:mhinz/vim-mix-format.git' },
    { url = 'git@github.com:mcchrish/nnn.vim.git' },
    { url = 'git@github.com:tpope/vim-projectionist.git' },
    { url = 'git@github.com:sophacles/vim-processing.git' },
    { url = 'git@github.com:skywind3000/asyncrun.vim.git' },
    { url = 'git@github.com:tpope/vim-rhubarb.git' },
    { url = 'git@github.com:kassio/neoterm.git' },
    { url = 'git@github.com:hashivim/vim-terraform.git' },
    { url = 'git@github.com:junegunn/vim-emoji.git' },
    { url = 'git@github.com:neovim/nvim-lspconfig.git' },
    { url = 'git@github.com:hrsh7th/cmp-nvim-lsp.git' },
    { url = 'git@github.com:hrsh7th/cmp-buffer.git' },
    { url = 'git@github.com:hrsh7th/cmp-path.git' },
    { url = 'git@github.com:hrsh7th/cmp-cmdline.git' },
    { url = 'git@github.com:hrsh7th/cmp-emoji.git' },
    { url = 'git@github.com:hrsh7th/nvim-cmp.git' },
    { url = 'git@github.com:hrsh7th/cmp-nvim-lsp-signature-help.git' },
    { url = 'git@github.com:quangnguyen30192/cmp-nvim-ultisnips.git' },
    { url = 'git@github.com:quangnguyen30192/cmp-nvim-tags.git' },
    { url = 'git@github.com:ludovicchabant/vim-gutentags.git' },
    { url = 'git@github.com:shumphrey/fugitive-gitlab.vim.git' },
    { url = 'git@github.com:nvim-lua/lsp-status.nvim.git' },
    {
        url = 'git@github.com:ggandor/leap.nvim.git',
        config = function(_, opts)
          local leap = require("leap")
          for k, v in pairs(opts) do
            leap.opts[k] = v
          end
          -- only set leap on normal and insert mode
          vim.keymap.set({'n', 'o'}, 's',  '<Plug>(leap-forward)')
          vim.keymap.set({'n', 'o'}, 'S',  '<Plug>(leap-backward)')
          vim.keymap.set({'n', 'o'}, 'gs', '<Plug>(leap-from-window)')
          -- perform action in a remote location
          vim.keymap.set({'n', 'o'}, 'gS', function ()
            require('leap.remote').action()
          end)
        end
    },
    { url = 'git@github.com:folke/lsp-colors.nvim.git' },
    { url = 'git@github.com:kyazdani42/nvim-web-devicons.git' },
    { url = 'git@github.com:folke/trouble.nvim.git' },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {},
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        dependencies = {
          "RRethy/nvim-treesitter-endwise",
        },
    },

    {
      'MeanderingProgrammer/treesitter-modules.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      lazy = false,
      keys = {
        { "<A-v>", desc = "Start TS Selection" },
        { "<v>",   desc = "Increment Selection Node",  mode = "x" },
        { "<gv>",  desc = "Increment Selection Scope", mode = "x" },
        { "<V>",   desc = "Shrink selection",         mode = "x" },
      },
      opts = {
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "comment",
          "css",
          "dockerfile",
          "eex",
          "elixir",
          "elm",
          "erlang",
          "go",
          "gomod",
          "hcl",
          -- "heex",
          -- "help",
          "html",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "ruby",
          "rust",
          "scss",
          "terraform",
          "tmux",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        fold = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<A-v>",
            node_incremental = "v",
            scope_incremental = "gv",
            node_decremental = "V",
          },
        },
      },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function(_, opts)
            require('treesitter-context').setup({
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                        'for',
                        'while',
                        'if',
                        'switch',
                        'case',
                    },
                    markdown = {
                        'section',
                    },
                    elixir = {
                        'anonymous_function',
                        'arguments',
                        'block',
                        'do_block',
                        'list',
                        'map',
                        'tuple',
                        'quoted_content',
                    },
                    json = {
                        'pair',
                    },
                    yaml = {
                        'block_mapping_pair',
                    },
                }
            })
        end
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
      branch = "main",
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
      },
      keys = {
        {
          "af",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
          end,
          desc = "Select outer function",
          mode = { "x", "o" },
        },
        {
          "if",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
          end,
          desc = "Select inner function",
          mode = { "x", "o" },
        },
        {
          "ac",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
          end,
          desc = "Select outer class",
          mode = { "x", "o" },
        },
        {
          "ic",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
          end,
          desc = "Select inner class",
          mode = { "x", "o" },
        },
        {
          "ar",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
          end,
          desc = "Select outer block",
          mode = { "x", "o" },
        },
        {
          "ir",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
          end,
          desc = "Select inner block",
          mode = { "x", "o" },
        },
        {
          "as",
          function()
            require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
          end,
          desc = "Select local scope",
          mode = { "x", "o" },
        },
      },
      ---@module "nvim-treesitter-textobjects"
      opts = { multiwindow = true },
    },
    { url = 'git@github.com:elixir-lang/tree-sitter-elixir.git' },
    { url = 'git@github.com:nvim-lua/plenary.nvim.git' },
    { url = 'git@github.com:nvim-telescope/telescope.nvim.git' },
    { url = 'git@github.com:nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { url = 'git@github.com:ful1e5/onedark.nvim.git' },
    { url = 'git@github.com:marrub--/vim-zscript.git' },
    { url = 'git@github.com:jeetsukumaran/telescope-buffer-lines.nvim.git' },
    { url = 'git@github.com:bfredl/nvim-luadev.git' },
    { url = 'git@github.com:junegunn/fzf.git', dir = '~/.fzf', build = '.install --all' },
    { url = 'git@github.com:junegunn/fzf.vim.git' },
    { "saghen/blink.cmp" },
    {
      "folke/sidekick.nvim",
      event = "VeryLazy",
      -- Next Edit Suggestions need a Copilot subscription, which I don't have :/
      opts = { nes = { enabled = false } },
      keys = {
        {
          "<c-.>",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle",
          mode = { "n", "t", "i", "x" },
        },
        {
          "<leader>aa",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle CLI",
        },
        {
          "<leader>as",
          function() require("sidekick.cli").select({ filter = { installed = true } }) end,
          desc = "Select CLI",
        },
        {
          "<leader>ad",
          function() require("sidekick.cli").close() end,
          desc = "Detach a CLI Session",
        },
        {
          "<leader>at",
          function() require("sidekick.cli").send({ msg = "{this}" }) end,
          mode = { "x", "n" },
          desc = "Send This",
        },
        {
          "<leader>af",
          function() require("sidekick.cli").send({ msg = "{file}" }) end,
          desc = "Send File",
        },
        {
          "<leader>av",
          function() require("sidekick.cli").send({ msg = "{selection}" }) end,
          mode = { "x" },
          desc = "Send Visual Selection",
        },
        {
          "<leader>ap",
          function() require("sidekick.cli").prompt() end,
          mode = { "n", "x" },
          desc = "Sidekick Select Prompt",
        },
        -- Example of a keybinding to open Claude directly
        {
          "<leader>ac",
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        },
      },
    },
    {
      url = 'git@github.com:andymass/vim-matchup.git',
      -- `opts` mechanism built into `lazy.nvim`.
      -- Calls `require('match-up').setup` under the hood
      opts = {
        treesitter = {
          stopline = 500,
        }
      }
    }
}

return plugins;

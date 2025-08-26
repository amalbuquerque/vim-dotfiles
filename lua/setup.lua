-- getting the vimrc.lua from ~/.config/nvim/lua/stuff.lua
local lua_stuff = require('stuff')

-- Claudius as a simple way to interact with LLMs
local claudius_chat = require('claudius_chat')
vim.keymap.set('v', '<leader>CC', claudius_chat.handle_visual_selection, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>CC', claudius_chat.toggle_chat, { silent = true, noremap = true })

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = { '*.chat' },
    callback = function()
        vim.schedule(function()
            vim.keymap.set('n', '<C-s>', '<cmd>ClaudiusSend<cr>', { buffer=0, silent = true, noremap = true })
            vim.keymap.set('i', '<C-s>', '<cmd>ClaudiusSendAndInsert<cr>', { buffer=0, silent = true, noremap = true })
            vim.keymap.set('n', '<Leader><', '<cmd>ClaudiusNextMessage<cr>', { buffer=0, silent = true, noremap = true })
            vim.keymap.set('n', '<Leader>>', '<cmd>ClaudiusPrevMessage<cr>', { buffer=0, silent = true, noremap = true })
        end)
    end
})

vim.keymap.set('n', '<leader>n', lua_stuff.switch_to_selected_term_window, { desc = 'Switch to the selected term window', noremap = true })

local telescope = require('telescope')
local actions = require("telescope.actions")

telescope.setup{
  defaults = {
    preview = {
      hide_on_startup = true -- hide previewer when picker starts
    },
    mappings = {
      n = {
        ["-"] = actions.toggle_selection + actions.move_selection_better,
        ["_"] = actions.toggle_selection + actions.move_selection_worse,
        -- smart means it sends everything if nothing is selected 💃
        ["Q"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-/>"] = actions.which_key,
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<C-s>'] = require("telescope.actions.layout").toggle_preview
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
    language_server_cmd = '/home/andre/projs/personal/elixir-ls/build/language_server.sh'
else
    language_server_cmd = '/Users/andre/projs/personal/elixir-ls/build/language_server.sh'
end

-- Set up lspconfig for Lexical
vim.lsp.config('lexical', {
    cmd = { '/home/andre/projs/personal/lexical/build/bin/start_lexical.sh' },
})

vim.lsp.enable('lexical')

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
  ensure_installed = {
      "elixir",
      "heex",
      "eex",
      "vim",
      "lua",
      "vimdoc",
      "luadoc",
      "markdown",
      "ruby",
      "python"
  },
  auto_install = true,
  sync_install = false,
  ignore_install = { },
  highlight = { enable = true },
  indent = { enable = true },
  endwise = { enabled = true },
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

-- from https://github.com/neovim/neovim/discussions/28010#discussioncomment-10187140
function my_paste(reg)
    return function(lines)
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')
    end
end

if (os.getenv('SSH_TTY') ~= nil) then
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ["+"] = my_paste("+"),
        ["*"] = my_paste("*"),
    },
}
end

require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics', 'lsp_status'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
})

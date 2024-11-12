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
        keys = {
            { "cs", "<Plug>Csurround", desc = "change surrounding #1 by #2" },
            { "ds", "<Plug>Dsurround", desc = "delete surrounding #1" },
            { "cS", "<Plug>CSurround", desc = "change surrounding #1 by #2 + new line" },
            { "ys", "<Plug>Ysurround", desc = "wraps #1 in #2 (surround)" },
            { "yS", "<Plug>YSurround", desc = "wraps #1 in #2 (surround) + new line" },
            { "yss", "<Plug>Yssurround", desc = "wraps line in #1 (surround)" },
            { "ySs", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            { "ySS", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            { "gs", "<Plug>VSurround", desc = "wraps visual selection in #1 (surround)", mode = "x" },
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
    { url = 'git@github.com:svermeulen/vim-easyclip.git' },
    { url = 'git@github.com:Konfekt/FastFold.git' },
    { url = 'git@github.com:ajmwagar/vim-deus.git' },
    { url = 'git@github.com:bluz71/vim-moonfly-colors.git' },
    { url = 'git@github.com:KeitaNakamura/neodark.vim.git' },
    { url = 'git@github.com:romainl/vim-qf.git' },
    { url = 'git@github.com:tpope/tpope-vim-abolish.git' },
    { url = 'git@github.com:jnurmine/Zenburn.git' },
    { url = 'git@github.com:dracula/vim.git' },
    { url = 'git@github.com:bling/vim-airline.git' },
    { url = 'git@github.com:vim-airline/vim-airline-themes.git' },
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
        keys = {
          { "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
          { "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
          { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
        },
        config = function(_, opts)
          local leap = require("leap")
          for k, v in pairs(opts) do
            leap.opts[k] = v
          end
          leap.add_default_mappings(true)
          vim.keymap.del({ "x", "o" }, "x")
          vim.keymap.del({ "x", "o" }, "X")
        end
    },
    { url = 'git@github.com:folke/lsp-colors.nvim.git' },
    { url = 'git@github.com:kyazdani42/nvim-web-devicons.git' },
    { url = 'git@github.com:folke/trouble.nvim.git' },
    { url = 'git@github.com:nvim-treesitter/nvim-treesitter.git' },
    { url = 'git@github.com:nvim-treesitter/nvim-treesitter-context.git' },
    { url = 'git@github.com:RRethy/nvim-treesitter-endwise.git' },
    { url = 'git@github.com:elixir-lang/tree-sitter-elixir.git' },
    { url = 'git@github.com:nvim-lua/plenary.nvim.git' },
    { url = 'git@github.com:nvim-telescope/telescope.nvim.git' },
    { url = 'git@github.com:nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { url = 'git@github.com:ful1e5/onedark.nvim.git' },
    { url = 'git@github.com:marrub--/vim-zscript.git' },
    { url = 'git@github.com:jeetsukumaran/telescope-buffer-lines.nvim.git' },
    { url = 'git@github.com:bfredl/nvim-luadev.git' },
    { url = 'git@github.com:junegunn/fzf.git', dir = '~/.fzf', build = '.install --all' },
    { url = 'git@github.com:junegunn/fzf.vim.git' }
}

return plugins;

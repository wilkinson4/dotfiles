local plugins = {
    { 'nathom/tmux.nvim',     config = function() require('config.tmux') end },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('config.telescope') end
    },
    {
        'nvim-telescope/telescope-github.nvim',
        config = function() require('config.telescope-github') end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/popup.nvim',
    {
        'rlch/github-notifications.nvim',
        config = function() require('config.github-notifications') end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
    },
    'nvim-telescope/telescope-media-files.nvim',
    'sheerun/vim-polyglot',
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    'folke/lsp-colors.nvim',

    -- LSP
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    'hrsh7th/nvim-cmp',
    { 'hrsh7th/cmp-buffer',   branch = 'main' },
    { 'hrsh7th/cmp-path',     branch = 'main' },
    { 'hrsh7th/cmp-calc',     branch = 'main' },
    { 'hrsh7th/cmp-nvim-lsp', branch = 'main' },
    { 'hrsh7th/cmp-nvim-lua', branch = 'main' },
    { 'hrsh7th/cmp-cmdline',  branch = 'main' },
    { "petertriho/cmp-git",   dependencies = "nvim-lua/plenary.nvim" },
    { 'L3MON4D3/LuaSnip',     config = function() require('snippets') end },
    'saadparwaiz1/cmp_luasnip',
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    { 'nvim-lualine/lualine.nvim',            config = function() require('config.lualine') end },

    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                open_on_tab = true
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },
    { 'mfussenegger/nvim-lint',               config = function() require('config.lint') end },
    { 'mhartington/formatter.nvim',           config = function() require('config.formatter') end },
    { 'jose-elias-alvarez/nvim-lsp-ts-utils', branch = 'main' },
    -- Better syntax
    'windwp/nvim-ts-autotag',
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    'bash', 'bibtex', 'c', 'c_sharp', 'clojure', 'cmake', 'comment', 'commonlisp', 'cooklang', 'cpp',
                    'css',
                    'dockerfile', 'dot', 'eex', 'elixir',
                    'elm', 'erlang', 'fish', 'fortran', 'gdscript', 'gleam', 'glsl', 'go', 'godot_resource', 'gomod',
                    'gowork',
                    'graphql', 'haskell', 'heex',
                    'html', 'http', 'java', 'javascript', 'jsdoc', 'json', 'kotlin', 'latex', 'llvm', 'lua', 'make',
                    'norg', 'ocaml',
                    'ocaml_interface',
                    'ocamllex', 'perl', 'php', 'python', 'query', 'regex', 'ruby', 'rust', 'scala', 'scss', 'surface',
                    'svelte',
                    'swift', 'teal', 'tlaplus',
                    'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml', 'zig', 'vimdoc'
                    -- 'markdown', -- experimental
                },
                highlight = {
                    enabled = true, -- false will disable the whole extension
                    disable = {}    -- list of language that will be disabled
                },
                playground = { enable = true },
                autotag = { enable = true },
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { "BufWrite", "CursorHold" },
                },
            }
        end
    },
    'nvim-treesitter/playground',
    -- Better LSP experience
    'onsails/lspkind-nvim',
    { 'ray-x/lsp_signature.nvim', config = function() require('lsp_signature') end },
    'christoomey/vim-tmux-navigator',
    'lukas-reineke/indent-blankline.nvim',

    'simnalamburt/vim-mundo',
    'tpope/vim-fugitive',
    'stefandtw/quickfix-reflector.vim',
    'mattn/emmet-vim',

    'junegunn/limelight.vim',

    'kassio/neoterm',
    'thinca/vim-quickrun',
    'tpope/vim-dispatch',
    'godlygeek/tabular',
    'chrisbra/csv.vim',
    'junegunn/vim-peekaboo',

    'nathanaelkane/vim-indent-guides',
    'ap/vim-css-color',
    'guns/xterm-color-table.vim',
    'vim-scripts/AnsiEsc.vim',

    'machakann/vim-highlightedyank',
    'Raimondi/delimitMate',
    'tpope/vim-commentary',
    'ntpeters/vim-better-whitespace',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    { 'kylechui/nvim-surround',   config = function() require('config.surround') end },
    'tpope/vim-abolish',
    'tpope/vim-scriptease',
    'tpope/vim-speeddating',
    'tpope/vim-vinegar',
    'tpope/vim-rsi',

    'wannesm/wmgraphviz.vim',
    'rhysd/git-messenger.vim',

    'turbio/bracey.vim',
    {
        'tpope/vim-dadbod',
        dependencies = { 'kristijanhusak/vim-dadbod-ui', 'kristijanhusak/vim-dadbod-completion' },
        config = function() require('config.dadbod').setup() end
    },
    'tpope/vim-endwise',
    { 'kana/vim-textobj-entire',             dependencies = { 'kana/vim-textobj-user' } },
    { 'kana/vim-textobj-indent',             dependencies = { 'kana/vim-textobj-user' } },
    { 'kana/vim-textobj-line',               dependencies = { 'kana/vim-textobj-user' } },
    { 'sgur/vim-textobj-parameter',          dependencies = { 'kana/vim-textobj-user' } },
    { 'Julian/vim-textobj-variable-segment', dependencies = { 'kana/vim-textobj-user' } },
    { 'Chun-Yang/vim-textobj-chunk',         dependencies = { 'kana/vim-textobj-user' } },
    'exu/pgsql.vim',
    'triglav/vim-visual-increment',
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
        -- tag = 'release' -- To  the latest release
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    'mbbill/undotree',
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },
    { "mhanberg/output-panel.nvim", config = function() require('output_panel').setup {} end },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },
}

return plugins

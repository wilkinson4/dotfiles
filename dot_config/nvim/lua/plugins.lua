require('packer').startup({
    function(use)
        -- Packer can manage itself
        use { 'wbthomason/packer.nvim' }
        use({ 'nathom/tmux.nvim', config = [[require('config.tmux')]] })
        -- Telescope
        use({
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = [[require('config.telescope')]]
        })
        use({
            'nvim-telescope/telescope-github.nvim',
            config = function() require('config.telescope-github') end,
        })
        use { 'nvim-telescope/telescope-ui-select.nvim' }
        use { 'nvim-lua/popup.nvim' }
        use { 'rlch/github-notifications.nvim', config = [[require('config.github-notifications')]] }
        use 'nvim-telescope/telescope-media-files.nvim' -- Colors/Color Scheme
        -- use 'olimorris/onedarkpro.nvim'
        use 'sheerun/vim-polyglot'
        -- needed for lightline color scheme
        use 'phanviet/vim-monokai-pro'
        -- used for syntax
        use 'tanvirtin/monokai.nvim'
        use 'folke/lsp-colors.nvim'

        -- LSP
        use { 'neovim/nvim-lspconfig' }
        use {
            "williamboman/mason.nvim",
            run = ":MasonUpdate" -- :MasonUpdate updates registry contents
        }
        use { 'tjdevries/nlua.nvim' }
        use { 'hrsh7th/nvim-cmp' }
        use { 'hrsh7th/cmp-buffer', branch = 'main' }
        use { 'hrsh7th/cmp-path', branch = 'main' }
        use { 'hrsh7th/cmp-calc', branch = 'main' }
        use { 'hrsh7th/cmp-nvim-lsp', branch = 'main' }
        use { 'hrsh7th/cmp-nvim-lua', branch = 'main' }
        use { 'hrsh7th/cmp-cmdline', branch = 'main' }
        use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
        use({ 'L3MON4D3/LuaSnip', config = function() require('snippets') end })
        use('saadparwaiz1/cmp_luasnip')

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons' -- optional, for file icon
            }
        }
        use 'ryanoasis/vim-devicons'
        use 'kyazdani42/nvim-web-devicons'
        use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }
        -- use 'scrooloose/nerdtree'
        -- use 'Xuyuanp/nerdtree-git-plugin'
        use 'tiagofumo/vim-nerdtree-syntax-highlight'

        use {
            'folke/trouble.nvim',
            config = function()
                require('trouble').setup {
                    open_on_tab = true
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        use({ 'mfussenegger/nvim-lint', config = function() require('config.lint') end })
        use({ 'mhartington/formatter.nvim', config = function() require('config.formatter') end })
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', branch = 'main' })
        -- Better syntax
        use { 'windwp/nvim-ts-autotag' }
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'nvim-treesitter/playground' }
        use { 'p00f/nvim-ts-rainbow' }
        -- Better LSP experience
        use { 'onsails/lspkind-nvim' }
        use { 'ray-x/lsp_signature.nvim', config = function() require('lsp_signature') end }
        use 'christoomey/vim-tmux-navigator'
        use 'lukas-reineke/indent-blankline.nvim'

        use 'simnalamburt/vim-mundo'
        use 'tpope/vim-fugitive'
        use 'stefandtw/quickfix-reflector.vim'
        use 'mattn/emmet-vim'

        use 'junegunn/limelight.vim'

        -- use 'styled-components/vim-styled-components', { 'branch': 'main' }

        use 'kassio/neoterm'
        use 'thinca/vim-quickrun'
        use 'tpope/vim-dispatch'
        -- use 'suan/vim-instant-markdown', { 'do': 'npm install -g instant-markdown-d' }
        use 'godlygeek/tabular'
        use 'chrisbra/csv.vim'
        use 'junegunn/vim-peekaboo'
        use 'diepm/vim-rest-console'

        use 'nathanaelkane/vim-indent-guides'
        use 'ap/vim-css-color'
        use 'guns/xterm-color-table.vim'
        use 'vim-scripts/AnsiEsc.vim'

        use 'machakann/vim-highlightedyank'
        use 'Raimondi/delimitMate'
        use 'tpope/vim-commentary'
        use 'ntpeters/vim-better-whitespace'
        use 'tpope/vim-repeat'
        use 'tpope/vim-unimpaired'
        use({ 'kylechui/nvim-surround', config = function() require('config.surround') end })
        use 'tpope/vim-abolish'
        use 'tpope/vim-scriptease'
        use 'tpope/vim-speeddating'
        use 'tpope/vim-vinegar'
        use 'tpope/vim-rsi'

        use 'wannesm/wmgraphviz.vim'
        use 'rhysd/git-messenger.vim'

        -- use 'ruanyl/vim-sort-imports'

        use 'turbio/bracey.vim'
        use {
            'tpope/vim-dadbod',
            requires = { 'kristijanhusak/vim-dadbod-ui', 'kristijanhusak/vim-dadbod-completion' },
            config = function() require('config.dadbod').setup() end
        }
        use 'tpope/vim-endwise'
        use 'kana/vim-textobj-user'
        use 'kana/vim-textobj-entire'
        use 'kana/vim-textobj-indent'
        use 'kana/vim-textobj-line'
        use 'sgur/vim-textobj-parameter'
        use 'Julian/vim-textobj-variable-segment'
        use 'Chun-Yang/vim-textobj-chunk'
        use 'whatyouhide/vim-textobj-xmlattr'
        use 'exu/pgsql.vim'
        use 'triglav/vim-visual-increment'
        use {
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
            -- tag = 'release' -- To use the latest release
        }
        use({
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
            ft = { 'markdown' },
            cmd = 'MarkdownPreview',
            config = [[require('config.markdown-preview')]]
        })
        use 'mbbill/undotree'
        use {
            'folke/which-key.nvim',
            config = function()
                require('which-key').setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        use { "mhanberg/output-panel.nvim", config = function() require('output_panel').setup {} end }
        use {
            'goolord/alpha-nvim',
            requires = { 'nvim-tree/nvim-web-devicons' },
        }
    end,
    config = { display = { open_cmd = 'leftabove 75vnew \\[packer\\]' }, max_jobs = 10 }
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

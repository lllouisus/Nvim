local G = require('core.G')
local packer_bootstrap = false
local install_path = G.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compiled_path = G.fn.stdpath('config')..'/plugin/packer_compiled.lua'
if G.fn.empty(G.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    G.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.fn.system({'rm', '-rf', compiled_path})
    G.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

        -- TODO:
require('packer').startup({
    function(use)
        -- Packer Manager
        use { 'wbthomason/packer.nvim' }

        -- StartupTime
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        -- vv 快速选中内容插件
        require('plugins.config.vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('plugins.config.vim-expand-region').setup()", event = 'BufEnter' }

        -- UI
        -- Lsp Progress
        use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end, event = "InsertEnter" }
        use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = function() require("todo-comments").setup { } end }

        use {'edluffy/specs.nvim', config = "require('plugins.config.specs')" }

        -- Lsp / Cmp
        use { 'williamboman/mason.nvim', config = "require('plugins.config.mason')" }
        use { 'neovim/nvim-lspconfig', config = "require('plugins.config.lspconfig')" }
        use { "williamboman/mason-lspconfig.nvim", config = "require('plugins.config.mason-lspconfig')" }
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use { 'hrsh7th/nvim-cmp', config = "require('plugins.config.p-cmp')" }
        use 'L3MON4D3/LuaSnip'
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'onsails/lspkind.nvim', config = "require('plugins.config.p-kind')" }
        use { 'ray-x/lsp_signature.nvim', config = "require('plugins.config.lsp-signature')" }
        use { 'rafamadriz/friendly-snippets', module = { "cmp", "cmp_nvim_lsp"}, event = "InsertEnter" }
        use { 'glepnir/lspsaga.nvim' }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.config.p-treesitter')", run = ':TSUpdate', event = 'BufRead' }

        -- Telescope / FZF
        -- telescope ui select
        -- use {'nvim-telescope/telescope-ui-select.nvim' }

        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/popup.nvim'
        use 'ibhagwan/fzf-lua'
        use { 'nvim-telescope/telescope.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('plugins.config.telescope')" }
        use 'nvim-telescope/telescope-file-browser.nvim'
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        -- Nvim-Tree
        require('plugins.config.nvim-tree').config()
        use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.config.nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' }, required = { 'kyazdani42/nvim-web-devicons' } }

        -- Hop
        use { 'phaazon/hop.nvim', branch = 'v2', config = "require('plugins.config.hop')" }

        -- ff 高亮光标下的word
        require('plugins.config.vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('plugins.config.vim-interestingwords').setup()" }

        -- 多光标插件
        require('plugins.config.vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('plugins.config.vim-visual-multi').setup()" }

        -- Comment
        use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

        -- Surround
        use { 'tpope/vim-surround' }

        -- Terminal
        require('plugins.config.vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('plugins.config.vim-floaterm').setup()" }

        -- Autopairs
        use { 'windwp/nvim-autopairs', config = "require('plugins.config.autopairs')" }

        -- Translotor Tool
        use { 'voldikss/vim-translator' }

        -- Symbols-outline

        -- Gitsigns
        use { 'lewis6991/gitsigns.nvim', config = "require('plugins.config.gitsigns')", event = "CursorHold" }

        -- History
        use { 'dinhhuy258/vim-local-history' }


        -- Registers
        use {
            "tversteeg/registers.nvim",
            config = function()
                require("registers").setup()
            end,
        }

        -- markdown预览插件 导航生成插件
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

        -- Vim-Css-Color Should (Set guicolor)
        -- use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.config.nvim-colorizer')", event = "BufRead" }

        -- Fold Code
        use { 'anuvyklack/fold-preview.nvim',
            requires = 'anuvyklack/keymap-amend.nvim',
            config = function()
                require('fold-preview').setup()
            end
        }

        -- Lines
        require('plugins.config.lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('plugins.config.lines').setup()" }

        use { 'yaocccc/nvim-hlchunk' } 

        -- Theme
        -- use { 'sainnhe/everforest' }
        -- use { 'rose-pine/neovim' }
        -- use { 'olimorris/onedarkpro.nvim' }
        ----------------------------------------------------------------------------------------------------

    end,
    config = {
        git = { clone_timeout = 120 },
        display = {
            working_sym = '[ﲊ]', error_sym = '[✗]', done_sym = '[]', removed_sym = '', moved_sym = '→', header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})

if packer_bootstrap then
    require('packer').sync()
end

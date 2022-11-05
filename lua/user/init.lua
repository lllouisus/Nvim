local G = require('first_love.G')
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

        -----------------------------------------------------------------------------------------------------------------
require('packer').startup({
    function(use)
        -- Packer Manager
        use { 'wbthomason/packer.nvim' }

        -- StartupTime
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        -- vv 快速选中内容插件
        require('user.config.vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('user.config.vim-expand-region').setup()", event = 'CursorHold' }

        -- ff 高亮光标下的word
        require('user.config.vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('user.config.vim-interestingwords').setup()", event = 'CursorHold' }

        -- 多光标插件
        require('user.config.vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('user.config.vim-visual-multi').setup()", event = 'CursorHold' }

        -- Surround
        use { 'tpope/vim-surround', event = 'BufEnter' }

        -- Terminal
        require('user.config.vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('user.config.vim-floaterm').setup()" }


        -- Lsp / Cmp
        use { 'williamboman/mason.nvim', config = "require('user.config.mason')" }
        use { "williamboman/mason-lspconfig.nvim", config = "require('user.config.mason-lspconfig')" }

        use { 'L3MON4D3/LuaSnip', event = 'CursorMoved'}
        use { 'neovim/nvim-lspconfig', after = 'LuaSnip', config = "require('user.config.lspconfig')" }
        use { 'hrsh7th/nvim-cmp', config = "require('user.config.p-cmp')", after = "nvim-lspconfig"}
        use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-buffer', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-path', after = "nvim-cmp" }
        use { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" }
        use { 'rafamadriz/friendly-snippets', module = { "cmp", "cmp_nvim_lsp"}, after = "nvim-cmp" }
        use { 'onsails/lspkind.nvim', config = "require('user.config.p-kind')" }
        use { 'ray-x/lsp_signature.nvim', config = "require('user.config.lsp-signature')" }
        use { 'glepnir/lspsaga.nvim' }

        -- tree-sitter
        require('user.config.tree-sitter').config()
        use { 'nvim-treesitter/nvim-treesitter', config = "require('user.config.tree-sitter').setup()", run = ':TSUpdate', event = 'BufRead' }
        use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

        -- Telescope / FZF
        -- telescope ui select
        -- use {'nvim-telescope/telescope-ui-select.nvim' }
        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/popup.nvim'
        use 'ibhagwan/fzf-lua'
        use { 'nvim-telescope/telescope.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('user.config.telescope')" }
        use 'nvim-telescope/telescope-file-browser.nvim'
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        -- Lsp Progress
        use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end, event = "InsertEnter" }
        use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = function() require("todo-comments").setup { } end }

        -- markdown
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

        -- Nvim-Tree
        require('user.config.nvim-tree').config()
        use { 'kyazdani42/nvim-tree.lua', config = "require('user.config.nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' } }

        -- Lines
        require('user.config.lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('user.config.lines').setup()" }

        -- Fold Code
        use { 'anuvyklack/fold-preview.nvim',
            requires = 'anuvyklack/keymap-amend.nvim',
            config = function()
                require('fold-preview').setup()
            end
        }

        -- Registers
        use {
            "tversteeg/registers.nvim",
            config = function()
                require("registers").setup()
            end,
        }

        -- History
        use { 'dinhhuy258/vim-local-history' }

        -- Translotor Tool
        use { 'voldikss/vim-translator' }

        -- Autopairs
        use { 'windwp/nvim-autopairs', config = "require('user.config.autopairs')" }

        -- Hop
        use { 'phaazon/hop.nvim', branch = 'v2', config = "require('user.config.hop')", event = 'BufEnter' }

        -- Comment
        use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

        use { 'yaocccc/nvim-hlchunk' }





        -----------------------------------------------------------------------------------------------------------------

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


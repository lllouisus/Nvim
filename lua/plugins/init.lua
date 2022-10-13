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

require('packer').startup({
    function(use)
        -- Packer Manager
        use { 'wbthomason/packer.nvim' }

        -- StartupTime
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        -- Lsp / Cmp
        use { 'williamboman/mason.nvim', config = "require('plugins.configs.mason')" }
        use { 'neovim/nvim-lspconfig', config = "require('plugins.configs.lspconfig')" }
        -- use { 'neovim/nvim-lspconfig', config = "require('plugins.configs.lsp-language-server')" }
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use { 'hrsh7th/nvim-cmp', config = "require('plugins.configs.p-cmp')" }
        use 'L3MON4D3/LuaSnip'
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'onsails/lspkind.nvim', config = "require('plugins.configs.p-kind')" }
        use { 'ray-x/lsp_signature.nvim', config = "require('plugins.configs.lsp-signature')" }
        use { 'rafamadriz/friendly-snippets', module = { "cmp", "cmp_nvim_lsp"}, event = "InsertEnter" }
        use { 'glepnir/lspsaga.nvim' }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.configs.p-treesitter')", run = ':TSUpdate', event = 'BufRead' }

        -- Telescope / FZF
        -- telescope ui select
        -- use {'nvim-telescope/telescope-ui-select.nvim' }

        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/popup.nvim'
        use 'ibhagwan/fzf-lua'
        use { 'nvim-telescope/telescope.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = "require('plugins.configs.telescope')" }
        use 'nvim-telescope/telescope-file-browser.nvim'
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

        -- Nvim-Tree
        require('plugins.configs.nvim-tree').config()
        use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.configs.nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' }, required = { 'kyazdani42/nvim-web-devicons' } }

        -- Hop
        use { 'phaazon/hop.nvim', branch = 'v2', config = "require('plugins.configs.hop')" }

        -- ff 高亮光标下的word
        require('plugins.configs.vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('plugins.configs.vim-interestingwords').setup()" }

        -- 多光标插件
        require('plugins.configs.vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('plugins.configs.vim-visual-multi').setup()", event = 'CursorHold' }

        -- Comment
        use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

        -- Surround
        use { 'tpope/vim-surround' }

        -- Terminal
        require('plugins.configs.vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('plugins.configs.vim-floaterm').setup()" }

        -- Autopairs
        use { 'windwp/nvim-autopairs', config = "require('plugins.configs.autopairs')" }

        -- Translotor Tool
        use { 'voldikss/vim-translator' }

        -- Lsp Progress
        use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end }

        -- Gitsigns
        use { 'lewis6991/gitsigns.nvim', config = "require('plugins.configs.gitsigns')", event = "CursorHold" }
        
        -- History
        use { 'dinhhuy258/vim-local-history' }

        -- Nvim-Line
        require('plugins.configs.nvim-lines').config()
        use { 'yaocccc/nvim-lines.lua', config = "require('plugins.configs.nvim-lines').setup()" }

        -- Indent
        use 'yaocccc/nvim-hlchunk'

        -- Registers
        use {
            "tversteeg/registers.nvim",
            config = function()
                require("registers").setup()
            end,
        }

        -- markdown预览插件 导航生成插件
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

        -- Theme
        use({ 'rose-pine/neovim' })




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

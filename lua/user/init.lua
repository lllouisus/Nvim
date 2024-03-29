local packer_bootstrap = false
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compiled_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing packer.nvim...')
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.fn.system({ 'rm', '-rf', compiled_path })
    vim.cmd [[packadd packer.nvim]]
    packer_bootstrap = true
end

-----------------------------------------------------------------------------------------------------------------
require('packer').startup({
    function(use)
        -- Packer Manager
        use { 'wbthomason/packer.nvim' }

        -- StartupTime
        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        -- Comment
        use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end, event = "CursorHold" }

        -- vv 快速选中内容插件
        require('user.config.vim-expand-region').config()
        use { 'terryma/vim-expand-region', config = "require('user.config.vim-expand-region').setup()", event = 'CursorHold' }

        -- Highlight Word
        require('user.config.vim-interestingwords').config()
        use { 'lfv89/vim-interestingwords', config = "require('user.config.vim-interestingwords').setup()", event = 'CursorHold' }

        -- 多光标插件
        require('user.config.vim-visual-multi').config()
        use { 'mg979/vim-visual-multi', config = "require('user.config.vim-visual-multi').setup()", event = 'CursorHold' }

        -- Surround
        use { 'tpope/vim-surround', event = "CursorHold" }

        -- Terminal
        require('user.config.vim-floaterm').config()
        use { 'voldikss/vim-floaterm', config = "require('user.config.vim-floaterm').setup()", event = "CursorHold" }

        -- Neo-Tree
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "MunifTanjim/nui.nvim",
            },
            config = "require('user.config.neo-tree')",
            cmd = { 'NeoTreeFloat' }
        }

        -- Lsp / Cmp
        use { 'williamboman/mason.nvim', config = "require('user.config.lsp_cmp.mason')" }
        use { "williamboman/mason-lspconfig.nvim", config = "require('user.config.lsp_cmp.mason-lspconfig')" }

        -- use { 'L3MON4D3/LuaSnip', event = 'CursorMoved' }
        -- use { 'neovim/nvim-lspconfig', config = "require('user.config.lsp_cmp.lspconfig')", after = { 'cmp-nvim-lsp', 'LuaSnip' } }
        -- use { 'hrsh7th/nvim-cmp', config = "require('user.config.lsp_cmp.p-cmp')", after = 'nvim-lspconfig' }
        -- use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" }
        -- use { 'hrsh7th/cmp-nvim-lsp' }
        -- use { 'hrsh7th/cmp-buffer', after = "nvim-cmp" }
        -- use { 'hrsh7th/cmp-path', after = "nvim-cmp" }
        -- use { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" }
        -- use { 'rafamadriz/friendly-snippets', module = { "cmp", "cmp_nvim_lsp" }, after = "nvim-cmp" }
        -- use { 'onsails/lspkind.nvim' }
        -- use { 'ray-x/lsp_signature.nvim', config = "require('user.config.lsp_cmp.lsp-signature')" }
        -- use { 'glepnir/lspsaga.nvim' }


        use { 'L3MON4D3/LuaSnip', config = "require('user.config.lsp_cmp.p-snip')" }
        use { 'neovim/nvim-lspconfig', config = "require('user.config.lsp_cmp.lspconfig')" }
        use { 'hrsh7th/nvim-cmp', config = "require('user.config.lsp_cmp.p-cmp')" }
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-cmdline' }
        use { 'rafamadriz/friendly-snippets', module = { "cmp", "cmp_nvim_lsp" } }
        use { 'onsails/lspkind.nvim' }
        use { 'ray-x/lsp_signature.nvim', config = "require('user.config.lsp_cmp.lsp-signature')" }
        -- use { 'glepnir/lspsaga.nvim', config = "require('user.config.lsp_cmp.lspsaga')" }

        use {
           "folke/trouble.nvim",
           config = "require('user.config.trouble')"
        }
        use { 'folke/lsp-colors.nvim' }




        -- tree-sitter
        require('user.config.tree-sitter').config()
        use { 'nvim-treesitter/nvim-treesitter', config = "require('user.config.tree-sitter').setup()", run = ':TSUpdate',
            event = 'BufRead' }
        use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

        -- Telescope / FZF
        -- telescope ui select
        use { 'nvim-telescope/telescope-ui-select.nvim' }
        use { 'nvim-telescope/telescope-live-grep-args.nvim' }
        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/popup.nvim'
        use { 'nvim-telescope/telescope.nvim', requires = { 'kyazdani42/nvim-web-devicons' },
            config = "require('user.config.telescope')", event = { 'CursorHold' }, after = { 'plenary.nvim' } }
        use { 'nvim-telescope/telescope-file-browser.nvim' }
        use { 'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

        -- Lsp Progress
        use { "folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end, event = "InsertEnter" }
        use { 'norcalli/nvim-colorizer.lua', config = "require('user.config.colorizer')", event = "CursorHold" }

        -- markdown
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

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
           cmd = "Registers"
        }

        -- Translotor Tool
        use { 'voldikss/vim-translator', event = "CursorHold" }

        -- Autopairs
        use { 'windwp/nvim-autopairs', config = "require('user.config.autopairs')", event = "InsertEnter" }

        -- Cursor move
        use { 'ggandor/leap.nvim', config = "require('user.config.leap')"}

        -- Gitsigns
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end,
            event = "InsertEnter"
        }

        -- 
        use { 'karb94/neoscroll.nvim', config = "require('user.config.neoscroll')", event = 'CursorHold' }

        -- History/Git History
        -- use { 'dinhhuy258/vim-local-history' }
        -- use { 'tanvirtin/vgit.nvim', config = "require('user.config.vgit')", event = 'CursorHold' }

        -----------------------------------------------------------------------------------------------------------------

    end,
    config = {
        git = { clone_timeout = 120 },
        display = {
            working_sym = '[ﲊ]', error_sym = '[✗]', done_sym = '[]', removed_sym = '', moved_sym = '→',
            header_sym = '─',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})

if packer_bootstrap then
    require('packer').sync()
end

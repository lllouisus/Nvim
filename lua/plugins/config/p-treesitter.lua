require('nvim-treesitter.configs').setup{
    highlight = {
        enable = true,
        disable = { "json" },
    },
    indent = {
        enable = true,
        disable = {}
    },
    ensure_installed = "all",
    autotag = {
        enable = true,
        disable = { "json" },
    }
}

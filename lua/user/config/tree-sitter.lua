local G = require('first_love.G')
local M = {}

function M.config()
    G.map({ { 'n', 'sh', ':TSHighlightCapturesUnderCursor<CR>', {silent = true, noremap = true}} })
end

function M.setup()
    require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        ignore_install = { "swift", "phpdoc", "json" },
        highlight = {
            enable = true,
            disable = { "json" }
        },
    }
end

return M

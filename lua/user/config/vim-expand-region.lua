local Gmap = vim.keymap
local M = {}

function M.config()
        Gmap.set( 'v', 'v', '<Plug>(expand_region_expand)', {silent = true} )
        Gmap.set( 'v', 'V', '<Plug>(expand_region_shrink)', {silent = true} )
end

function M.setup()
    -- do nothing
end

return M

local Gmap = vim.keymap
local M = {}

function M.config()
    vim.g.interestingWordsRandomiseColors = 1
    vim.g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }

        Gmap.set( 'n', '<leader>k', ":call InterestingWords('n')<cr>", {silent = true, noremap = true} )
        Gmap.set( 'n', '<leader>K', ":call UncolorAllWords()<cr>", {silent = true, noremap = true} )
        Gmap.set( 'n', 'n', ":call WordNavigation('forward')<cr>", {silent = true, noremap = true} )
        Gmap.set( 'n', 'N', ":call WordNavigation('backward')<cr>", {silent = true, noremap = true} )
end

function M.setup()
    -- do nothing
end

return M

local G = require('first_love.G')
local M = {}

function M.config()
    G.g.interestingWordsRandomiseColors = 1
    G.g.interestingWordsGUIColors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF' }

    G.map({
        { 'n', '<leader>k', ":call InterestingWords('n')<cr>", {silent = true, noremap = true}},
        { 'n', '<leader>K', ":call UncolorAllWords()<cr>", {silent = true, noremap = true}},
        { 'n', 'n', ":call WordNavigation('forward')<cr>", {silent = true, noremap = true}},
        { 'n', 'N', ":call WordNavigation('backward')<cr>", {silent = true, noremap = true}},
    })
end

function M.setup()
    -- do nothing
end

return M

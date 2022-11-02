local ls = require 'luasnip'

ls.config.set_config{
    history = true,
    updateevents = "TextChanged, TextChangeDI",
    enable_autosnippets = true
}

local s = ls.snippet
local t = la.text_node
local i = ls.insert_node


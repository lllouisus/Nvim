local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  local function inside_snippet()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
    return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
  end

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1
    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
          or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return inside_snippet() and luasnip.jumpable(-1)
  else
    return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
  end
end

---checks if emmet_ls is available and active in the buffer
---@return boolean true if available, false otherwise
local is_emmet_active = function()
  local clients = vim.lsp.buf_get_clients()

  for _, client in pairs(clients) do
    if client.name == "emmet_ls" then
      return true
    end
  end
  return false
end

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets
require("luasnip.loaders.from_vscode").load({ paths = { -- load custom snippets
  vim.fn.stdpath("config") .. "/my-snippets"
} }) -- Load snippets from my-snippets folder

cmp_config = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    ---@usage The minimum length of a word to complete on.
    keyword_length = 1,
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    max_width = 0,
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = "練",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = "",
      Folder = " ",
      Function = " ",
      Interface = "ﰮ ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Operator = "",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = "塞",
      Value = " ",
      Variable = " ",
    },
    source_names = {
      nvim_lsp = "(LSP)",
      treesitter = "(TS)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      cmp_tabnine = "(Tabnine)",
      vsnip = "(Snippet)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      spell = "(Spell)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
    format = function(entry, vim_item)
      local max_width = cmp_config.formatting.max_width
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
      -- vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
      vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
          or cmp_config.formatting.duplicates_default
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    -- 边框 & Colors
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "spell" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  },
  mapping = cmp.mapping.preset.insert {
      ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      -- TODO: potentially fix emmet nonsense
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif luasnip.expandable() then
              luasnip.expand()
          elseif jumpable(1) then
              luasnip.jump(1)
          elseif check_backspace() then
              fallback()
          elseif is_emmet_active() then
              return vim.fn["cmp#complete"]()
          else
              fallback()
          end
      end, {
      "i",
      "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()
      elseif jumpable(-1) then
          luasnip.jump(-1)
      else
          fallback()
      end
  end, {
  "i",
  "s",
    }),

    ["<C-p>"] = cmp.mapping.complete(),
    ["<C-q>"] = cmp.mapping.abort(),
    ['<C-e>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
},
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

-- disable autocompletion for guihua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")

cmp.setup(cmp_config)



-- -- ----------------------------------- 1 -----------------------------------------------------------------
-- import nvim-cmp plugin safely
-- local cmp_status, cmp = pcall(require, "cmp")
-- if not cmp_status then
--   return
-- end
--
-- -- import luasnip plugin safely
-- local luasnip_status, luasnip = pcall(require, "luasnip")
-- if not luasnip_status then
--   return
-- end
--
-- -- import lspkind plugin safely
-- local lspkind_status, lspkind = pcall(require, "lspkind")
-- if not lspkind_status then
--   return
-- end
--
-- -- load vs-code like snippets from plugins (e.g. friendly-snippets)
-- require("luasnip/loaders/from_vscode").lazy_load()
--
-- -- vim.opt.completeopt = "menu,menuone,noselect"
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   window = {
--       documentation = {
--           -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
--           -- border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
--
--           winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
--
--     },
--       completion = {
--           -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
--           -- border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
--
--           winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
--       }
--   },
--   completeopt = {
--       completeopt = "menu,menuone,noselect"
--   },
--   mapping = cmp.mapping.preset.insert({
--       ['<C-e>'] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true
--       }),
--       ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
--       ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
--
--       -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--       ["<C-q>"] = cmp.mapping.abort(), -- close completion window
--   }),
--   -- configure lspkind for vs-code like icons
--   -- formatting = {
--   --   format = lspkind.cmp_format({
--   --     maxwidth = 50,
--   --     ellipsis_char = "...",
--   --   }),
--   -- },
--   formatting = {
--       -- fields = { "kind", "menu", "abbr" },
--       format = function(entry, vim_item)
--           local kind_icons = {
--               Text = "",
--               Method = "",
--               Function = "",
--               Constructor = "",
--               Field = "ﰠ",
--               Variable = "",
--               Class = "ﴯ",
--               Interface = "",
--               Module = "",
--               Property = "ﰠ",
--               Unit = "塞",
--               Value = "",
--               Enum = "",
--               Keyword = "",
--               Snippet = "",
--               Color = "",
--               File = "",
--               Reference = "",
--               Folder = "",
--               EnumMember = "",
--               Constant = "",
--               Struct = "פּ",
--               Event = "",
--               Operator = "",
--               TypeParameter = "",
--           }
--           -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
--           vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--           -- vim_item.menu = ({
--           --     buffer = "Key",
--           --     nvim_lsp = "Lsp",
--           --     nvim_lua = "Api",
--           --     path = "Path",
--           --     luasnip = "Snip",
--           --     npm = "Npm",
--           --     neorg = "Neoge",
--           -- })[entry.source.name]
--           return vim_item
--       end,
--   },
--   -- sources for autocompletion
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" }, -- lsp
--     { name = "nvim_lua" }, -- lua
--     { name = "luasnip" }, -- snippets
--     { name = "buffer" }, -- text within current buffer
--     { name = "path" }, -- file system paths
--   }),
-- })
--
--
-- cmp.setup.cmdline("/", {
--     sources = {
--         { name = "buffer" },
--     },
-- })
--
-- cmp.setup.cmdline(":", {
--     sources = {
--         { name = "cmdline" },
--     },
-- })

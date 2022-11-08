-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

-- vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      documentation = {
          border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',

    },
      completion = {
          border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
      }
  },
  completeopt = {
      completeopt = "menu,menuone,noselect"
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping.confirm({ select = true }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),

    -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-q>"] = cmp.mapping.abort(), -- close completion window
    -- ["<C-e>"] = cmp.mapping.confirm({ select = true }),
  }),
  -- configure lspkind for vs-code like icons
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     maxwidth = 50,
  --     ellipsis_char = "...",
  --   }),
  -- },
  formatting = {
      -- fields = { "kind", "menu", "abbr" },
      format = function(entry, vim_item)
          local kind_icons = {
              Text = "",
              Method = "",
              Function = "",
              Constructor = "",
              Field = "ﰠ",
              Variable = "",
              Class = "ﴯ",
              Interface = "",
              Module = "",
              Property = "ﰠ",
              Unit = "塞",
              Value = "",
              Enum = "",
              Keyword = "",
              Snippet = "",
              Color = "",
              File = "",
              Reference = "",
              Folder = "",
              EnumMember = "",
              Constant = "",
              Struct = "פּ",
              Event = "",
              Operator = "",
              TypeParameter = "",
          }
          -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
              buffer = "Key",
              nvim_lsp = "Lsp",
              nvim_lua = "Api",
              path = "Path",
              luasnip = "Snip",
              npm = "Npm",
              neorg = "Neoge",
          })[entry.source.name]
          return vim_item
      end,
  },
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "nvim_lua" }, -- lua
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
})


cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    sources = {
        { name = "cmdline" },
    },
})

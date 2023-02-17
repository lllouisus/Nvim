--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'sd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'sD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end


-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- 编辑时隐藏lsp info
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   update_in_insert = false,
--   virtual_text = { spacing = 4, prefix = "" },
--   severity_sort = true,
-- }
-- )

-- Diagnostic symbols in the sign column (gutter)    ﯦ
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = ''
  },
  -- 底部错误提示线
  underline = true,
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})



-- ---------------------------------  2  ------------------------------------

-- local opts = { noremap=true, silent=true }
-- -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', 'e[', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', 'e]', vim.diagnostic.goto_next, opts)
-- -- vim.keymap.set('n', 'ta', vim.diagnostic.setloclist, opts)
--
-- -- local lspconfig = require('lspconfig')
--
-- local on_attach = function(client, bufnr)
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'sD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'sd', vim.lsp.buf.definition, bufopts)
--   -- vim.keymap.set('n', 'sk', vim.lsp.buf.hover, bufopts)
--   -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
--   -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- end
--
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   update_in_insert = false,
--   virtual_text = { spacing = 4, prefix = "" },
--   severity_sort = true,
-- }
-- )
--
-- -- Change the Diagnostic symbols in the sign column (gutter)
-- -- (not in youtube nvim video)
-- local signs = { Error = " ", Warn = " ", Hint = "ﯦ ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
--
-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = '●'
--   },
--   update_in_insert = true,
--   float = {
--     source = "always", -- Or "if_many"
--   },
-- })
--
-- -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- --
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
-- }
-- require('lspconfig')['clangd'].setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }
-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
-- }
-- require('lspconfig')['sumneko_lua'].setup{
--     on_attach = on_attach,
-- }
--

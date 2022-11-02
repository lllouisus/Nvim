require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "pyright","sumneko_lua", "rust_analyzer", "cssls", "cmake", "html", "sqlls"}
})

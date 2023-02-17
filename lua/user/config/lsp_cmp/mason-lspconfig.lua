require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "pyright","lua_ls", "tsserver", "html", "cmake", "cssls", "tailwindcss" ,"sqlls"}
})

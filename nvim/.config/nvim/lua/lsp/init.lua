-- Your custom attach function for nvim-lspconfig goes here.
-- TODO FIXME
-- TODO FIXME
-- TODO FIXME
-- TODO FIXME
-- TODO FIXME
-- TODO FIXME
-- TODO FIXME
local on_attach = function(client, bufnr)
    --require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings FIXME move to keys.lua?
    --local opts = { noremap=true, silent=true }
    --buf_set_keymap('n', '<leader>mG', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', '<leader>mg', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --buf_set_keymap('n', '<leader>mk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --buf_set_keymap('n', '<leader>mi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<leader>mh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --buf_set_keymap('n', '<leader>mr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<leader>mp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', '<leader>mn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

-- To get builtin LSP running, do something like:
-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(require('lspconfig'), {
    -- FIXME ? complains about cmd, but it works
    commands = {
        "/home/eaclobr/bin/lua-language-server/bin/lua-language-server",
        "-E",
        "/home/eaclobr/bin/lua-language-server/bin/main.lua"
    },
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Disable",
            },
            diagnostics = {
                globals = {"vim", "use"},
                disable = {"lowercase-global"}
            },
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
  on_attach = on_attach,
})

require'lspconfig'.ccls.setup{
  on_attach = on_attach,
  -- flags = lsp_flags,
}
--require'lspconfig'.ccls.setup{require'coq'.lsp_ensure_capabilities()}


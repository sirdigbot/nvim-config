-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local kmap = function(mode, keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        else
            desc = 'LSP: MISSING DESCRIPTION'
        end

        vim.keymap.set(mode, keys, func, { buffer = bufnr, remap = false, desc = desc })
    end

    kmap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol under cursor')
    kmap('n', '<leader>ca', vim.lsp.buf.code_action, 'Show [C]ode [A]ctions')

    kmap('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    kmap('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    kmap('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    kmap('n', '<leader>td', vim.lsp.buf.type_definition, 'Type [D]efinition')
    kmap('n', '<leader>vds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    kmap('n', '<leader>vws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    kmap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
    kmap('n', '<C-i>', vim.lsp.buf.signature_help, 'Signature Documentation')
    kmap('i', '<C-i>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    kmap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    kmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    kmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    kmap('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
end


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}



-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- Must be before we install and setup() servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Install and setup() the servers with mason
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
}


-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },  -- cmp-nvim-lsp
        { name = 'luasnip' },   -- LuaSnip
        { name = 'buffer' },    -- cmp-buffer
        { name = 'path' },      -- cmp-path
    },
})


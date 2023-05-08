local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- My settings
lsp.ensure_installed({
    --'tsserver',
    --'eslint',
    --'sumneko_lua',
    'rust_analyzer',
})

-- Remappings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})


-- Improve navigation using (optional) LSP instead of neovim's parsing
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})


lsp.on_attach(function(_, bufnr)
    local kmap = function(mode, keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        else
            desc = 'LSP: MISSING DESCRIPTION'
        end

        vim.keymap.set(mode, keys, func, { buffer = bufnr, remap = false, desc = desc })
    end

    kmap("n", "gd", function() vim.lsp.buf.definition() end, '[G]o to [D]efinition')
    kmap("n", "K", function() vim.lsp.buf.hover() end, 'Hover')
    kmap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, '[V]iew [W]orkspace [S]ymbols')
    kmap("n", "<leader>vd", function() vim.diagnostic.open_float() end, '[V]iew [D]iagnostic')
    kmap("n", "[d", function() vim.diagnostic.goto_next() end, 'Go to next [d]iagnostic closest to cursor position')
    kmap("n", "]d", function() vim.diagnostic.goto_prev() end, 'Go to previous [d]iagnostic closest to cursor position')
    kmap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, '[V]iew [C]ode [A]ctions')
    kmap("n", "<leader>vrr", function() vim.lsp.buf.references() end, '[V]iew [R]eferences')
    kmap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, 'Rename all references')
    kmap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, 'Show signature help')
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

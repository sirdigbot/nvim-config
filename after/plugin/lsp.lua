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
local cmp_select = {behavior = cmp.SelectBehavior.Select}
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


lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: [G]o to [D]efinition',
  })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: Hover',
  })
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: [V]iew [W]orkspace [S]ymbols',
  })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: [V]iew [D]iagnostic',
  })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: Go to next [d]iagnostic closest to cursor position',
  })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: Go to previous [d]iagnostic closest to cursor position',
  })
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: [V]iew [C]ode [A]ctions',
  })
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: [V]iew [R]eferences',
  })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: Rename all references',
  })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {
    buffer = bufnr,
    remap = false,
    desc = 'LSP: Show signature help',
  })
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

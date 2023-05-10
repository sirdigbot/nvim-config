-- Give floating windows a border so they don't blend in with the background
local _border = 'rounded'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = _border,
    }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = _border,
    }
)

vim.diagnostic.config {
    float = { border = _border }
}

local set_hl_for_floating_window = function()
    local colours = vim.api.nvim_get_hl(0, { name = 'Function', link = false })

    vim.api.nvim_set_hl(0, 'FloatBorder', {
        fg = colours['fg'],
    })
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd(
    {
        'VimEnter',
        'ColorScheme',
    },
    {
        pattern = '*',
        desc = 'Avoid overwritten by loading color schemes later',
        callback = set_hl_for_floating_window,
})

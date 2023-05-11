require('treesj').setup({
    use_default_keymaps = false,
})

vim.keymap.set('n', '<leader>m', function()
    require('treesj').toggle()
end, { desc = 'TreeSJ: Toggle split-join at cursor' })


require('neo-tree').setup({
    close_if_last_window = true,
})


vim.keymap.set('n', '<leader>pt', ':Neotree toggle reveal<CR>', { desc = 'Neotree: Show [P]roject [T]ree' })


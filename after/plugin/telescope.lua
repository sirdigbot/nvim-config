local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope: Search [P]roject [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope: Search the output of \'git ls-files\'' })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[T]elescope: [K]eymaps' })

-- grep_string requires ripgrep to be installed (rg command)
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope: Live [P]roject [G]rep' })

-- Non-live version
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string( --[[ { search = vim.fn.input('Grep > ') } ]])
    end,
    { desc = 'Telescope: [P]roject [S]earch for word/string under cursor' })

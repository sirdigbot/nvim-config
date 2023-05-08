local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope: Search [P]roject [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope: Search the output of \'git ls-files\'' })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Telescope: [K]eymaps' })

vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Telescope: Show/Resume [P]revious telescope picker [R]esults' })

-- Grep capabilities depend on ripgrep ("rg" must be a valid terminal command).
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope: Live [P]roject [G]rep' })
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string( --[[ { search = vim.fn.input('Grep > ') } ]])
    end,
    { desc = 'Telescope: [P]roject [S]earch for word/string under cursor' })

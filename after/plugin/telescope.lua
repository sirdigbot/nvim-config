local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = 'Telescope: Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Telescope: Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Telescope: Fuzzy-search within current buffer' })

vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Telescope: [K]eymaps' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope: Search the output of \'git ls-files\'' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope: [S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope: [S]earch [H]elp Tags' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope: [S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope: Show/resume previous [s]earch [r]esults' })

-- Grep capabilities depend on ripgrep ("rg" must be a valid terminal command).
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope: [S]earch with live [g]rep' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string,
    { desc = 'Telescope: [S]earch current [w]ord/string under cursor' })

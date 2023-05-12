local xnmap = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { desc = desc })
    vim.keymap.set('x', lhs, rhs, { desc = desc })
end

-- Display project [file] view
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'My Config: Display [P]roject [V]iew (:Ex)' })


-- Move highlighted text up and down with J and K
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", { desc = 'My Config: Move highlighted text down' })
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", { desc = 'My Config: Move highlighted text up' })


-- Keep screen centred when using half-page jump (C-d, C-u)
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'My Config: Remap to centre screen when navigating half-page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'My Config: Remap to centre screen when navigating half-page up' })


-- Keep search terms centred too
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'My Config: Remap to centre screen when jumping to next search term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'My Config: Remap to centre screen when jumping to previous search term' })


-- Format/prettify the current file/buffer
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'My Config: [F]ormat/Prettify the current file or buffer' })


-- Delete into void register (don't yank)
xnmap('<leader>d', [["_d]], 'My Config: [D]elete into void register')
xnmap('<leader>D', [["_D]], 'My Config: [D]elete line into void register')
xnmap('<leader>x', [["_x]], 'My Config: Delete character under/after cursor into void register')
xnmap('<leader>X', [["_X]], 'My Config: Delete character before cursor into void register')
xnmap('<leader>c', [["_c]], 'My Config: [C]ut/change, deleting into void register')
xnmap('<leader>C', [["_C]], 'My Config: [C]ut/change line, deleting into void register')
xnmap('<leader>s', [["_s]], 'My Config: Delete into void register and start insert/[s]ubstitute')
xnmap('<leader>S', [["_S]], 'My Config: Delete line into void register and start insert/[s]ubstitute')


-- Delete+Paste over highlighted text without copying deleted text (delete to void register)
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'My Config: Delete and [P]aste (without yanking/copying)' })


-- Yank into system clipboard (but not vim)
vim.keymap.set('n', '<leader>y', [["+y]], { desc = 'My Config: [Y]ank into system clipboard' })
vim.keymap.set('x', '<leader>y', [["+y]], { desc = 'My Config: [Y]ank into system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'My Config: [Y]ank lines into system clipboard' })
vim.keymap.set('x', '<leader>Y', [["+Y]], { desc = 'My Config: [Y]ank lines into system clipboard' })


-- Paste from system clipboard (faster alternative to Ctrl+V or Shift+Insert)
-- Also gives append/prepend capability
vim.keymap.set('n', '<leader>ps', [["+p]], { desc = 'My Config: [P]aste from system clipboard' })
vim.keymap.set('n', '<leader>PS', [["+P]], { desc = 'My Config: [P]aste from system clipboard before cursor' })
-- These conflict with x-mode <leader>p and i cbf fixing it since i never use these anyway
-- vim.keymap.set('x', '<leader>ps', [["_d"+p]], { desc = 'My Config: Delete and [P]aste from system clipboard (without yanking/copying)' })
-- vim.keymap.set('x', '<leader>PS', [["_d"+P]], { desc = 'My Config: Delete and [P]aste from system clipboard before cursor (without yanking/copying)' })


-- Banish the repeat-macro thing where to where it can't hurt me
vim.keymap.set('n', 'Q', '<nop>', { desc = 'My Config: Remap to disable Q' })


-- Shortcut for global substitute on the currently selected word
-- I'm gonna be honest, I don't understand this at all. But it's neat!
vim.keymap.set('n', '<leader>suw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'My Config: Global Substitute (:%s) the current word' })


-- Faster split-view switching
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'My Config: Shortcut for <C-w>h' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'My Config: Shortcut for <C-w>j' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'My Config: Shortcut for <C-w>k' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'My Config: Shortcut for <C-w>l' })

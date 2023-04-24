-- Display project [file] view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Move highlighted text up and down with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Keep screen centred when using half-page jump (C-d, C-u)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Keep search terms centred too
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Format/prettify the current file/buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- Delete into void register (don't yank)
vim.keymap.set("n", "<leader>d", [["_d]]) -- [[..]] is also a string in lua!
vim.keymap.set("v", "<leader>d", [["_d]])


-- Delete+Paste without copying deleted text (delete to void register)
vim.keymap.set("x", "<leader>p", [["_dP]])


-- Yank into system clipboard (but not vim)
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- Banish the recording macro thing to the shadow realm where it belongs
vim.keymap.set("n", "Q", "<nop>")


-- Shortcut for global substitute on the currently selected word
-- I'm gonna be honest, I don't understand this at all. But it's neat!
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


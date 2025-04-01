vim.keymap.set('n', '[a', vim.cmd.AerialPrev)
vim.keymap.set('n', ']a', vim.cmd.AerialNext)
vim.keymap.set('n', '<leader>sa', vim.cmd.AerialNavToggle, { desc = 'Open aerial navigation' })

return {}

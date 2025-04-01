vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = 'Open git menu' })
vim.keymap.set('n', '<leader>gc', '<CMD>Git commit<CR>', { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gp', '<CMD>Git push<CR>', { desc = 'Git push' })

vim.keymap.set('n', '<leader>Gc', '<cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>Gb', '<cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>Gg', '<cmd>Telescope git_status<CR>')

return {}

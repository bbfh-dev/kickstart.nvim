-- File management
vim.keymap.set('n', '<leader>w', vim.cmd.w)
vim.keymap.set('n', '<leader><C-w>', '<cmd>noautocmd w<CR>')
vim.keymap.set('n', '<leader>q', function()
  vim.cmd 'q'
end)
vim.keymap.set('n', '<leader>Q', function()
  vim.cmd 'qa'
end)

-- Line wrap
vim.keymap.set({ 'n' }, '<leader>[', function()
  vim.opt.wrap = false
end)
vim.keymap.set({ 'n' }, '<leader>]', function()
  vim.opt.wrap = true
end)

-- System clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>P', [["+P]])
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]])
vim.keymap.set({ 'n' }, '<C-p>', [[o<ESC>"+p]])

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Split
vim.keymap.set('n', '<leader>=', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>+', vim.cmd.split)

-- TreeSJ
vim.keymap.set('n', '<leader>cf', function()
  require('treesj').toggle()
end, { desc = 'Toggle code fold' })

-- Oil
vim.keymap.set('n', '\\', vim.cmd.Oil, { desc = 'Open parent directory' })

-- GrugFar
vim.keymap.set('n', '<leader>sS', vim.cmd.GrugFar, { desc = 'Find and replace' })

-- Undo tree
vim.keymap.set('n', '<F12>', vim.cmd.UndotreeToggle)

-- INode for swapping nodes
vim.keymap.set('n', '<C-Left>', vim.cmd.IMoveWithLeft)
vim.keymap.set('n', '<C-Right>', vim.cmd.IMoveWithRight)

-- Colorizer
vim.keymap.set('n', '<leader>ct', vim.cmd.ColorizerToggle)
vim.keymap.set('n', '<leader>cp', vim.cmd.VCoolor)

-- Yanking history
vim.keymap.set('n', '<C-y>', '<CMD>Telescope neoclip<CR>', { desc = 'Open yanking history' })

-- Hover
vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
vim.keymap.set('n', '<C-p>', function()
  require('hover').hover_switch 'previous'
end, { desc = 'hover.nvim (previous source)' })
vim.keymap.set('n', '<C-n>', function()
  require('hover').hover_switch 'next'
end, { desc = 'hover.nvim (next source)' })

-- Mouse support
vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })
vim.o.mousemoveevent = true

vim.keymap.set('n', '<leader>W', '<CMD>w<CR><CMD>!./build.sh<CR><CR>')

return {}

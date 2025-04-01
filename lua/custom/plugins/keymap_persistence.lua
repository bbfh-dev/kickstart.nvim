-- load the session for the current directory
vim.keymap.set('n', '<leader>oo', function()
  require('persistence').load()
end)

-- select a session to load
vim.keymap.set('n', '<leader>oS', function()
  require('persistence').select()
end)

-- load the last session
vim.keymap.set('n', '<leader>ol', function()
  require('persistence').load { last = true }
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set('n', '<leader>od', function()
  require('persistence').stop()
end)

return {}

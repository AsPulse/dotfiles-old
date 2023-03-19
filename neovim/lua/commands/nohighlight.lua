vim.keymap.set('n', '<F3>', '<cmd>noh<cr>', { silent = true, remap = false })
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = { '*' },
  callback = function() vim.schedule(vim.cmd.nohlsearch) end
})

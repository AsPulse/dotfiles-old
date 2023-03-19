local required = require('util.required')

-- Load Configs
required.under('configs')

-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.keymap.set('n', '<leader>lazy', '<cmd>Lazy<cr>', { noremap = true })

-- Setup Plugins
local pluginSettings = required.under('plugin-settings')
require('lazy').setup(pluginSettings, {
  ui = {
    border = 'rounded'
  },
  install = {
    missing = true,
    colorscheme = { 'material' }
  }
})

-- Load Commands
required.under('commands')

vim.g.isReload = true;


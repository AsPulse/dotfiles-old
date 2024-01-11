local set = vim.api.nvim_set_option

-- vim.api.nvim_command('language en_US')

set('encoding', 'utf-8')
set('autoread', true)
set('swapfile', false)

set('number', true)
set('relativenumber', true)
set('ruler', true)
set('cursorline', true)

set('ignorecase', true)
set('incsearch', true)

set('termguicolors', true)
set('background', 'dark')

set('wildmenu', true)
set('wildmode', 'list:longest')

set('pumblend', 10)

set('signcolumn', 'yes:1')

vim.g.mapleader = ' '

return nil;

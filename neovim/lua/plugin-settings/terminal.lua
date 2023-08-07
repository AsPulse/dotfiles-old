local _terminal_lazygit = nil
local _terminal_aicommits = nil

local _terminal_worker = nil
local _terminal_worker_cwd = nil

local _terminal_server = nil

local function _terminal_worker_ready()
  if _terminal_worker == nil then
    _terminal_worker = require('toggleterm.terminal').Terminal:new({
      cmd = 'zsh',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 2,
    })
    _terminal_worker:spawn()
    _terminal_worker_cwd = vim.fn.getcwd()
  end
  if _terminal_worker_cwd ~= vim.fn.getcwd() then
    _terminal_worker_cwd = vim.fn.getcwd()
    _terminal_worker:change_dir(_terminal_worker_cwd)
  end
end

local function _terminal_worker_open()
  _terminal_worker_ready()
  _terminal_worker:open()
end

local function _terminal_lazygit_open()
  if _terminal_lazygit ~= nil then
    _terminal_lazygit:shutdown()
  end

  _terminal_lazygit = require('toggleterm.terminal').Terminal:new({
    cmd = 'zsh',
    dir = vim.fn.getcwd(),
    direction = 'float',
    hidden = true,
    count = 1,
  })

  _terminal_lazygit:open()
  _terminal_lazygit:send('lazygit && exit')

end

local function _terminal_aicommits_open()
  if _terminal_aicommits ~= nil then
    _terminal_aicommits:shutdown()
  end

  _terminal_aicommits = require('toggleterm.terminal').Terminal:new({
    cmd = 'zsh',
    dir = vim.fn.getcwd(),
    direction = 'float',
    hidden = true,
    count = 1,
  })

  _terminal_aicommits:open()
  _terminal_aicommits:send('aicommits -a -g 5 ; exit')
end

local function _terminal_server_open()
  if _terminal_server == nil then
    _terminal_server = require('toggleterm.terminal').Terminal:new({
      cmd = 'zsh',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 3,
      on_close = function()
        _terminal_server = nil
      end,
    })
  end
  _terminal_server:open()
end

local function _terminal_close()
  if _terminal_worker ~= nil then
    _terminal_worker:close()
  end
  if _terminal_server ~= nil then
    _terminal_server:close()
  end
end

return {
  {
    'akinsho/toggleterm.nvim',
    event = { 'VeryLazy' },
    init = function()
      vim.keymap.set('n', '<leader>git', _terminal_lazygit_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>aic', _terminal_aicommits_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>termw', _terminal_worker_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>terms', _terminal_server_open, { noremap = true, silent = true })
      vim.keymap.set('t', '\\n', '<C-\\><C-n>', { noremap = true, silent = true })
      vim.keymap.set({ 'n', 't' }, '\\q', _terminal_close, { noremap = true, silent = true })
    end,
    config = function()
      require('toggleterm').setup({
        start_in_insert = true,
        persist_mode = false,
      })
    end,
  },
}


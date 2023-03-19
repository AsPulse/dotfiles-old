local _terminal_worker = nil
local _terminal_worker_cwd = nil

local _terminal_server = nil

local _terminal_lazygit = nil
local _terminal_lazygit_cwd = nil

local function _terminal_worker_ready()
  if _terminal_worker == nil then
    _terminal_worker = require('toggleterm.terminal').Terminal:new({
      cmd = 'pwsh',
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

local function _terminal_lazygit_ready()
  if _terminal_lazygit ~= nil and _terminal_lazygit_cwd ~= vim.fn.getcwd() then
    _terminal_lazygit_cwd = vim.fn.getcwd()
    _terminal_lazygit:shutdown()
    _terminal_lazygit = nil
  end
  if _terminal_lazygit == nil then
    _terminal_lazygit = require('toggleterm.terminal').Terminal:new({
      cmd = 'lazygit',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 1,
    })
    _terminal_lazygit:spawn()
    _terminal_lazygit_cwd = vim.fn.getcwd()
  end
end

local function _terminal_lazygit_open()
  _terminal_lazygit_ready()
  _terminal_lazygit:open()
end

local function _terminal_server_open()
  if _terminal_server == nil then
    _terminal_server = require('toggleterm.terminal').Terminal:new({
      cmd = 'pwsh',
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
  if _terminal_lazygit ~= nil then
    _terminal_lazygit:close()
  end
  if _terminal_server ~= nil then
    _terminal_server:close()
  end
end

local function prepare()
  require('notify')('Preparing Terminal…', 'info', { title = 'ToggleTerm', timeout = 1000 })
  _terminal_worker_ready()
  _terminal_lazygit_ready()
end

return {
  {
    'akinsho/toggleterm.nvim',
    event = { 'VeryLazy' },
    init = function()
      vim.keymap.set('n', '<leader>git', _terminal_lazygit_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>termw', _terminal_worker_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>terms', _terminal_server_open, { noremap = true, silent = true })
      vim.keymap.set('t', '<leader>n', '<C-\\><C-n>', { noremap = true, silent = true })
      vim.keymap.set({ 'n', 't' }, '<leader>q', _terminal_close, { noremap = true, silent = true })
    end,
    config = function()
      require('toggleterm').setup({
        start_in_insert = true,
        persist_mode = false,
      })

      prepare()

      vim.api.nvim_create_autocmd({ 'DirChanged' }, {
        callback = prepare
      })

    end,
  },
}


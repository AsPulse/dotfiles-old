return {
  {
    'kevinhwang91/nvim-bqf',
    event = 'BufEnter *.*',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'TroubleToggle',
    init = function ()
      local options = { silent = true, noremap = true }
      vim.keymap.set('n', '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<cr>', options)
      vim.keymap.set('n', '<leader>dd', '<cmd>TroubleToggle document_diagnostics<cr>', options)
    end,
    config = function()
      require('trouble').setup({})
    end
  }
}

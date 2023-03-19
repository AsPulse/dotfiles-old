return {
  {
    'yuki-yano/tsnip.nvim',
    dependencies = {
      { 'vim-denops/denops.vim' },
      { 'yuki-yano/denops-lazy.nvim' },
      { 'MunifTanjim/nui.nvim' },
    },
    event = { 'InsertEnter' },
    cmd = { 'TSnip' },
    config = function()
      require('denops-lazy').load('tsnip.nvim', { wait_load = false })
    end,
  }
}

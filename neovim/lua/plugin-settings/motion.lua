
return {
  {
    'ggandor/lightspeed.nvim',
    event = 'BufEnter *.*', 
    init = function()
      vim.api.nvim_set_var('lightspeed_no_default_keymaps', true)
    end,
    config = function()
      vim.keymap.set('n', 's', '<Plug>Lightspeed_omni_s', { remap = true, expr = false, silent = false })
    end
  }
}


return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-f>',
            accept_word = '<C-w>',
            accept_line = '<C-l>',
            next = '<C-[>',
            prev = '<C-]>',
          }
        }
      })
    end
  }
}

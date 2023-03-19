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
            accept = '<M-f>',
            accept_word = '<M-w>',
            accept_line = '<M-l>',
          }
        }
      })
    end
  }
}

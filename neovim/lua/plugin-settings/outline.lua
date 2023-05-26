return {
  {
    'simrat39/symbols-outline.nvim',
    cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
    init = function()
      require('symbols-outline').setup({
        show_numbers = true,
      })
    end
  }
}

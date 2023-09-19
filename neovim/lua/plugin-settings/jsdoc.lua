return {
  {
    'heavenshell/vim-jsdoc',
    init = function()
      vim.g.jsdoc_lehre_path = vim.fn.expand('~/.volta/bin/lehre')
    end
  }
}

function file_exists(name)
   local f=io.open(name,'r')
   if f ~= nil then io.close(f) return true else return false end
end
return {
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require('mason-lspconfig').setup({
        ensure_installed = {
          'vtsls',
          'lua_ls',
          'denols',
          'clangd',
          'yamlls'
        },
        automatic_installation = true,
      })

      local null_ls = require('null-ls')
      local condition = function()
        local path = vim.fn.getcwd() .. '\\package.json'
        local isExists = file_exists(path)
        return isExists
      end
      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.eslint_d.with({ runtime_condition = condition }),
          null_ls.builtins.diagnostics.eslint_d.with({ runtime_condition = condition }),
          null_ls.builtins.formatting.eslint_d.with({ runtime_condition = condition }),
          null_ls.builtins.diagnostics.editorconfig_checker
        }
      })

      require('mason-null-ls').setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false
      })
    end
  },
  {
    'kkharji/lspsaga.nvim',
    event = 'BufEnter *.*',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function ()
      require('lspsaga').setup({})
      vim.keymap.set('n', '<leader>rn', function() vim.api.nvim_command('Lspsaga rename') end, {})
      vim.keymap.set('n', '<leader>ac', function() vim.api.nvim_command('Lspsaga code_action') end, {})
      vim.keymap.set('n', 'K', function() vim.api.nvim_command('Lspsaga hover_doc') end, {})
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'BufEnter *.*',
    config = function ()
      require('dressing').setup()
    end
  },
  {
    'folke/lsp-colors.nvim',
    event = 'BufEnter *.*',
  },
}

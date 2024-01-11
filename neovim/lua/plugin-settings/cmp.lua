return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'hrsh7th/nvim-cmp',
    event = { 'BufEnter *.*', 'CmdlineEnter', 'VeryLazy' },
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'onsails/lspkind.nvim' },
      { 'hrsh7th/vim-vsnip' },
      {
        'kento-ogata/cmp-tsnip',
        dependencies = {
          'yuki-yano/tsnip.nvim'
        }
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'yutkat/cmp-mocword' },
      { 'SmiteshP/nvim-navic' },
      {
        'simrat39/rust-tools.nvim'
      },
      { 'b0o/schemastore.nvim' },
    },
    config = function()
      local cmp = require('cmp')
      local lspconfig = require('lspconfig')
      cmp.setup({
        enabled = true,
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body);
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,CursorLine:CmpFloatingCursor,Search:None',
            col_offset = -3
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,Search:None',
          }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'tsnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'mocword' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({
              mode = 'symbol_text',
              menu = {
                tsnip = 'Snippet'
              },
              maxwidth = 50,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            if entry.source.name == 'tsnip' then
              kind.kind = ''
              kind.menu = 'Snippet'
              kind.kind_hl_group = 'CmpItemKindSnippet'
            else
              kind.kind = (strings[1] or '')
              kind.menu = (strings[2] or '')
            end
            kind.menu = '  (' .. kind.menu .. ')'
            return kind
          end,
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
      local navic = require('nvim-navic')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = function (client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local setupfunc = lspconfig[server_name]
          if server_name == 'csharp_ls' then
            setupfunc.setup({
              on_attach = on_attach,
              settings = {
                ["omniSharp"] = {
                  useGlobalMono = "always",
                }
              }
            })
            return
          end
          if server_name == 'tsserver' then
            setupfunc.setup({
              on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
                  buffer = bufnr,
                  callback = function()
                    if vim.fn.exists(':EslintFixAll') > 0 then
                      vim.cmd([[EslintFixAll]])
                    end
                  end
                })
              end,
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('yarn.lock', 'package-lock.json', 'pnpm-lock.json', 'pnpm-lock.yaml'),
              single_file_support = false,
            })
            return
          end
          if server_name == 'denols' then
            setupfunc.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
              single_file_support = false,
              init_options = {
                lint = true,
                unstable = true
              }
            })
            return
          end
          if server_name == 'lua_ls' then
            setupfunc.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }
                  }
                }
              }
            })
            return
          end
          if server_name == 'jsonls' then
            setupfunc.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                }
              }
            })
            return
          end
          if server_name == 'rust_analyzer' then
            local rt = require('rust-tools')
            rt.setup({
              server = {
                on_attach = function(client, bufnr)
                  on_attach(client, bufnr)
                  vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })
                  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
                    buffer = bufnr,
                    callback = function()
                      if vim.fn.exists(':RustFmt') > 0 then
                        vim.cmd([[RustFmt]])
                      else
                        print('rustfmt not found')
                      end
                    end
                  })
                end,
                settings = {
                  ['rust-analyzer'] = {
                    check = {
                      command = 'clippy'
                    },
                    lens = {
                      enable = true
                    },
                    checkOnSave = true,
                  }
                }
              },
            })
            return
          end
          if server_name == 'bashls' then
            setupfunc.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              filetypes = { 'sh', 'zsh' }
            })
            return
          end
          setupfunc.setup({ capabilities = capabilities, on_attach = on_attach })
        end
      })
    end
  }
}


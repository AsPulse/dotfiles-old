local function default_fern_compare(n1, n2)
  local k1 = n1.__key
  local k2 = n2.__key
  local t1 = n1.status > 0 and 1 or 0
  local t2 = n2.status > 0 and 1 or 0
  local l1 = #k1
  local l2 = #k2

  for index = 1, math.min(l1, l2) do
    if k1[index] == k2[index] then
      -- continue
    else
      local _t1 = index == l1 and t1 or 1
      local _t2 = index == l2 and t2 or 1
      if _t1 == _t2 then
        -- Lexical compare
        if k1[index] > k2[index] then
          return 1
        else
          return -1
        end
      else
        -- Directory first
        return _t1 == 1 and -1 or 1
      end
    end
  end

  -- Shorter first
  local r = vim.fn['fern#util#compare'](l1, l2)
  if r ~= 0 then
    return r
  end

  -- Leaf first
  return vim.fn['fern#util#compare'](n1.status == 0, n2.status == 0)
end

return {
  {
    'lambdalisue/fern.vim',
    cmd = { 'Fern', 'FernDo' },
    dependencies = {
      { 'antoinemadec/FixCursorHold.nvim' },
      {
        'lambdalisue/fern-renderer-nerdfont.vim',
        dependencies = {
          {
            'lambdalisue/nerdfont.vim',
          },
          'lambdalisue/glyph-palette.vim'
        },
      },
      {
        'lambdalisue/fern-git-status.vim',
      }
    },
    init = function()
      vim.api.nvim_set_var('fern#renderer', 'nerdfont')
      vim.api.nvim_set_var('fern#renderer#nerdfont#indent_markers', true)
      vim.api.nvim_set_var('fern#default_hidden', true)
      vim.keymap.set('n', '<C-f>', '<cmd>Fern . -reveal=%<cr>', { noremap = true })
      vim.keymap.set('n', '<M-f>', '<cmd>bufdo bd<cr><cmd>Fern . -reveal=%<cr>', { noremap = true })
    end,
    config = function()
      vim.fn['fern_git_status#init']()
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { 'fern' },
        callback = function()
          vim.keymap.set(
            'n', '<Plug>(fern-action-open)', '<Plug>(fern-action-open:select)',
            { buffer = true, remap = true}
          )
          vim.keymap.set(
            'n', 'D', '<Plug>(fern-action-remove)',
            { buffer = true, silent = true, remap = false }
          )
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.fn['glyph_palette#apply']()
        end
      })


      local scores = {
        ['.git'] = 4,
        [ 'node_modules' ] = 2,
        [ '.turbo' ] = 1,
        [ 'dist' ] = 1,
        [ 'index.ts' ] = -1,
        [ 'index.tsx' ] = -1,
        [ 'lib.ts' ] = -1,
        [ 'lib.tsx' ] = -1,
      }
      local comparator = function(a, b)
        local a_k = a.__key[#a.__key]
        local b_k = b.__key[#b.__key]
        local a_score = scores[a_k] or 0
        local b_score = scores[b_k] or 0
        if a_score == b_score then
          return default_fern_compare(a, b)
        else
          return b_score - a_score > 0 and 1 or -1
        end
      end

      vim.g['fern#comparators'] = vim.tbl_extend('force', vim.g['fern#comparators'], {
        customized = function()
          return { compare = comparator }
        end,
      })

      vim.g['fern#comparator'] = 'customized'

    end
  },
  {
    'lambdalisue/fern-hijack.vim',
  },
}

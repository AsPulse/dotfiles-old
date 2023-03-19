vim.api.nvim_create_user_command(
  'Gorepo',
  function(opts)
    vim.api.nvim_command('silent! cd $REPODIR/' .. opts.fargs[1] .. ' | silent! Fern .')
  end,
  {
    nargs = 1,
    complete = function(arg_lead, _, _)
      local complete_list = {}
      local fd = vim.loop.fs_scandir(vim.env['REPODIR'])
      for name in function() return vim.loop.fs_scandir_next(fd) end do
        if vim.startswith(name, arg_lead) then
          table.insert(complete_list, name)
        end
      end
      return complete_list;
    end
  }
)

return nil

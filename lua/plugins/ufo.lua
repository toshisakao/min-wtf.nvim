return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      -- How many levels deep to fold by default (99 means "don't fold")
      vim.opt.foldlevel = 99

      -- The initial fold level when opening a new buffer
      vim.opt.foldlevelstart = 99

      require('ufo').setup {
        open_fold_hl_timeout = 150,
        close_fold_kinds = {}, -- You can specify types to stay closed, but leave empty to keep all open
      }
    end,
  },
}

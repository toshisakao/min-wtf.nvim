return {
  {
    'Wansmer/treesj',
    keys = { '<leader>m', '<leader>j', '<leader>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup {
        -- vim.keymap.set('n', '<leader>m', require('treesj').toggle),
        max_join_length = 150,
      }
    end,
  },
}

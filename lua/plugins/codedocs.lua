return {
  {
    'jeangiraldoo/codedocs.nvim',
    config = function()
      require('codedocs').setup {
        default_styles = {
          lua = 'EmmyLua',
          python = 'reST',
        },
      }

      vim.keymap.set('n', '<leader>k', require('codedocs').insert_docs, { desc = 'Insert annotation' })
    end,
  },
}

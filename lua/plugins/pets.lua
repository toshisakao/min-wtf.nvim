return {
  {
    'giusgad/pets.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'giusgad/hologram.nvim',
        opts = {
          auto_display = true,
        },
      },
    },

    config = function()
      require('pets').setup {
        row = 9,
        col = 9999,
        speed_multiplier = 1,

        default_pet = 'dog',
        default_style = 'black',
        random = false,

        popup = {
          size = {
            width = '100%',
            height = '100%',
          },
          relative = 'editor',
          win_options = {
            winblend = 100,
          },
          -- avoid_statusline = false,
        },
      }
      -- vim.cmd.PetsNew 'kuro'
    end,
  },
}

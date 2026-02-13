return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- use latest release, remove to use latest commit
    ft = 'markdown',
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      -- ui = { enable = false },
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = 'Obsidian',
          path = '~/Documents/github/texts/Obsidian',
        },
      },
      -- see below for full list of options 👇
    },

    config = function(_, opts)
      vim.keymap.set('n', '<leader>og', '<CMD>Obsidian search<CR>')
      vim.keymap.set('n', '<leader>of', '<CMD>Obsidian quick_switch<CR>')
      vim.keymap.set('n', '<leader>ow', '<CMD>Obsidian workspace<CR>')
      vim.keymap.set('n', '<leader>ol', '<CMD>Obsidian links<CR>')
      vim.keymap.set('v', '<leader>ol', '<CMD>Obsidian link<CR>')
      vim.keymap.set('n', '<leader>or', '<CMD>Obsidian rename<CR>')
      vim.keymap.set('n', '<leader>oc', '<CMD>Obsidian toc<CR>')
      vim.keymap.set({ 'v', 'x' }, '<leader>on', '<CMD>Obsidian link_new<CR>')
      vim.keymap.set('n', '<leader>on', '<CMD>Obsidian new<CR>')
      vim.keymap.set('n', '<leader>ob', '<CMD>Obsidian backlinks<CR>')
      vim.keymap.set('n', '<leader>oo', '<CMD>Obsidian open<CR>')
      vim.keymap.set('v', '<leader>oe', '<CMD>Obsidian extract_note<CR>')
      vim.keymap.set('n', '<leader>ot', '<CMD>Obsidian tags<CR>')
      vim.keymap.set('n', '<leader>op', '<CMD>Obsidian paste_img<CR>')
      vim.opt.conceallevel = 2

      vim.opt.makeprg = 'pandoc % -o ./ignored_files/%:t:r.pdf'

      require('obsidian').setup(opts)
    end,
  },
}

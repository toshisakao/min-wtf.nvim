return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      require('render-markdown').setup {
        latex = {
          -- Turn on / off latex rendering.
          enabled = false,
          -- Additional modes to render latex.
          render_modes = true,
          -- Executable used to convert latex formula to rendered unicode.
          -- If a list is provided the commands run in order until the first success.
          converter = { 'utftex', 'latex2text' },
          -- Highlight for latex blocks.
          highlight = 'RenderMarkdownMath',
          -- Determines where latex formula is rendered relative to block.
          -- | above  | above latex block                               |
          -- | below  | below latex block                               |
          -- | center | centered with latex block (must be single line) |
          position = 'center',
          -- Number of empty lines above latex blocks.
          top_pad = 0,
          -- Number of empty lines below latex blocks.
          bottom_pad = 0,
        },
      }
    end,
  },
}

-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup {}
    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'

    npairs.add_rule(Rule('$', '$', { 'markdown', 'tex' }))
  end,
}

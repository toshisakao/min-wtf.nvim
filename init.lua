--[[
 `:help`.

MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
which is very useful when you're not exactly sure of what you're looking for.

I have left several `:help X` comments throughout the init.lua
These are hints about where to find more information about the relevant settings,
plugins or Neovim features used in Kickstart.
 -]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'

require 'keymaps'

require 'lazy-bootstrap'

require 'lazy-plugins'

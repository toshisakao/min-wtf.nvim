-- Here are the autocommands ig

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- japanese IME thingy
-- Changes to swedish keyboard when leaving Insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    os.execute 'ibus engine xkb:se::swe'
  end,
})

-- Sync IBus to whatever GNOME is currently showing when entering Insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    -- 1. Read the active input source from GNOME.
    -- GNOME returns something like: [('ibus', 'mozc-jp'), ('xkb', 'se')]
    -- The awk command extracts just the type and name of the first (active) item.
    local handle = io.popen("gsettings get org.gnome.desktop.input-sources mru-sources | awk -F\"'\" '{print $2, $4}'")
    if not handle then return end
    
    local result = handle:read("*a")
    handle:close()

    -- 2. Parse the result (e.g., "xkb se" or "ibus mozc-jp")
    local type, name = result:match("(%w+)%s+([%w%-]+)")

    if type and name then
      local engine = ""
      
      -- 3. Map GNOME's source to the exact IBus engine name
      if type == "xkb" then
        if name == "se" then
          engine = "xkb:se::swe" -- Maps to your preferred Swedish layout
        else
          engine = "xkb:" .. name .. "::" -- Fallback for other potential layouts
        end
      elseif type == "ibus" then
        engine = name -- For 'mozc-jp' (or just 'mozc'), the GNOME name matches IBus exactly
      end

      -- 4. Apply the engine asynchronously so Neovim doesn't stutter
      if engine ~= "" then
        os.execute("ibus engine " .. engine .. " > /dev/null 2>&1 &")
      end
    end
  end,
})

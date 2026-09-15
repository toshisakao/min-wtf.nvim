return {
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {
      -- Custom format string to open the output link provided with %s
      -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
      open_cmd = 'firefox %s -P typst-preview --class typst-preview',
      -- open_cmd = nil,

      dependencies_bin = {
        tinymist = vim.fn.stdpath 'data' .. '/mason/bin/tinymist',
        websocat = nil,
      },

      -- A list of extra arguments (or nil) to be passed to previewer.
      -- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
      extra_args = nil,

      -- This function will be called to determine the root of the typst project
      get_root = function(path_of_main_file)
        local root = os.getenv 'TYPST_ROOT'
        if root then
          return root
        end

        -- Look for a project marker so imports from parent dirs stay inside root
        local main_dir = vim.fs.dirname(vim.fn.fnamemodify(path_of_main_file, ':p'))
        local found = vim.fs.find({ 'typst.toml', '.git' }, { path = main_dir, upward = true })
        if #found > 0 then
          return vim.fs.dirname(found[1])
        end

        return main_dir
      end,

      -- This function will be called to determine the main file of the typst
      -- project.
      get_main_file = function(path_of_buffer)
        return path_of_buffer
      end,
    },
  },
}

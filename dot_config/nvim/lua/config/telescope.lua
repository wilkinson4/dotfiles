-- from telescope wiki/issue - use git_files if in git project; fall back to find_files if not
project_files = function()
  local in_git_repo = vim.fn.systemlist('git rev-parse --is-inside-work-tree')[1] == 'true'
  if in_git_repo then
    require('telescope.builtin').git_files({ show_untracked = true })
  else
    require('telescope.builtin').find_files()
  end
end

local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

require('telescope').setup({
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    generic_sorter = require('telescope.sorters').get_fzy_sorter,
    mappings = {
      i = {
        -- ["<esc>"] = actions.close,
        ['<c-f>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<a-a>'] = actions.select_all,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
          ['<c-d>'] = require('telescope.actions').delete_buffer,
        },
        i = {
          ['<c-d>'] = require('telescope.actions').delete_buffer,
        },
      },
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    },
    file_browser = {
      theme = "dropdown",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          ["-"] = fb_actions.backspace
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<f1>', function() builtin.help_tags() end)
vim.keymap.set('n', '<leader>f', project_files)
vim.keymap.set('n', '<leader>F', function() builtin.fd() end)

-- super search
vim.keymap.set('n', '<leader>?', function() builtin.live_grep() end) -- can't do regex
vim.keymap.set(
  'n',
  '<leader>/',
  function() builtin.grep_string({ search = vim.fn.input('Rg> '), use_regex = true }) end
)

-- super search for word under cursor
vim.keymap.set('n', '<leader>*', function() builtin.grep_string() end)

vim.keymap.set('n', '<leader>b', function() builtin.buffers() end)
vim.keymap.set('n', '<leader>B', function() builtin.current_buffer_fuzzy_find() end)

vim.keymap.set('n', '<leader><leader>', function() builtin.commands() end)
vim.keymap.set('n', '<leader>K', function() builtin.help_tags() end)

require('telescope').load_extension('ui-select')
require("telescope").load_extension "file_browser"

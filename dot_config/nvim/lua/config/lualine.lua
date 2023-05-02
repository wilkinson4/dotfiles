require('lualine').setup({
    options = { theme = 'material' },
    sections = {
      lualine_b = { 'branch', 'diff', 'diagnostics', require('github-notifications').statusline_notification_count },
    },
  })

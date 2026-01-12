return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = { theme = 'catppuccin' },
      sections = {
        lualine_b = { 'branch', 'diff', 'diagnostics', require('github-notifications').statusline_notification_count },
        lualine_x = {
          {
            'copilot',
            -- Default values
            symbols = {
              status = {
                hl = {
                  enabled = "#50FA7B",
                  sleep = "#AEB7D0",
                  disabled = "#6272A4",
                  warning = "#FFB86C",
                  unknown = "#FF5555"
                }
              },
            },
            show_colors = true
          },
          'encoding',
          'fileformat',
          'filetype'
        }
      },
    })
  end
}

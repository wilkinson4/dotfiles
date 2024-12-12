return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = { theme = 'material' },
      sections = {
        lualine_b = { 'branch', 'diff', 'diagnostics', require('github-notifications').statusline_notification_count },
      },
    })
  end
}

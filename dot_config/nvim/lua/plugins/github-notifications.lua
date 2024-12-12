return {
  "rlch/github-notifications.nvim",
  config = function()
    require("config.github-notifications")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

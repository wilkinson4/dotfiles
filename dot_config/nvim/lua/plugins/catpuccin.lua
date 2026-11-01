return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000
  ,
  config = function()
    vim.cmd("colorscheme catppuccin-mocha")
    require("catppuccin").setup({
      auto_integrations = true,
    })
  end
}

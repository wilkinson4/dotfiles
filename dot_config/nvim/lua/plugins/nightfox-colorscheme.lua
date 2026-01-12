return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      transparent = true,
      dim_inactive = true
    })

    -- vim.cmd("colorscheme nightfox")
  end,
}

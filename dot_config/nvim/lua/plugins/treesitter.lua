return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function() require("config.treesitter") end,
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}

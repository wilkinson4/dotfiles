return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function() require("config.treesitter") end,
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}

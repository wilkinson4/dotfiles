return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("config.cmp")
  end,
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    { "hrsh7th/cmp-buffer",   branch = "main" },
    { "hrsh7th/cmp-path",     branch = "main" },
    { "hrsh7th/cmp-nvim-lsp", branch = "main" },
    { "hrsh7th/cmp-nvim-lua", branch = "main" },
    { "hrsh7th/cmp-cmdline",  branch = "main" },
    { "petertriho/cmp-git",   dependencies = "nvim-lua/plenary.nvim" },
  }
}

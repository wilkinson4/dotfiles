require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
      model = 'gpt-5-mini'
    },
    inline = {
      adapter = "copilot",
      model = 'gpt-5-mini'
    },
    cmd = {
      adapter = "copilot",
      model = 'gpt-5-mini'
    }
  },
  -- adapters = {
  --   http = {
  --     opts = {
  --       copilot = function()
  --         return require("codecompanion.adapters").extend("copilot", {
  --           schema = {
  --             model = {
  --               default = "gpt-5-mini",
  --             },
  --           },
  --         })
  --       end,
  --     }
  --   }
  -- },
})

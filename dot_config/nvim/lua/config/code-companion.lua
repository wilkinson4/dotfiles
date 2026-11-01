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
  interactions = {
    background = {
      chat = {
        callbacks = {
          ["on_ready"] = {
            actions = {
              "interactions.background.builtin.chat_make_title",
            },
            -- Enable "on_ready" callback which contains the title generation action
            enabled = true,
          },
        },
        opts = {
          -- Enable background interactions generally
          enabled = true,
        },
      },
    },
  }
})

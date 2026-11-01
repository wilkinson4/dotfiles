local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local function buf_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
  end

  buf_keymap("n", "K", function()
    vim.lsp.buf.hover()
  end)
  buf_keymap("n", "gd", function()
    vim.lsp.buf.definition(client.name == "expert" and { on_list = expert_on_list(client, true) } or nil)
  end)
  buf_keymap("n", "1gd", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition(client.name == "expert" and { on_list = expert_on_list(client, true) } or nil)
  end)
  buf_keymap("n", "<c-]>", function()
    vim.lsp.buf.declaration()
  end)
  buf_keymap("n", "gD", function()
    vim.lsp.buf.implementation()
  end)
  buf_keymap("n", "<c-k>", function()
    vim.lsp.buf.signature_help()
  end)
  buf_keymap("n", "1gD", function()
    vim.lsp.buf.type_definition()
  end)
  buf_keymap("n", "sr", function()
    vim.lsp.buf.references()
  end)
  buf_keymap("n", "gA", function()
    vim.lsp.buf.code_action()
  end)
  buf_keymap("v", "gA", function()
    vim.lsp.buf.range_code_action()
  end)
  buf_keymap("n", "sd", function()
    vim.diagnostic.open_float()
  end)

  buf_keymap("n", "<f3>", function()
    vim.lsp.buf.rename()
  end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
  "bashls",
  "clangd",
  "dockerls",
  "expert",
  "eslint",
  "fish_lsp",
  "gh_actions_ls",
  "gopls",
  "lua_ls",
  "nil_ls",
  "postgres_lsp",
  "pylsp",
  "rust_analyzer",
  "svelte",
  "vimls",
  "nginx_language_server",
  "biome",
  "tailwindcss",
}

local configs = {
  expert = {
    settings = {
      compileOnType = false,
    },
  },
  -- elixirls = {
  --   cmd = {
  --     (
  --       vim.env.ELIXIR_LS_EXECUTABLE
  --       or (vim.loop.os_homedir() .. '/.local/share/nvim/mason/bin/elixir-ls')
  --     ),
  --   },
  --   settings = {
  --     dialyzerEnabled = true,
  --   }
  -- },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  eslint = {
    options = {
      validate = {
        "javascript",
        "javascriptreact",
        "svelte",
        "typescript",
        "typescriptreact",
      },
    },
  },
  svelte = {
    settings = {
      root_pattern = { "package.json", "tsconfig.json", "tsconfig.jsonc", "node_modules" },
    },
  },
  -- kotlin_language_server = {
  --   init_options = {
  --     storagePath = require('lspconfig/util').path.join(vim.env.XDG_DATA_HOME, "nvim-data"),
  --   }
  -- },
  nil_ls = {
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  },
  nginx_language_server = {
    filetypes = { "nginx", "nginx.conf.template" },
  },
}

for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  config.capabilities = capabilities

  vim.lsp.config[lsp] = config
  vim.lsp.enable(lsp)
end

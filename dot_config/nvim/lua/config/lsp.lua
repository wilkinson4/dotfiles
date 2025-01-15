local lspconfig = require('lspconfig')

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function buf_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
  end

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end

  buf_keymap('n', 'K', function() vim.lsp.buf.hover() end)
  buf_keymap('n', 'gd', function() vim.lsp.buf.definition() end)
  buf_keymap('n', '1gd', function()
    vim.cmd('vsplit')
    vim.lsp.buf.definition()
  end)
  buf_keymap('n', '<c-]>', function() vim.lsp.buf.declaration() end)
  buf_keymap('n', 'gD', function() vim.lsp.buf.implementation() end)
  buf_keymap('n', '<c-k>', function() vim.lsp.buf.signature_help() end)
  buf_keymap('n', '1gD', function() vim.lsp.buf.type_definition() end)
  buf_keymap('n', 'sr', function() vim.lsp.buf.references() end)
  buf_keymap('n', 'gW', function() vim.lsp.buf.workspace_symbol() end)
  buf_keymap('n', 'gA', function() vim.lsp.buf.code_action() end)
  buf_keymap('v', 'gA', function() vim.lsp.buf.range_code_action() end)
  buf_keymap('n', 'sd', function() vim.diagnostic.open_float() end)
  buf_keymap('n', '<f4>',
    function() vim.lsp.buf.format({ async = true, filter = function(client) return client.name ~= "typescript-tools" end }) end)
  buf_keymap('v', '<f4>', function() vim.lsp.buf.range_formatting({}) end)

  buf_keymap('n', '<f3>', function() vim.lsp.buf.rename() end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  'elixirls',
  -- 'lexical',
  'eslint',
  'rust_analyzer',
  'dockerls',
  'bashls',
  'lua_ls',
  'gopls',
  'svelte',
  'clangd',
  'pylsp',
  'sqlls',
  'nil_ls',
  'gh_actions_ls',
  'fish_lsp',
}

local configs = {
  elixirls = {
    cmd = {
      (
        vim.env.ELIXIR_LS_EXECUTABLE
        or (vim.loop.os_homedir() .. '/.local/share/nvim/mason/bin/elixir-ls')
      ),
    },
    settings = {
      dialyzerEnabled = true,
    }
  },
  -- lexical = {
  --   cmd = { vim.loop.os_homedir() .. "/.local/share/nvim/mason/bin/lexical", "server" },
  --   root_dir = lspconfig.util.root_pattern { "mix.exs" },
  -- },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false
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
        "typescriptreact"
      }
    }
  },
  svelte = {
    settings = {
      root_pattern = { "package.json", "tsconfig.json", "tsconfig.jsonc", "node_modules" }
    },
  },
  sqlls = {
    root_dir = function()
      return vim.loop.cwd()
    end,
    connections = {
      {
        name = "member_doc_local",
        adapter = "postgres",
        host = "localhost",
        port = 5432,
        user = "postgres",
        password = "postgres",
        database = "member_doc_api_dev",
      }
    }
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
    }
  }
}

for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  config.capabilities = capabilities

  lspconfig[lsp].setup(config)
end

lspconfig.vimls.setup({
  -- don't want to override built-in keybinds for vim
  capabilities = capabilities,
})

-- lspconfig.sqls.setup({
--   on_attach = function(client, bufnr)
--     require('sqls').on_attach(client, bufnr)
--     on_attach(client, bufnr)
--   end,
-- })

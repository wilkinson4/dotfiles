local lspconfig = require('lspconfig')

-- server capabilities in spec
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
local function has_attached_server(server_name)
  for _, server in ipairs(vim.lsp.buf_get_clients()) do
    if server.name == server_name then
      return true
    end
  end

  return false
end

local function prefer_eslint_formatter(client)
  if has_attached_server('eslint') then
    return client.name ~= 'tsserver'
  else
    return true
  end
end

local function get_package_manager()
  print('dir: ' .. vim.fn.system('pwd'))
  local packageManager = vim.fn.system('node ~/.config/nvim/scripts/detect-node-package-manager.js ' .. vim.fn.system('pwd'))
  print('packageManager: ', packageManager)
  return packageManager
end


local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function buf_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
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
  buf_keymap('n', 'g0', function() vim.lsp.buf.document_symbol() end)
  buf_keymap('n', 'gW', function() vim.lsp.buf.workspace_symbol() end)
  buf_keymap('n', 'gA', function() vim.lsp.buf.code_action() end)
  buf_keymap('v', 'gA', function() vim.lsp.buf.range_code_action() end)
  buf_keymap('n', 'sd', function() vim.diagnostic.open_float() end)

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end

  if client.server_capabilities.documentFormattingProvider then
    buf_keymap('n', '<f4>',
      function()
        vim.lsp.buf.format({
          async = true,
          filter = prefer_eslint_formatter
        })
      end)
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    buf_keymap('v', '<f4>',
      function() vim.lsp.buf.range_formatting({ filter = prefer_eslint_formatter }) end)
  end

  buf_keymap('n', '<f3>', function() vim.lsp.buf.rename() end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = { 'elixirls', 'eslint', 'tsserver', 'rust_analyzer', 'dockerls', 'bashls', 'gdscript', 'lua_ls' }

local configs = {
  elixirls = {
    cmd = {
      (
      vim.env.ELIXIR_LS_EXECUTABLE
      or (vim.loop.os_homedir() .. '/.tools/elixir-ls/language_server.sh')
      ),
    },
    settings = {
      dialyzerEnabled = true,
    }
  },
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
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  eslint = {
    settings = {
      packageManager = 'auto'
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

return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<f4>",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "eslint_d", "prettier", stop_after_first = true },
      javascriptreact = { "eslint_d", "prettier", stop_after_first = true },
      typescriptreact = { "eslint_d", "prettier", stop_after_first = true },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      elixir = { "mix", lsp_format = "prefer" },
      pgsql = { "pg_format" },
      rust = { "rustfmt" },
      sql = { "pg_format" },
      xhtml = { "xmllint" },
      xml = { "xmllint" },
      yaml = { "prettier" },
      nginx = { "nginx_config_formatter" },
      fish = { "fish_indent"}
    },
    -- format_on_save = {
    --   lsp_format = "never",
    -- },
    formatters = {
      mix = {
        env = {
          MIX_QUIET = "1",
        },
      },
      pg_format = {
        append_args = {
          "--comma-start",
          "--comma-break",
          "--spaces",
          "2",
          "--keyword-case",
          "1",
          "--wrap-after",
          "1",
          "--placeholder",
          '":: "',
        },
      },
      xmllint = {
        append_args = { "--format", "-" },
      },
      stylua = {
        append_args = { "--indent-width", "2", "--indent-type", "Spaces" },
      },
    },
  },
}

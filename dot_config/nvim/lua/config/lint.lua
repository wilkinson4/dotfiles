require("lint").linters.mix_format = {
  name = "mix_format",
  cmd = "mix",
  stdin = true,
  args = { "format", "--check-formatted" },
  ignore_exitcode = true,
  stream = "stderr",
  parser = function(output)
    local issues = {}

    if output and output ~= "" then
      table.insert(issues, {
        message = "File is not formatted",
        lnum = 0,
        end_lnum = 1,
        col = 0,
        severity = vim.diagnostic.severity.WARN,
        source = "mix_format",
      })
    end

    return issues
  end,
}

require("lint").linters_by_ft = {
  javascript = { "eslint_d", "biomejs", "stylelint" },
  elixir = { "credo" },
  sh = { "shellcheck" },
}

local lint_group = vim.api.nvim_create_augroup("ConfigLint", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = lint_group,
  callback = function(args)
    if vim.bo[args.buf].filetype ~= "elixir" then
      require("lint").try_lint()
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_group,
  callback = function(args)
    if vim.bo[args.buf].filetype == "elixir" then
      require("lint").try_lint()
    end
  end,
})

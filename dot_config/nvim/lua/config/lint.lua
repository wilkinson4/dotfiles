require('lint').linters.mix_format = {
  name = 'mix_format',
  cmd = 'mix',
  stdin = true,
  args = { 'format', '--check-formatted' },
  ignore_exitcode = true,
  stream = 'stderr',
  parser = function(output)
    local issues = {}

    if output and output ~= '' then
      table.insert(issues, {
        message = 'File is not formatted',
        lnum = 0,
        end_lnum = 1,
        col = 0,
        severity = vim.diagnostic.severity.WARN,
        source = 'mix_format',
      })
    end

    return issues
  end,
}

require('lint').linters_by_ft = {
  javascript = { 'eslint_d' },
  elixir = { 'credo' },
  sh = { 'shellcheck' },
}

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    require("lint").try_lint()
  end,
})

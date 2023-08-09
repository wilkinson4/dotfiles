require('lint').linters.mix_format = {
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

local errorfmt = '[%t] %. %f:%l:%c %m, [%t] %. %f:%l %m'

require('lint').linters.credo = {
  cmd = 'mix',
  stdin = true,
  args = { 'credo', 'list', '--format=oneline', '--read-from-stdin', '--strict' },
  stream = 'stdout',
  ignore_exitcode = true, -- credo only returns 0 if there are no errors
  parser = require('lint.parser').from_errorformat(errorfmt)
}

require('lint').linters_by_ft = {
  javascript = { 'eslint_d' },
  lua = { 'luacheck' },
  elixir = { 'mix_format', 'credo' },
  sh = { 'shellcheck' },
}

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  callback = function()
    require("lint").try_lint()
  end,
})

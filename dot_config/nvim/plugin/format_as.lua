local format_as = function(args, mods, start_line, end_line, opts)
  local filetype = args
  local config = require('formatter.config')
  local formatters = config.formatters_for_filetype(filetype)
  if require('formatter.util').is_empty(formatters) then
    require('formatter.log').info(string.format("No formatter defined for %s files", filetype))
    return
  end

  -- Get the content to format
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Detect the base indentation from the first non-empty line
  local base_indent = ""
  for _, line in ipairs(lines) do
    if line:match("%S") then -- first line with non-whitespace content
      base_indent = line:match("^%s*") or ""
      break
    end
  end

  -- Remove the base indentation from all lines for formatting
  local unindented_lines = {}
  for _, line in ipairs(lines) do
    if line:match("%S") then -- non-empty line
      local unindented = line:gsub("^" .. base_indent:gsub("([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1"), "", 1)
      table.insert(unindented_lines, unindented)
    else
      table.insert(unindented_lines, "")
    end
  end

  local content = table.concat(unindented_lines, '\n')

  local configs = vim.tbl_map(function(config)
    if type(config) == "table" then
      return config
    else
      return config()
    end
  end, formatters)

  -- Run the formatter on the content directly
  for _, formatter_config in ipairs(configs) do
    if formatter_config.exe then
      local cmd = formatter_config.exe
      local args = formatter_config.args or {}
      local stdin = formatter_config.stdin or false

      if stdin then
        -- Use vim.fn.system to pipe content through the formatter
        local formatted = vim.fn.system(cmd .. ' ' .. table.concat(args, ' '), content)
        if vim.v.shell_error == 0 then
          -- Split the formatted content back into lines
          local formatted_lines = vim.split(formatted, '\n')
          -- Remove the last empty line if it exists
          if formatted_lines[#formatted_lines] == '' then
            table.remove(formatted_lines)
          end

          -- Re-apply the base indentation to each formatted line
          local reindented_lines = {}
          for _, line in ipairs(formatted_lines) do
            if line:match("%S") then -- non-empty line
              table.insert(reindented_lines, base_indent .. line)
            else
              table.insert(reindented_lines, "")
            end
          end

          -- Replace the original selection
          vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, reindented_lines)
        else
          require('formatter.log').error("Formatter failed: " .. formatted)
        end
      end
    end
  end
end

vim.api.nvim_create_user_command('FormatAs', function(opts)
  format_as(opts.args, opts.mods, opts.line1, opts.line2)
end, {
  nargs = 1,
  range = true,
  bar = true,
  complete = 'filetype'
})

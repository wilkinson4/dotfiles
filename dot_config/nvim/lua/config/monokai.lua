local monokai = require('monokai')
local palette = monokai.pro
monokai.setup {
  palette = monokai.pro,
  custom_hlgroups = {
    GitSignsChange = {
      fg = palette.purple
    },
    GitSignsCurrentLineBlame = {
      fg = palette.grey
    },
    sqlKeyword = {
      fg = palette.red
    },
    sqlSpecial = {
      fg = palette.red
    },
    jsxComponentName = {
      fg = palette.red
    },
    jsxTagName = {
      fg = palette.red
    },
    jsFuncArgs = {
      fg = palette.orange
    },
    jsFuncParens = {
      fg = palette.orange
    },
    jsFuncBraces = {
      fg = palette.red
    },
    jsObjectBraces = {
      fg = palette.orange
    },
    jsBrackets = {
      fg = palette.red
    },
    jsVariableDef = {
      fg = palette.purple
    },
    jsDestructuringBraces = {
      fg = palette.yellow
    },
    jsDestructuringBlock = {
      fg = palette.orange
    },
    jsxBraces = {
      fg = palette.yellow
    },
    jsParensIfElse = {
      fg = palette.yellow
    },
    jsParens = {
      fg = palette.yellow
    },
    jsBraces = {
      fg = palette.green
    },
    jsIfElseBraces = {
      fg = palette.yellow
    },
    jsArrowFunction = {
      fg = palette.red
    },
    jsExportDefault = {
      fg = palette.red
    },
    jsObjectSeparator = {
      fg = palette.grey
    },
    jsTemplateBraces = {
      fg = palette.green
    },
    jsNoise = {
      fg = palette.grey
    },
    jsFuncArgCommas = {
      fg = palette.grey
    },
    jsImport = {
      fg = palette.red
    },
    jsFrom = {
      fg = palette.red
    },
    elixirAtom = {
      fg = palette.purple
    },
    elixirMapDelimiter = {
      fg = palette.orange
    },
    elixirTupleDelimiter = {
      fg = palette.orange
    },
    elixirStringDelimiter = {
      fg = palette.grey
    },
    elixirListDelimiter = {
      fg = palette.red
    },
    elixirInclude = {
      fg = palette.red
    }
  }
}

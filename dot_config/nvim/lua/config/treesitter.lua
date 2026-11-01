local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

local parsers = {
  "bash",
  "bibtex",
  "c",
  "c_sharp",
  "clojure",
  "cmake",
  "comment",
  "commonlisp",
  "cooklang",
  "cpp",
  "css",
  "dockerfile",
  "dot",
  "eex",
  "elixir",
  "elm",
  "erlang",
  "fish",
  "fortran",
  "gdscript",
  "gitcommit",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitignore",
  "gleam",
  "glsl",
  "go",
  "godot_resource",
  "gomod",
  "gosum",
  "gowork",
  "graphql",
  "groovy",
  "haskell",
  "heex",
  "html",
  "http",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "kotlin",
  "latex",
  "llvm",
  "lua",
  "make",
  "markdown",
  "nginx",
  "nu",
  "ocaml",
  "ocaml_interface",
  "ocamllex",
  "perl",
  "php",
  "python",
  "query",
  "regex",
  "ruby",
  "rust",
  "scala",
  "scss",
  "sql",
  "surface",
  "svelte",
  "swift",
  "teal",
  "tlaplus",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
  "yaml",
  "zig",
  "zsh"
}

require("nvim-treesitter").setup()
require("nvim-treesitter").install(parsers)

local syntax_on = {
  elixir = true,
  eelixir = true,
}

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype
    if ft == "gitcommit" then
      vim.bo[bufnr].syntax = "gitcommit"
      return
    end

    local started = pcall(vim.treesitter.start, bufnr)

    if started then
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    if syntax_on[ft] then
      vim.bo[bufnr].syntax = "on"
    end
  end,
})

return parsers

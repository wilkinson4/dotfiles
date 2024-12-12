local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

require("nvim-treesitter.configs").setup({
  endwise = {
    enable = true,
  },
  ensure_installed = {
    "bash", "bibtex", "c", "c_sharp", "clojure", "cmake", "comment", "commonlisp", "cooklang", "cpp",
    "css",
    "dockerfile", "dot", "eex", "elixir",
    "elm", "erlang", "fish", "fortran", "gdscript", "gleam", "glsl", "go", "godot_resource", "gomod",
    "gowork",
    "graphql", "haskell", "heex",
    "html", "http", "java", "javascript", "jsdoc", "json", "kotlin", "latex", "llvm", "lua", "make",
    "norg", "ocaml",
    "ocaml_interface",
    "ocamllex", "perl", "php", "python", "query", "regex", "ruby", "rust", "scala", "scss", "surface",
    "svelte",
    "swift", "teal", "tlaplus",
    "toml", "tsx", "typescript", "vim", "vue", "yaml", "zig", "vimdoc"
    -- "markdown", -- experimental
  },
  highlight = {
    enable = true
  },
  indent = { enable = true }
})

local syntax_on = {
  elixir = true,
  eelixir = true
}

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype
    pcall(vim.treesitter.start)

    if syntax_on[ft] then
      vim.bo[bufnr].syntax = "on"
    end
  end,
})

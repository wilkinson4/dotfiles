require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash', 'bibtex', 'c', 'c_sharp', 'clojure', 'cmake', 'comment', 'commonlisp', 'cooklang', 'cpp', 'css',
        'dockerfile', 'dot', 'eex', 'elixir',
        'elm', 'erlang', 'fish', 'fortran', 'gdscript', 'gleam', 'glsl', 'go', 'godot_resource', 'gomod', 'gowork',
        'graphql', 'haskell', 'heex',
        'html', 'http', 'java', 'javascript', 'jsdoc', 'json', 'kotlin', 'latex', 'llvm', 'lua', 'make', 'norg', 'ocaml',
        'ocaml_interface',
        'ocamllex', 'perl', 'php', 'python', 'query', 'regex', 'ruby', 'rust', 'scala', 'scss', 'surface', 'svelte',
        'swift', 'teal', 'tlaplus',
        'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml', 'zig', 'help'
        -- 'markdown', -- experimental
    },
    highlight = {
        enabled = true, -- false will disable the whole extension
        disable = {} -- list of language that will be disabled
    },
    playground = { enable = true },
    autotag = { enable = true },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --     max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --     disable = {"lua"}
    --     -- colors = {}, -- table of hex strings
    --     -- termcolors = {} -- table of colour name strings
    -- }
}

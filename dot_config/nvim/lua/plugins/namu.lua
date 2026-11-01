return {
    "bassamsdata/namu.nvim",
    opts = {
        global = { },
        namu_symbols = { -- Specific Module options
            options = {},
        },
    },
    -- === Suggested Keymaps: ===
    vim.keymap.set("n", "g0", ":Namu symbols<cr>", {
        desc = "Jump to LSP symbol",
        silent = true,
    }),
    vim.keymap.set("n", "gW", ":Namu workspace<cr>", {
        desc = "LSP Symbols - Workspace",
        silent = true,
    })
}

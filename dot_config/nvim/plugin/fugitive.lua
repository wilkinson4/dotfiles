vim.keymap.set("n", "<leader>gs", "<CMD>Git<cr>")
vim.keymap.set("n", "<leader>ga", "<cmd>Gwrite<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit -v<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Git --paginate log<cr>")
vim.keymap.set("v", "<leader>gl", "<cmd>GlogRange<cr>")
vim.keymap.set("n", "<leader>gL", "<cmd>Git --paginate log -p %<cr>")
vim.keymap.set("v", "<leader>gL", "<cmd>GlogRange<cr>")
vim.keymap.set("n", "<leader>gr", "<cmd>Git rebase -i --autosquash<cr>")


-- git push and fetch using Dispatch - :Dispatch git push
vim.api.nvim_command(
	"command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .fnameescape(FugitiveGitDir()) 'git push' <q-args>")
vim.api.nvim_command(
	"command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' .fnameescape(FugitiveGitDir()) 'git fetch' <q-args>")

vim.api.nvim_command("command! -nargs=* Gpushf execute('Gpush --force-with-lease '.expand(<q-args>))")
vim.api.nvim_command("command! -nargs=* Gpc execute('Gpush --set-upstream origin '.FugitiveHead().' '.<q-args>)")

-- amend without editing commit message
vim.api.nvim_create_user_command("Gamend", "Git commit --amend --no-edit", { bang = true })


function git_blame_line()
	line = vim.fn.getcurpos()[2]

	vim.cmd("Git log -L " .. line .. "," .. line .. ":%")
end

function git_blame_line_range()
	local s_start = vim.fn.getpos("'<")[2]
	local s_end = vim.fn.getpos("'>")[2]

	vim.cmd("Git log -L " .. s_start .. "," .. s_end .. ":%")
end

vim.keymap.set("n", "<leader>gB", "<cmd>lua git_blame_line()<cr>")
vim.keymap.set("v", "<leader>gB", "<cmd>lua git_blame_line_range()<cr>")

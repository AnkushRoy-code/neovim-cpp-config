vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- vim.keymap.set("n", "<up>", "<C-a>", { desc = "Increment" })
-- vim.keymap.set("n", "<down>", "<C-x>", { desc = "Decrement" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "next buffer" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- move the cursor to specific widnow
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- maps for colemak  users
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-n>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-e>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-i>", "<C-w>l", { desc = "switch window right" })

vim.keymap.set("n", "n", "j", { desc = "left" })
vim.keymap.set("n", "N", "n", { desc = "left" })
vim.keymap.set("n", "m", "h", { desc = "down" })
vim.keymap.set("n", "e", "k", { desc = "up" })
vim.keymap.set("n", "i", "l", { desc = "right" })
vim.keymap.set("n", "h", "N", { desc = "switch window right" })
vim.keymap.set("n", "l", "i", { desc = "switch window right" })

-- File explorer
vim.keymap.set("n", "<leader>fe", "<cmd>Oil<cr>", { desc = "Open File explorer(OIL)" })

-- resize the panes of window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				-- buftypes_to_ignore = { "neo-tree", "outline" }, -- list of buffer types what should not be deleted from current session
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
			pre_save_cmds = { "Neotree close" },
			post_restore_cmds = { "Neotree filesystem show" },
		})
		vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
			noremap = true,
			desc = "Search Sessions",
		})
	end,
}

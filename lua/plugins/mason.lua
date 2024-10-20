return {
	{
		-- Package manager for LSPs not optional, but very useful.
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Bridges the gap between lspconfig and mason.
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"rust_analyzer",
					-- "lua_ls",
				},
			})
		end,
	},
}

return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {
			ignore = "^$",
		},
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",

		opts = {},
        -- stylua: ignore
        keys = {
            { "k",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",

		config = function()
			-- Ensure termguicolors is enabled if not already
			vim.opt.termguicolors = true

			require("nvim-highlight-colors").setup({
				render = "background",
				enable_named_colors = true,
				enable_tailwind = false,
			})
		end,
	},

	{
		-- File Explorer
		"stevearc/oil.nvim",
		event = "VeryLazy",
		opts = {
			default_file_explorer = true,
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},

	{
		-- Getting removed pretty fast
		"hedyhli/outline.nvim",
		event = "VeryLazy",
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {},
		config = function()
			local highlight = {
				"Aero",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "Aero", { fg = "#7CB9E8" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#4D9EC9" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2E7CA6" }) -- done
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#175E85" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#05476B" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#06367D" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#012B69" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "rust", "glsl", "lua", "vim", "vimdoc" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]oggle" },
			})
		end,
	},
}

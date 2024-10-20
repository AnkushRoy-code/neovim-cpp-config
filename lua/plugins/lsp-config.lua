return {
	{
		-- Has predefined configurations for LSPs?
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
			vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

			-- Beautiful borders around LSP stuff like hover/signature_help
			local border = {
				{ "┌", "FloatBorder" },

				{ "─", "FloatBorder" },

				{ "┐", "FloatBorder" },

				{ "│", "FloatBorder" },

				{ "┘", "FloatBorder" },

				{ "─", "FloatBorder" },

				{ "└", "FloatBorder" },

				{ "│", "FloatBorder" },
			}

			-- LSP settings (for overriding per client)
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
				handlers = handlers,
			})

			lspconfig.glsl_analyzer.setup({
				filetypes = { "glsl", "vert", "tese", "frag", "geom", "comp", "vs", "fs" },
				handlers = handlers,
			})

			-- adding filetypes to get glsl things
			vim.filetype.add({
				extension = {
					vert = "glsl",
					tesc = "glsl",
					tese = "glsl",
					frag = "glsl",
					geom = "glsl",
					comp = "glsl",
					vs = "glsl",
					fs = "glsl",
				},
			})

			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {},
				},
				handlers = handlers,
			})

			lspconfig.lua_ls.setup({
				handlers = handlers,
			})

			-- These lsp keybinds only load when an LSP is attatched to the buffer.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")

					map("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")

					map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")

					map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap.

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end,
			})
		end,
	},
}

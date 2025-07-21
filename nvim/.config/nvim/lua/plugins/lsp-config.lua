return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls","bashls","basedpyright", "clangd","cssls","html","jsonls", "pylsp","rust_analyzer","taplo", "tailwindcss", "emmet_language_server", "ast_grep", "gopls"}	})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = {'vim'}
						}
					}
				},
				capabilities = capabilities
			})
			lspconfig.emmet_language_server.setup({ 
				capabilities = capabilities
			})
			lspconfig.bashls.setup({	capabilities = capabilities
			})
			lspconfig.basedpyright.setup({	capabilities = capabilities
			})

			lspconfig.clangd.setup({	capabilities = capabilities
			})

			lspconfig.cssls.setup({	capabilities = capabilities
			})
			lspconfig.html.setup({	capabilities = capabilities
			})
			lspconfig.jsonls.setup({	capabilities = capabilities
			})
			lspconfig.rnix.setup({	capabilities = capabilities
			})
			lspconfig.pylsp.setup({	capabilities = capabilities
			})
			lspconfig.ts_ls.setup({	capabilities = capabilities
			})
			lspconfig.rust_analyzer.setup({	capabilities = capabilities
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.ast_grep.setup({ capabilities = capabilities
			})
			lspconfig.gopls.setup({ capabilities = capabilities
			})
			lspconfig.taplo.setup({	capabilities = capabilities})
			vim.diagnostic.config({
				virtual_text  = true,
				signs = true ,
				underline = true ,
				update_in_insert = false,
				severity_sort = true
			})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,{})
			vim.keymap.set("n", 'ga', vim.lsp.buf.declaration, {})
			vim.keymap.set({ 'n', 'v' },'<leader>ca', vim.lsp.buf.code_action, {})
		end

	}

}


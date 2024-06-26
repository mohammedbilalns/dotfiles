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
				ensure_installed = { "lua_ls","texlab","bashls","basedpyright", "gopls", "clangd", "quick_lint_js","cssls","html","jsonls", "rnix","pylsp", "tsserver","vtsls","rust_analyzer"}	})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.texlab.setup({	capabilities = capabilities
			})
			lspconfig.bashls.setup({	capabilities = capabilities
			})
			lspconfig.basedpyright.setup({	capabilities = capabilities
			})
			lspconfig.gopls.setup({	capabilities = capabilities
			})
			lspconfig.clangd.setup({	capabilities = capabilities
			})
			lspconfig.quick_lint_js.setup({	capabilities = capabilities
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
			lspconfig.tsserver.setup({	capabilities = capabilities
			})
			lspconfig.vtsls.setup({	capabilities = capabilities
			})
			lspconfig.rust_analyzer.setup({	capabilities = capabilities
			})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' },'<leader>ca', vim.lsp.buf.code_action, {})
		end

	}

}


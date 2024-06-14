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
				ensure_installed = { "lua_ls","texlab","bashls","basedpyright", "gopls", "clangd", "quick_lint_js","cssls","html","jsonls", "rnix","pylsp", "tsserver","vtsls"}	})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.texlab.setup({})
			lspconfig.bashls.setup({})
			lspconfig.basedpyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.quick_lint_js.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.rnix.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.vtsls.setup({})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' },'<leader>ca', vim.lsp.buf.code_action, {})
		end

	}

}


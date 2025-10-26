return {

	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--indent-width", "2" },
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--tab-width", "2" },
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {desc = "Format buffer"})
	end,
}

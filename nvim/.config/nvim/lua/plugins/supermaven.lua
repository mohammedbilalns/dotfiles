return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
		vim.keymap.set("n", "<leader>a", vim.cmd.SupermavenToggle, { desc = "Toggle Supermaven" })
	end,
}

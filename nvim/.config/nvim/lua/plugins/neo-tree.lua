return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim"
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
			},
		},
	},
	config = function()
		vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')


	end
}

return { {'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	local builtin = require("telescope.builtin")
	vim.keymap.set('n', '<leader>rg', builtin.live_grep, {desc ="Search text in Project"})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "List open Buffers"})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Search help tags"})
	end
	},
	{
	'nvim-telescope/telescope-ui-select.nvim',
	config = function()
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}

require("telescope").load_extension("ui-select")
	end 
}}



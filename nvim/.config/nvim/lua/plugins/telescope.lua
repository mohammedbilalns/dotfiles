return { {'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	local builtin = require("telescope.builtin")
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>ft', builtin.current_buffer_fuzzy_find, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


	end

	},
	{
	'nvim-telescope/telescope-ui-select.nvim',
	config = function()
		-- This is your opts table
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



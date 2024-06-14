return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup{
			options ={
				theme = 'codedark'
			},
			tabline = {
  lualine_a = {'buffers'},
  lualine_b = {'branch'},
  lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {'tabs'}
}


		}

	end
}

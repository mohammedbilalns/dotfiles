return {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-T>]],
      direction = 'float',
			float_opts = {
				border = "curved"
			}
    })
  end
}

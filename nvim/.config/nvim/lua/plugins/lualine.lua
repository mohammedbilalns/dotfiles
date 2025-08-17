return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup{
			options ={
				theme =  'tokyonight', -- 'codedark'
               	component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" }
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = " ", right = "" }, icon = "" },
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = false,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = { clients_lsp },
				lualine_z = {
					{ "location", separator = { left = "", right = " " }, icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {
  lualine_a = {'buffers'},
}


		}

	end
}











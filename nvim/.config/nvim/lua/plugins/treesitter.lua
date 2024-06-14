return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()

          require'nvim-treesitter.configs'.setup {
	  ensure_installed = { "c", "lua", "vim", "vimdoc", "latex", "rust", "bash" },
	  highlight = { enable = true,
			  disable = { "latex"}
			},
	  indent = {enable = true},
	

}



	end

}

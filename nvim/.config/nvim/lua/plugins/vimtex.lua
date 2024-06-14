return {

	"lervag/vimtex",
  init = function()
		vim.g.tex_flavour = 'latex'
		vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_quickfix_mode = 0
		vim.cmd("set conceallevel=1 ")

  end


}

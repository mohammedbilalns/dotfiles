return{ 
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {

	},
	config = function ()
		require("ibl").setup({
	--indent = { char = "┊" },
    scope = { enabled = true},

    exclude = {
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
		"tex"
      },
    },
  })
	end

}

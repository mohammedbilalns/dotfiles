return {
	{ "nvchad/volt" , lazy = true },
	{ "nvchad/menu" , lazy = true },
	config = function ()

		require("menu").open(vim.options, vim.opts)
		vim.keymap.set("n", "<C-m>", function()
  require("menu").open("default")
end, {})
	end
}

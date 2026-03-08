return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
      disable_inline_completion = true
    })
		vim.keymap.set("n", "<leader>a", function()
      vim.cmd("SupermavenToggle")
      vim.cmd("redrawstatus")
    end, { desc = "Toggle Supermaven" })
	end,
}

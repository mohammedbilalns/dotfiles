return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
	local oil = require("oil")
    oil.setup()

    vim.keymap.set("n", "<C-n>", function()
      if vim.bo.filetype == "oil" then
        vim.cmd("bd") -- Close current buffer if it's Oil
      else
        vim.cmd("Oil") -- Open Oil otherwise
      end
    end, { desc = "Toggle Oil file browser", noremap = true, silent = true })	
	end
}

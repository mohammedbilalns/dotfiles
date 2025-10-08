
return{
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false, 
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		hints = {enabled= true},
		lazygit = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		terminal = { enabled = false },
		picker = {enabled = true}
	},
	keys = {
		{ "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>rg", function() Snacks.picker.grep() end, desc = "Grep" }, 
		{ "<leader>ft", function() Snacks.picker.lines() end, desc = "Buffer Lines" }, 
		{ "<leader>st", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" }, -- map to st 
		{ "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" }, 
		{ "<leader>sc",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" }, 
		{ "<leader>nh",  function() Snacks.notifier.show_history() end, desc = "Notification History" }, -- map to notifiction history 
		{ "<leader>hn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

	},
}

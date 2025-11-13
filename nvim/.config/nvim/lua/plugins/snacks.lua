
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
    --pickers 
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>rg", function() Snacks.picker.grep() end, desc = "Search text in project" },
		{ "<leader>ft", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    {"<leader>fw", function() Snacks.picker.grep_word() end, desc = "Find string under cursor in project"},
    {"<leader>fb", function() Snacks.picker.buffers() end, desc = "List open buffers"},
		{ "<leader>st", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" }, 
    {"<leader>fh", function () Snacks.picker.help() end, desc="Search help tags"},
    {"<leader>fo", function() Snacks.picker.todo_comments() end, desc = "show todo comments"},

		{ "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
		{ "<leader>sc",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>nl",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
		{ "<leader>nh", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

	},
}

return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/projects/*",
      "~/.config/*",
    },
    picker = {
      type = "telescope", 
    }
  },
  init = function()
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- optional picker
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    -- optional picker
    { "ibhagwan/fzf-lua" },
    -- optional picker
    { "folke/snacks.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
  config = function()
    require("session_manager").setup({
      autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir, -- only autoload session for current dir
    })
  end,
}

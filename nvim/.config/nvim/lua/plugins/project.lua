return {
  "coffebar/neovim-project",
  lazy = false,
  priority = 100,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "Shatur/neovim-session-manager",
  },
  config = function()
    vim.opt.sessionoptions:append("globals")

    require("neovim-project").setup({
      projects = {
        "~/projects/*",
        "~/.config/*",
        "~/upstride-backend/*",
        "~/upstride-frontend/",
      },
      picker = { type = "snacks" },
      forget_project_keys = { i = "<C-d>", n = "d" },
      last_session_on_startup = true,
    })

    -- Session manager config
    require("session_manager").setup({
      autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
    })

    vim.keymap.set("n", "<leader>p", "<cmd>NeovimProjectHistory<CR>", { desc = "Switch Project" })
  end,
}


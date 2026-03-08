return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        { "<leader>b", group = "Buffers" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>l", group = "LSP/Tools" },
        { "<leader>n", group = "Notifications" },
        { "<leader>o", group = "Open" },
        { "<leader>r", group = "Ripgrep" },
        { "<leader>s", group = "System" },
        { "<leader>t", group = "Terminal" },
        { "<leader>u", group = "Tabs" },
        { "<leader>x", group = "Trouble" },
      })
    end,
  },
}

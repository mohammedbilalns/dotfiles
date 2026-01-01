return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  branch = "master",
  dependencies = {
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "latex" },
      },
      indent = { enable = true },
      fold = { enable = true },
      ensure_installed = {
         "lua", "vim", "vimdoc", "bash",
        "json", "python", "yaml", "dockerfile", "gitignore","go"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}



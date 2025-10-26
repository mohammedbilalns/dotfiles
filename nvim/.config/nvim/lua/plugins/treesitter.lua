return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  branch = "master",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    },
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
        "c", "lua", "vim", "vimdoc", "latex", "rust", "bash",
        "json", "javascript", "typescript", "tsx", "prisma",
        "python", "yaml", "dockerfile", "gitignore"
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


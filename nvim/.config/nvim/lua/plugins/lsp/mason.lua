return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "tsgo",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "emmet_ls",
      "prismals",
      "ruff",
      "eslint",
      "gopls",
      "rust_analyzer",
      "astro",
    }
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {}
    },
    "neovim/nvim-lspconfig"
  }
}


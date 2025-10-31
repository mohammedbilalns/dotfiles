return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "emmet_ls",
      "prismals",
      "pyright",
      "eslint",
      "gopls"
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


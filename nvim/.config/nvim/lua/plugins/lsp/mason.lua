return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "ts_ls",
      "lua_ls",

    }
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts={}
    },
    "neovim/nvim-lspconfig"
  }
}

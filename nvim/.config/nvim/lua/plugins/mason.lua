return {
  "williamboman/mason.nvim",
  config = function(_, opts)
    require("mason").setup(opts)
  end,
  opts = {
    ensure_installed = {
      -- LSPs from your existing config
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

      -- DAPs we need
      "js-debug-adapter",
      "delve",
    },
  },
}

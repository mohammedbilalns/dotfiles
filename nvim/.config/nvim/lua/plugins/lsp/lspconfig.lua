return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set global defaults for all LSP servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Configure TypeScript/JavaScript server
    vim.lsp.config("tsgo", {
      settings = {
        typescript = {
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            includeCompletionsForImportStatements = true,
          },
        },
        javascript = {
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            includeCompletionsForImportStatements = true,
          },
        },
      },
    })

    -- Explicitly keep ts_ls disabled and tsgo enabled.
    pcall(vim.lsp.enable, "ts_ls", false)
    vim.lsp.enable("tsgo")
  end,
}

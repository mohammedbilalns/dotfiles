local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local buf = ev.buf

    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { buffer = buf, silent = true, desc = "Show LSP references" })
    keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, silent = true, desc = "Go to declaration" })
    --keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, silent = true, desc = "Show LSP definition" })
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = buf, silent = true, desc = "Show LSP implementations" })
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = buf, silent = true, desc = "Show LSP type definitions" })
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, silent = true, desc = "See available code actions" })
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, silent = true, desc = "Smart rename" })
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { buffer = buf, silent = true, desc = "Show buffer diagnostics" })
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = buf, silent = true, desc = "Show line diagnostics" })
    keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { buffer = buf, silent = true, desc = "Go to previous diagnostic" })
    keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { buffer = buf, silent = true, desc = "Go to next diagnostic" })
    keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, silent = true, desc = "Show documentation for what is under cursor" })
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", { buffer = buf, silent = true, desc = "Restart LSP" })
  end,
})
-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})

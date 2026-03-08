local keymap = vim.keymap

local function snacks_picker(name, opts)
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.picker and snacks.picker[name] then
    snacks.picker[name](opts or {})
    return
  end
  vim.notify("Snacks picker unavailable: " .. name, vim.log.levels.WARN)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local buf = ev.buf

    keymap.set("n", "gR", function()
      snacks_picker("lsp_references")
    end, {
      buffer = buf, silent = true, desc = "Show LSP references"
    })
    keymap.set("n", "gD", vim.lsp.buf.declaration, {
      buffer = buf, silent = true, desc = "Go to declaration"
    })
    --keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, silent = true, desc = "Show LSP definition" })
    keymap.set("n", "gi", function()
      snacks_picker("lsp_implementations")
    end, { buffer = buf, silent = true, desc = "Show LSP implementations" })
    keymap.set("n", "gt", function()
      snacks_picker("lsp_type_definitions")
    end, { buffer = buf, silent = true, desc = "Show LSP type definitions" })
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, silent = true, desc = "LSP Code Actions" })
    keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = buf, silent = true, desc = "LSP Rename" })
    keymap.set("n", "<leader>lb", function()
      snacks_picker("diagnostics_buffer")
    end, { buffer = buf, silent = true, desc = "LSP Buffer Diagnostics" })
    keymap.set("n", "<leader>ll", vim.diagnostic.open_float, { buffer = buf, silent = true, desc = "LSP Line Diagnostics" })
    keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { buffer = buf, silent = true, desc = "Go to previous diagnostic" })
    keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { buffer = buf, silent = true, desc = "Go to next diagnostic" })
    keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, silent = true, desc = "Show documentation for what is under cursor" })
    keymap.set("n", "<leader>ls", ":LspRestart<CR>", { buffer = buf, silent = true, desc = "LSP Restart" })
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

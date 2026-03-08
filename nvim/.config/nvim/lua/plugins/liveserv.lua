return {
  "barrett-ruth/live-server.nvim",
  build = "pnpm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    { "<leader>ss", "<cmd>LiveServerStart<CR>", desc = "Start Live Server" },
    { "<leader>sk", "<cmd>LiveServerStop<CR>", desc = "Stop Live Server" },
  },
}

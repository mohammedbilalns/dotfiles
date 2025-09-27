return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      "<C-n>",
      function()
        vim.cmd("Oil")
      end,
      desc = "Toggle Oil file browser"
    }
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  }
}

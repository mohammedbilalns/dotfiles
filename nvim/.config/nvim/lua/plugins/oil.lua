return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      "<C-n>",
      function()
        if vim.bo.filetype == "oil" then
          vim.cmd("bd")
        else
          vim.cmd("Oil")
        end
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

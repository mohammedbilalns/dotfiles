return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local oil = require("oil")
    oil.setup({
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<C-n>", function()
      if vim.bo.filetype == "oil" then
        vim.cmd("bd")
      else
        vim.cmd("Oil")
      end
    end, { desc = "Toggle Oil file browser", noremap = true, silent = true })
  end
}


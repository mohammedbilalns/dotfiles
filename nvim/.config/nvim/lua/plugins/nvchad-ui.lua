return {
  {
    "nvzone/volt",
    lazy = true,
  },
  {
    "nvzone/menu",
    lazy = true,
  },
  {
    "NvChad/base46",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "NvChad/ui",
    branch = "v3.0",
    lazy = false,
    dependencies = {
      "NvChad/base46",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("base46").load_all_highlights()
      vim.cmd.colorscheme("nvchad")
      require("nvchad")

      local toggle_float_term = function()
        require("nvchad.term").toggle({
          pos = "float",
          id = "floatTerm",
          float_opts = {
            border = "rounded",
          },
        })
      end

      local toggle_bottom_term = function()
        require("nvchad.term").toggle({
          pos = "bo sp",
          id = "bottomTerm",
          size = 0.3,
        })
      end

      local toggle_vertical_term = function()
        require("nvchad.term").toggle({
          pos = "vsp",
          id = "verticalTerm",
          size = 0.4,
        })
      end

      vim.keymap.set({ "n", "t", "i" }, "<C-t>", toggle_float_term, { desc = "Toggle Floating Terminal" })
      vim.keymap.set("n", "<leader>tt", toggle_bottom_term, { desc = "Toggle Bottom Terminal" })
      vim.keymap.set("n", "<leader>tv", toggle_vertical_term, { desc = "Toggle Vertical Terminal" })
      vim.keymap.set("n", "<leader>tT", toggle_float_term, { desc = "Toggle Floating Terminal" })
      vim.keymap.set("n", "<leader>ot", toggle_float_term, { desc = "Open Floating Terminal" })
    end,
  },
}

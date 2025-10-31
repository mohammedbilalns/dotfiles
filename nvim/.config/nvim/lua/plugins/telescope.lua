return { {'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {"nvim-telescope/telescope-fzf-native.nvim", build="make"}
  },
  config = function()
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap

    keymap.set('n', '<leader>rg', builtin.live_grep, {desc ="Search text in Project"})
    keymap.set('n', '<leader>fb', builtin.buffers, {desc = "List open Buffers"})
    keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Search help tags"})
    keymap.set("n","<leader>fc",builtin.grep_string, {desc = "Find string under cursor in cwd"})
    keymap.set("n","<leader>fo", "<cmd>TodoTelescope<cr>", {desc="Find todos"})
    keymap.set("n", "<leader>fz", "<cmd>TodoTelescope<CR>", { desc = "Todo Comments" })
  end
},
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }

      require("telescope").load_extension("ui-select","fzf")
    end
  }}



return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      "<C-n>",
      function()
        vim.cmd("Oil")
        vim.api.nvim_create_autocmd('BufEnter',{
          desc="Open Oil on directory",
          group=vim.api.nvim_create_augroup("oil-start", { clear = true}),
          callback = function()
            local bufname = vim.api.nvim_buf_get_name(0)
            if vim.fn.isdirectory(bufname) == 1 then
              vim.defer_fn(function()
                require('oil').open(bufname)
              end, 0)
            end
          end
        })
      end,
      desc = "Toggle Oil file browser"
    }
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    delete_to_trash = true
  }
}

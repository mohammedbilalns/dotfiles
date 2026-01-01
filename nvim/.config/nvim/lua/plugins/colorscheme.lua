return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      comments = {italic = true}
    },
    config = function()
      vim.cmd[[colorscheme tokyonight-night]]
    end
  }
}

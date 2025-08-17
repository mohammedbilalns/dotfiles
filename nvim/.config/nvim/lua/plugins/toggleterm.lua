return {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-T>]],
      direction = 'tab'
    })
  end
}
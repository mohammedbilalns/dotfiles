
return {

  '0x00-ketsu/autosave.nvim',
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require('autosave').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end




}

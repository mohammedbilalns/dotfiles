
return {

  '0x00-ketsu/autosave.nvim',
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require('autosave').setup {
          }
  end


}

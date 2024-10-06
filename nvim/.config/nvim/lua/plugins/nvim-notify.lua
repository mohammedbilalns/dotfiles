
return {
"rcarriga/nvim-notify",
  event = "VeryLazy",
 config = function()
  require("notify").setup({
    timeout = 200,
  })
end



}





-- Open help files in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L"
})

-- syntax highlighting for dotenv 
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup('dotenv_ft', {clear = true}),
  pattern = { ".env", ".env.*"},
  callback = function()
    vim.bo.filetype = "dosini"
  end
})

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


local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd "silent w"

      local time = os.date "%I:%M %p"

      -- print nice colored msg
      vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})

      clear_cmdarea()
    end
  end,
})

-- -- highlight yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
-- 	pattern = "*",
-- 	desc = "highlight selection on yank",
-- 	callback = function()
-- 		vim.highlight.on_yank({ timeout = 200, visual = true })
-- 	end,
-- })
--
-- -- show cursorline only in active window disable
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
-- 	group = "active_cursorline",
-- 	callback = function()
-- 		vim.opt_local.cursorline = false
-- 	end,
-- })

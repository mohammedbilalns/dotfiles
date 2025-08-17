
vim.cmd([[ 
	set shiftwidth=4
	set tabstop=4
]])
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.wo.number = true
vim.keymap.set('n', '<leader>y', '"+y', {})
function StackNextBuffer()
  local bufs = vim.fn.getbufinfo({buflisted = 1})
  if #bufs < 2 then return end
  local current_bufnr = vim.fn.bufnr('%')
  local current_idx
  for i, buf in ipairs(bufs) do
    if buf.bufnr == current_bufnr then
      current_idx = i
      break
    end
  end
  if not current_idx then return end
  local next_idx = (current_idx % #bufs) + 1
  local next_bufnr = bufs[next_idx].bufnr
  vim.cmd('botright sbuffer ' .. next_bufnr)
  vim.cmd('wincmd p')
end

vim.keymap.set('n', '<C-,>', StackNextBuffer, { noremap = true, silent = true })
vim.keymap.set('n', '<C-.>', ':q<CR>', { noremap = true, silent = true })



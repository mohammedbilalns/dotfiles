vim.cmd([[ 
	set shiftwidth=2
	set tabstop=2
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
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = '1'
vim.opt.fillchars:append { fold = ' ' }

function FoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart
  local fold_text = string.format(' %s', line)
  local fold_width = vim.fn.strwidth(fold_text)
  local win_width = vim.fn.winwidth(0)
  local line_count_text = string.format(' (%d lines) ', line_count)
  local line_count_width = vim.fn.strwidth(line_count_text)
  local padding = win_width - fold_width - line_count_width
  if padding < 0 then padding = 0 end
  return fold_text .. string.rep(' ', padding) .. line_count_text
end

vim.opt.foldtext = 'v:lua.FoldText()'
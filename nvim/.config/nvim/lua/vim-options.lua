-- general configurations 
vim.cmd([[ 
	set shiftwidth=2
	set tabstop=2
]]) --configure default shift and tab stop width 
vim.g.mapleader = " " --configure leader key 
vim.opt.termguicolors = true 
vim.opt.cursorline = true --highlighs the current line to improve visibility 
vim.wo.number = true --show the line number
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = '1'
vim.opt.fillchars:append { fold = ' ' }

-- KeyBindings 
vim.keymap.set('v', '<leader>y', '"+y', {})

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



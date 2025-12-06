local opt = vim.opt
-- line numbers
opt.relativenumber = true
opt.number = true
-- tabs & indentation
opt.tabstop = 2 --  2 spaces for tabs 
opt.shiftwidth = 2 -- 2 spaces for indend width 
opt.expandtab = true -- expand tab to space  
opt.autoindent = true -- copy indent from current line when starting a new one  
opt.wrap  = true -- keep the line wrapping on   
-- search settings 
opt.ignorecase = true -- ignore case when searching 
opt.smartcase = true -- assumes case sensitive for mixed case search  
-- cursor 
opt.cursorline = true --highlighs the current line to improve visibility 
-- appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column on the left 
-- backspace 
opt.backspace = "indent,eol,start" -- ? 
-- clipboard 
opt.clipboard:append("unnamedplus") -- system clipboard as default register 
-- window splitting
opt.splitright = true -- vertical window to the right
opt.splitbelow = true -- horizontal window to the bottom  
-- vim.wo.number = true --show the line number
-- folding 
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99
opt.foldcolumn = '1'
opt.fillchars:append { fold = ' ' }

-- cutstom folding 
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

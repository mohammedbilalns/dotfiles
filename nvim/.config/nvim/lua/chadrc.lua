---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  transparency = true,
}

M.term = {
  float = {
    row = 0.08,
    col = 0.08,
    width = 0.84,
    height = 0.8,
    border = "rounded",
  },
}

M.ui = {
  cmp = {
    icons_left = true,
    style = "default",
    abbr_maxwidth = 60,
    format_colors = {
      lsp = true,
      icon = "󱓻",
    },
  },
  tabufline = {
    enabled = true,
    lazyload = false,
  },
  statusline = {
    enabled = true,
    theme = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "supermaven", "cwd", "cursor" },
    modules = {
      supermaven = function()
        local ok, api = pcall(require, "supermaven-nvim.api")
        if not ok then
          return ""
        end

        local status = api.is_running() and "SM: ON " or "SM: OFF "
        return "%#St_Lsp# 󰗚 " .. status
      end,
    },
  },
}

return M

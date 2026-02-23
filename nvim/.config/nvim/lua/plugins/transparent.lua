return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "OilNormal",
        "TroubleNormal",
        "TelescopeNormal",
        "TelescopeBorder",
        "LspFloatWinNormal",
        "NoiceLspProgressTitle",
        "NoiceLspProgressClient",
        "NoiceLspProgressSpinner",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "lualine_c_normal",
        "lualine_c_insert",
        "lualine_c_visual",
        "lualine_c_replace",
        "lualine_c_command",
        "lualine_c_inactive",
      },
    })
  end,
}

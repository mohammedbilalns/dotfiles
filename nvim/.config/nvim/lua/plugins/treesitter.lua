return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "latex", "rust", "bash",
                "javascript", "typescript", "tsx", "prisma", "python"
            },
            highlight = {
                enable = true,
                disable = { "latex" },
            },
            indent = {
                enable = true,
            },
            fold = {
                enable = true,
            },
        }
    end
}

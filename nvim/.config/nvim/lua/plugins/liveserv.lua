return     {
        'barrett-ruth/live-server.nvim',
        build = 'npm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true,

	vim.keymap.set('n', '<leader>lss', ':LiveServerStart<CR>', { noremap = true, silent = true }),
vim.keymap.set('n', '<leader>lsk', ':LiveServerStop<CR>', { noremap = true, silent = true })
    }


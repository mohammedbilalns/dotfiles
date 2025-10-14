return     {
	'barrett-ruth/live-server.nvim',
	build = 'pnpm add -g live-server',
	cmd = { 'LiveServerStart', 'LiveServerStop' },
	config = true,

	vim.keymap.set('n', '<leader>lss', ':LiveServerStart<CR>', { desc="Start Live Server", noremap = true, silent = true }),
	vim.keymap.set('n', '<leader>lsk', ':LiveServerStop<CR>', { desc="Stop Live Server", noremap = true, silent = true })
}


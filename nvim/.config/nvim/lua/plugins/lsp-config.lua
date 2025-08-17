return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = false
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Keymaps
				local opts = { noremap=true, silent=true, buffer=bufnr }
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", 'ga', vim.lsp.buf.declaration, opts)
				vim.keymap.set({ 'n', 'v' },'<leader>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', '<leader>i', function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { desc = "Toggle inlay hints" })

				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
				end
			end

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = {'vim'}
						}
					}
				},
				capabilities = capabilities,
				on_attach = on_attach,
			})

			local servers = { "emmet_language_server", "bashls", "basedpyright", "clangd", "cssls", "html", "jsonls", "rnix", "rust_analyzer", "tailwindcss", "ast_grep", "gopls", "taplo", "postgres_lsp", "prismals", "vala_ls" }
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					on_attach = on_attach,
					capabilities = capabilities,
				}
			end

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = { enabled = "none" },
							parameterTypes = { enabled = false },
							variableTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = false },
							functionLikeReturnTypes = { enabled = false },
							enumMemberValues = { enabled = false },
						}
					},
					javascript = {
						inlayHints = {
							parameterNames = { enabled = "none" },
							parameterTypes = { enabled = false },
							variableTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = false },
							functionLikeReturnTypes = { enabled = false },
							enumMemberValues = { enabled = false },
						}
					}
				}
			})

			vim.diagnostic.config({
				virtual_text  = true,
				signs = true ,
				underline = true ,
				update_in_insert = false,
				severity_sort = true
			})
		end

	}

}


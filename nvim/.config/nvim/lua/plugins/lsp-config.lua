local vim = vim 
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
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local base_config = {
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				on_attach = function(client, bufnr)
					vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", 'ga', vim.lsp.buf.declaration, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', '<leader>i', function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
					end, { desc = "Toggle inlay hints", buffer = bufnr })

					if client.supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
					end
				end,
			}

			vim.lsp.enable("lua_ls", vim.tbl_deep_extend("force", base_config, {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			}))

			vim.lsp.enable("basedpyright", vim.tbl_deep_extend("force", base_config, {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "off"
						}
					}
				}
			}))

			vim.lsp.enable("ts_ls", vim.tbl_deep_extend("force", base_config, {
				settings = {
					typescript = {
						suggest = {
							autoImports = true
						},
						preferences = {
							importModuleSpecifier = "relative",
							allowTextChangesInNewFiles = true,
						},
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
						suggest = {
							autoImports = true
						},
						preferences = {
							importModuleSpecifier = "relative",
							allowTextChangesInNewFiles = true,
						},
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
			}))

			local servers = { "emmet_language_server", "bashls", "basedpyright", "clangd", "cssls", "html", "jsonls", "rnix", "rust_analyzer", "tailwindcss", "ast_grep", "gopls", "taplo", "postgres_lsp", "prismals", "vala_ls" }
			for _, lsp in ipairs(servers) do
				vim.lsp.enable(lsp, base_config)
			end

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true
			})
		end
	}
}


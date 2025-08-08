return{
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {},
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{name = 'nvim_lsp'},
				},
				cmp_select = {behavior = cmp.SelectBehavior.Select},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
					['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
					['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = 'yes'
		end,
		config = function()
			local lsp_defaults = require('lspconfig').util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = {buffer = event.buf}

					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
					vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
					vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					--vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				end,
			})

--------	require('lspconfig').arduino_language_server.setup({
--------		cmd = {
--------			"arduino-language-server",
--------			"-clangd",		"usr/bin/clangd",
--------			"-cli",			"/usr/bin/arduino-cli",
--------			"-cli-config",	"/home/wonebone/.arduino15/arduino-cli.yaml",
--------			"-fqbn",		"esp8266:esp8266:nodemcuv2"
--------		}
--------	})

			require('mason-lspconfig').setup({
				ensure_installed = {'clangd', 'arduino_language_server', 'texlab'},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"

					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,


				}
			})
		end
	}
}

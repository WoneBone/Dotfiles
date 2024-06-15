return {
	'neoclide/coc.nvim',
	branch = 'release',
	config = function()
		-- Autocomplete
		function _G.check_back_space()
			local col = vim.fn.col('.') - 1
			return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
		end
		-- Use Tab for trigger completion with characters ahead and navigate
		local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
		vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
		vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
		-- Use `[g` and `]g` to navigate diagnostics
		-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
		vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", {silent = true})
		vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", {silent = true})

		-- GoTo code navigation
		vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
		vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
		vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
		vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
	end
}

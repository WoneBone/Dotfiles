return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vimdoc", "python", "markdown", "markdown_inline", "latex" },
          sync_install = false,
          highlight = {
			  enable = true,
	  },
          indent = { enable = true },  
			vim.cmd("hi Comment guifg=NvimLightGreen")
        })
    end
 }
